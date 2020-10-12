# Секреты и хитрости программирования на FreeBASIC'е

В этой статье собраны советы по написанию быстрого и компактного кода. Некоторые советы специфичны для фрибейсика, некоторые для всех языков программирования, некоторые для операционной системы Windows.


## Общие оптимизации

### Функция Iif

Часто бывает целесообразным заменить блок `If … Then … Else` более компактной функцией `Iif`:

```FreeBASIC
' Длинный код
If a = 3 Then
	b = 4
Else
	b = 5
End If

' Короткий код
b = Iif(a = 3, 4, 5)
```

### Обмен значениями двух переменных

Для обмена значениями двух переменных подойдёт функция `Swap`:

```FreeBASIC
Swap(a, b)
```

Обмен значений через оператор `Xor` имеет два недостатка:

* медленно;
* если переменные равны, то они обнулятся.


### Используй оператор Const как можно чаще

Замечательное свойство оператора `Const` состоит в том, что он накладывает определённое ограничение: данный объект не должен модифицироваться, – и компилятор будет проводить это ограничение в жизнь. `Const позволяет указать компилятору и программистам, что определённая величина должна оставаться неизменной. Во всех подобных случаях необходимо обозначать это явным образом, призывая себе на помощь компилятор и гарантируя тем самым, что ограничение не будет нарушено.

Во‐вторых, константы убирают из кода «магические числа». Такое число само по себе не несёт никакого смысла и может вызвать недоумение, встретившись в коде программы без соответствующего контекста или комментария, при этом попытка изменить его на другое, даже близкое по значению, может привести к абсолютно непредсказуемым последствиям. Магическими числа — плохая практика программирования, когда в исходном тексте встречается числовое значение и неочевидно, что оно означает. Например, такой фрагмент будет плохим:

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
DrawSprite(53, 320, 240)
</code></p>

<p>Человеку, который не является автором программы, трудно сказать, что такое 53, 320 или 240. Но если этот код переписать, всё становится на свои места:</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="keyword">Const</span> SCREEN_WIDTH <span class="keyword">As</span> <span class="datatype">Integer</span> = 640<br />
<span class="keyword">Const</span> SCREEN_HEIGHT <span class="keyword">As</span> <span class="datatype">Integer</span> = 480<br />
<span class="keyword">Const</span> SCREEN_X_CENTER <span class="keyword">As</span> <span class="datatype">Integer</span> = SCREEN_WIDTH \ 2<br />
<span class="keyword">Const</span> SCREEN_Y_CENTER <span class="keyword">As</span> <span class="datatype">Integer</span> = SCREEN_HEIGHT \ 2<br />
<span class="keyword">Const</span> SPRITE_CROSSHAIR <span class="keyword">As</span> <span class="datatype">Integer</span> = 53<br />
<br />
DrawSprite(SPRITE_CROSSHAIR, SCREEN_X_CENTER, SCREEN_Y_CENTER)
</code></p>

<p>Кроме того, магические числа — потенциальный источник ошибок в программе:</p>

<ul>
<li>если одно и то же магическое число используется в программе более одного раза (или потенциально может использоваться), то его изменение потребует правок каждого вхождения (вместо одной правки значения именованной константы); если будут исправлены не все вхождения, возникнет как минимум одна ошибка;</li>
<li>как минимум в одном из вхождений магическое число может быть написано с ошибкой изначально, и это довольно сложно обнаружить;</li>
<li>магическое число может зависеть от неявного параметра или другого магического числа, если эти зависимости, не выделенные явно, не будут удовлетворены, возникнет как минимум одна ошибка;</li>
<li>при модификации вхождений одного магического числа можно ошибочно изменить другое магическое число, независимое, но имеющее то же числовое значение.</li>
</ul>


## Строки

### Использование строковых констант

Необходимо использовать строковые константы везде (желательно в заголовочных файлах). Это исключает дублирование. Все строковые константы хранятся в секции .data. При использовании строковых литералов прямо в коде высока вероятность повторения одних и тех же данных несколько раз, что увеличит размер секции .data.

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="keyword">Const</span> MyConst = <span class="string">&quot;Это константа&quot;</span>
</code></p>

Компилятор сам определит тип строки: юникодная <code>WString</code> или простая <code>ZString</code> на основании определения <code>#define unicode</code>.

### Быстрая очистка (обнуление) строки

Для этого достаточно присвоить 0 первому символу в строке, то есть символу под индексом 0:

```FreeBASIC
Dim Value As WString * (MAX_BUFFER_LENGTH + 1) = Any

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="keyword">Dim</span> Value <span class="keyword">As</span> <span class="datatype">WString</span> * BufferSize = <span class="keyword">Any</span><br />
Value[0] = 0
</code></p>

