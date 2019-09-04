# Секреты и хитрости программирования на FreeBASIC'е

В этой статье собраны советы по написанию быстрого и компактного кода. Некоторые советы специфичны для фрибейсика, некоторые для всех языков программирования, некоторые для операционной системы Windows.


## Общие оптимизации

### Функция Iif

<p>Часто бывает целесообразным заменить блок <code>If</code>… <code>Then</code>… <code>Else</code> более компактной функцией <code>Iif</code>:</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Длинный код</span><br />
<span class="keyword">If</span> a &gt;= 3 <span class="keyword">Then</span><br />
&t;b = 4<br />
<span class="keyword">Else</span><br />
&t;b = 5<br />
<span class="keyword">End If</span><br /><br />
<span class="remark">&apos; Короткий код</span><br />
b = <span class="keyword">Iif</span>(a &gt;= 3, 4, 5)
</code></p>

<h3><a id="c1c2">Обмен значениями двух переменных без использования третьей</a></h3>

<p>Пусть даны две переменные <code>x</code> и <code>y</code>. Необходимо обменять значения переменных не используя третью.</p>

<p>Первый вариант:</p>
<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
x = x + y<br />
y = x – y<br />
x = x – y
</code></p>

<p>Второй вариант:</p>
<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
x = x <span class="keyword">Xor</span> y<br />
y = y <span class="keyword">Xor</span> x<br />
x = x <span class="keyword">Xor</span> y
</code></p>

<h3><a id="c1c3">Используй оператор Const как можно чаще</a></h3>

<p>Замечательное свойство оператора <code>Const</code> состоит в том, что он накладывает определённое ограничение: данный объект не должен модифицироваться, – и компилятор будет проводить это ограничение в жизнь. <code>Const</code> позволяет указать компилятору и программистам, что определённая величина должна оставаться неизменной. Во всех подобных случаях необходимо обозначать это явным образом, призывая себе на помощь компилятор и гарантируя тем самым, что ограничение не будет нарушено.</p>

<p>Во‐вторых, константы убирают из кода «магические числа». Такое число само по себе не несёт никакого смысла и может вызвать недоумение, встретившись в коде программы без соответствующего контекста или комментария, при этом попытка изменить его на другое, даже близкое по значению, может привести к абсолютно непредсказуемым последствиям. Магическими числа — плохая практика программирования, когда в исходном тексте встречается числовое значение и неочевидно, что оно означает. Например, такой фрагмент будет плохим:</p>

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


<h2><a id="c2">Строки</a></h2>

<h3><a id="c2c1">Использование строковых констант</a></h3>

<p>Необходимо использовать строковые константы везде (желательно в заголовочных файлах). Это исключает дублирование. Все строковые константы хранятся в секции .data. При использовании строковых литералов прямо в коде высока вероятность повторения одних и тех же данных несколько раз, что увеличит размер секции .data.</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="keyword">Const</span> MyConst = <span class="string">&quot;Это константа&quot;</span>
</code></p>

<p>Компилятор сам определит тип строки: юникодная <code>WString</code> или простая <code>ZString</code> на основании определения <code>#define unicode</code>.</p>

<h3><a id="c2c2">Быстрая очистка (обнуление) строки</a></h3>

<p>Для этого достаточно присвоить 0 первому символу в строке, то есть символу под индексом 0:</p>

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

<h3><a id="c2c4">Посимвольный обход строки</a></h3>

<p>Предыдущий подход можно применять для посимвольного обхода строки в цикле. Проверяя текущий символ, цикл остановится как только встретится нулевой, обозначающий конец строки. Таким образом вычислять длину строки заранее не нужно:</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="keyword">Dim</span> s <span class="keyword">As</span> <span class="datatype">WString</span> * (99 + 1) = <span class="datatype">Any</span><br />
s = <span class="string">&quot;Привет, мир!&quot;</span><br />
<span class="keyword">Dim</span> i <span class="keyword">As</span> <span class="datatype">Integer</span> = 0<br />
<span class="keyword">Do</span> <span class="keyword">Until</span> s[i] = 0<br />
&t;<span class="remark">&apos; Вывести код символа</span><br />
&t;<span class="keyword">Print</span> s[i]<br />
&t;i += 1<br />
<span class="keyword">Loop</span><br />
</code></p>

<p>Если заранее известно, что строки будут ненулевой длины, то условие выхода из цикла <code>Until s[i] = 0</code> можно поставить после <code>Loop</code>. Это уберёт двойной прыжок для нулевого символа.</p>

<h3><a id="c2c5">Преобразование строк в кодировку UTF-8 и обратно</a></h3>

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



<h2><a id="c3">Уменьшение размера исполняемого файла</a></h2>

<h3><a id="c3c1">Прекращение инициализации переменных по умолчанию</a></h3>

<p>При объявлении новой переменной ей сразу же присваивается значение по умолчанию, если мы не сделали это сами. Например, целочисленным переменным присваивается значение 0, строки неизменяемой длины <code>ZString</code> и <code>WString</code> заполняются нулями на всю их длину. Если нам не требуется инициализация переменных, для этого переменной нужно присвоить специальное значение <code>Any</code>.</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
<span class="remark">&apos; После этого в переменной Count содержится мусор:</span><br />
<span class="keyword">Dim</span> Count <span class="keyword">As</span> <span class="keyword">Integer</span> = <span class="keyword">Any</span><br /><br />
<span class="keyword">Dim</span> Value <span class="keyword">As</span> <span class="datatype">WString</span> * BufferSize = <span class="keyword">Any</span><br />
<span class="remark">&apos; Чтобы строка оставалась валидной, ей нужно добавить нулевой символ</span><br />
Value[0] = 0</code></p>