<h3><a id="c2c3">Получение символа в строке</a></h3>

<p>Новички нередко используют функцию <code>Mid</code> для получения единственного символа в строке, однако есть способ проще.</p>

<p>Строка — это массив символов, следовательно, к ней можно применять индексирование по указателю.</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Строка длиной в 99 символов (+1 на нулевой)</span><br />
<span class="keyword">Dim</span> s <span class="keyword">As</span> <span class="datatype">WString</span> * (99 + 1)<br />
<span class="remark">&apos; Получение первого символа в строке</span><br />
<span class="keyword">Dim</span> Char <span class="keyword">As</span> <span class="datatype">Integer</span> = s[0]
</code></p>

### Посимвольный обход строки

Предыдущий подход можно применять для посимвольного обхода строки в цикле. Проверяя текущий символ, цикл остановится как только встретится нулевой, обозначающий конец строки. Таким образом вычислять длину строки заранее не нужно:

```FreeBASIC
Dim Value As WString * (MAX_BUFFER_LENGTH + 1) = Any

Dim i As Integer

Do While Value[i] <> 0
	' Что‐то сделать с символом
	' Например, вывести на консоль
	Print Value[i]
	
	' Увеличиваем счётчик
	i += 1
Loop
```

Если заранее известно, что строки будут ненулевой длины, то условие выхода из цикла `While s[i] <> 0` можно поставить после `Loop`.


### Преобразование строк в кодировку UTF-8 и обратно

<p>В библиотеке <code>kernel32.dll</code> уже реализованы специальные функции. Достаточно подключить заголовочный файл <code>windows.bi</code>.</p>

<h4>Перекодировать строку в UTF-8</h4>

<p>Задача: Имеется строка (в юникоде), её необходимо перекодировать в UTF-8.</p>
<p>Подойдёт функция <code>WideCharToMultiByte</code>:</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Размер буфера</span><br />
<span class="keyword">Const</span> BufferLength <span class="keyword">As</span> <span class="keyword">Integer</span> = 10 * 1024<br />
<span class="remark">&apos; Строка в юникоде для ковертации</span><br />
<span class="keyword">Const</span> Utf16 = <span class="string">&quot;Привет, мир!&quot;</span><br />
<span class="remark">&apos; Строка в UTF-8</span><br />
<span class="keyword">Dim</span> Utf8 <span class="keyword">As</span> <span class="keyword">ZString</span> * (BufferLength + 1) = <span class="keyword">Any</span><br />
<span class="remark">&apos; Выполнить</span><br />
<span class="keyword">Dim</span> CharsCount <span class="keyword">As</span> <span class="keyword">Integer</span> = WideCharToMultiByte(CP_UTF8, 0, @Utf16, -1, @Utf8, BufferLength, 0, 0)
</code></p>

<p>Функция возвращает количество записанных символов вместе с завершающим нулём.</p>

<h4>Перекодировать UTF-8 в строку</h4>

<p>Задача: имеется строка в кодировке UTF-8, её нужно перекодировать в юникодную фрибейсиковую строку.</p>
<p>Подойдёт функция <code>MultiByteToWideChar</code>:</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Строка Utf8 где‐то объявлена и содержит данные</span><br />
<span class="keyword">Dim</span> Utf16 <span class="keyword">As</span> <span class="keyword">WString</span> * (BufferLength + 1) = <span class="keyword">Any</span><br />
<span class="keyword">Dim</span> CharsCount <span class="keyword">As</span> <span class="keyword">Integer</span> = MultiByteToWideChar(CP_UTF8, 0, @Utf8, -1, @Utf16, BufferLength)
</code></p>

<p>Функция возвращает количество записанных символов вместе с завершающим нулём.</p>
<p>Примечание: во избежание нарушений доступа строка Utf8 должна заканчиваться нулём.</p>



## Уменьшение размера исполняемого файла


### Прекращение инициализации переменных по умолчанию

При объявлении новой переменной ей сразу же присваивается значение по умолчанию, если мы не сделали это сами. Так, целочисленным переменным присваивается значение 0, логическим — `False`, строки неизменяемой длины `ZString` и `WString` заполняются нулевыми символами на всю их длину. Статические массивы инициализруются также. Если нам не требуется инициализация переменных, для этого переменной нужно присвоить специальное значение `Any`.

```FreeBASIC
' Этой переменной значение по умолчанию не будет присвоено
' Сейчас в ней находится так называемый «мусор»
Dim Count As Integer = Any
```

В случае со строками придётся ставить нулевой символ самостоятельно:

```FreeBASIC
' Память под строку выделена
Dim Value As WString * (MAX_BUFFER_LENGTH + 1) = Any
' Однако в сейчас в строке отсутствует нулевой символ, его необходимо поставить:
Value[0] = 0

```
