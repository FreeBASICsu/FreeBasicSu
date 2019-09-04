# Файлы инициализации

Практически любое программное обеспечение способно запоминать (сохранять) настройки, установленные пользователем. Например, внешний вид окна, язык, имя пользователя. В простых программах проще всего использовать файлы инициализации.

## Формат файла

Файлы с расширением *.ini широко распространены не только в мире Windows, но и в других системах, например, php.ini. Формат ini‐файла очень прост: файл разделён на секции (или разделы), в каждой секции может находиться произвольное число записей вида «параметр=значение». Секции указываются в квадратных скобках. Имена параметров в разных секциях могут совпадать.

В ini‐файлах предусмотрены комментарии — это строки, начинающиеся с точки с запятой.

```INI-file
[секция_1]
параметр1=значение1
; это комментарий
параметр2=значение2

[секция_2]
параметр1=значение1
параметр2=значение2
```

## Функции для работы с ini‐файлами

Существуют специальные функции, предназначенные для чтения и записи INI-файлов, они лежат в библиотеке kernel32.dll:

* <strong>GetPrivateProfileString</strong> — считывает строковое значение указанного параметра из указанного раздела;
* <strong>GetPrivateProfileInt</strong> — считывает целочисленное значение указанного параметра из указанного раздела;
* <strong>WritePrivateProfileString</strong> — записывает значение указанного параметра в указанный раздел указанного ini‐файла. Если указанного раздела или параметра не существует, то он будет создан. Если указанного ini-файла не существует, то он также будет создан.

Эти функции работают со строками и существуют в двух вариантах: в ANSI‐версии и в юникодной версии, однако запись и чтение ini‐файлов в юникоде будет работать только если файл уже был ранее создан в юникоде (кодировка UTF-16 LE). То есть создать юникодный ini‐файл функцией WritePrivateProfileString нельзя, но можно создать сторонними программами, например, блокнотом.


### GetPrivateProfileString

Получает строковое значение ключа из INI‐файла.

```FreeBASIC
Declare Function GetPrivateProfileString( _
    ByVal lpAppName As LPCTSTR, _
    ByVal lpKeyName As LPCTSTR, _
    ByVal lpDefault As LPCTSTR, _
    ByVal lpReturnedString As LPWSTR, _
    ByVal nSize As DWORD, _
    ByVal lpFileName As LPCTSTR _
)As DWORD
```

#### Параметры

| *** | *** |
|----------------|---------|
| lpAppName | Имя секции для получения параметра. Если этот параметр равен NULL, то функция возвратит все секции в файле. |
| lpKeyName | Имя ключа. Если этот параметр равен NULL, то функция возвратит все включи в данной секции. |
| lpDefault | Значение по умолчанию, которое возвратит функция, если ключ не будет найден. Если параметр равен NULL, то значением по умолчанию считается пустая строка "". Не следует указывать здесь строку с завершающими пустыми символами. |
| lpReturnedString | Указатель на буфер (строку), куда функция запишет значение ключа. |
| nSize | Размер передаваемого в функцию буфера в символах. |
| lpFileName | Имя ini‐файла. Если имя не содержит полный путь к файлу, то функция будет искать его в папке Windows. |


#### Возвращаемое значение

Функция возвращает количество скопированных символов в строку не включая нулевой символ.

Для получения дополнительных сведений об ошибке можно вызвать функцию GetLastError.


### GetPrivateProfileInt

Если значение в файле инициализации представлено числом, то его проще получить функцией GetPrivateProfileInt.

```FreeBASIC
Declare Function GetPrivateProfileInt( _
	ByVal lpAppName As LPCTSTR, _
	ByVal lpKeyName As LPCTSTR, _
	ByVal nDefault As INT_, _
	ByVal lpFileName As LPCTSTR _
)As UINT
```

#### Параметры

| *** | *** |
|----------------|---------|
| lpAppName | Имя секции для получения параметра. |
| lpKeyName | Имя ключа. |
| nDefault | Значение по умолчанию, которое возвратит функция, если ключ не будет найден. |
| lpFileName | Имя ini‐файла. Если имя не содержит полный путь к файлу, то функция будет искать его в папке Windows. |


#### Возвращаемое значение

Функция возвращает число, представленное в INI‐файле. Если ключ не найдет, будет возвращено значение по умолчанию.


### WritePrivateProfileString

Сохраняет или удаляет значение в ini‐файле.

```FreeBASIC
Declare Function WritePrivateProfileString( _
	ByVal lpAppName As LPCTSTR, _
	ByVal lpKeyName As LPCTSTR, _
	ByVal lpString As LPCTSTR, _
	ByVal lpFileName As LPCTSTR _
)As WINBOOL
```


#### Параметры

| *** | *** |
|----------------|---------|
| lpAppName | Имя секции для записи. |
| lpKeyName | Имя ключа. Если этот параметр будет равен NULL, то вся секция вместе со всеми ключами будет удалена. |
| lpString | Строка, которая будет записана как значение ключа. Если этот параметр равен NULL, то ключ будет удалён. |
| lpFileName | Имя ini‐файла. Если имя не содержит полный путь к файлу, то функция будет искать его в папке Windows. Если файл не существует, то он будет создан в кодировке ANSI. Значение будет записано в юникодной кодировке только если файл уже существует в юникодной кодировке, иначе значени ключа перед записью будет сконвертировано в кодировку ANSI. |


#### Возвращаемое значение

Если функция выполнилась успешно, то возвращаемое значение не ноль.

При ошибке функция возвращает ноль. Для получения дополнительных сведений об ошибке можно вызвать функцию GetLastError.


## Примеры

Далее будут примеры использования с учётом юникода, а значит, программа будет корректно читать и записывать русские буквы.


### Получение значения ключа

Создай в блокноте текстовый файл «configuration.ini» и сохрани его в кодировке Unicode (UTF-16):

```INI-file
[Окно]
; Ширина и высота окна
Width=640
Height=480

; Параметры пользователя
[Пользователь]
Имя=Алексей
```

Исходный код для чтения файла тоже необходимо сохранить в юникодной кодировке, например, в UTF-8 или UTF-16.

```FreeBASIC
#define unicode
#include "windows.bi"

Const SectionWindow = "Окно"
Const KeyWidth = "Width"
Const KeyHeight = "Height"
Const DefaultValue = "0"
Const BufferSize As Integer = 255


' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Значение из ini‐файла, которое мы получим
Dim Value As WString * (BufferSize + 1) = Any ' + 1 под завершающий нулевой символ

' Получить значение ключа Width
GetPrivateProfileString(SectionWindow, KeyWidth, DefaultValue, @Value, BufferSize, FileName)

Print KeyWidth; " = "; Value

' Получить значение ключа Height 
GetPrivateProfileString(SectionWindow, KeyHeight, DefaultValue, @Value, BufferSize, FileName)

Print KeyHeight; " = "; Value
```


### Получение всех секций и ключей

Чтобы получить список всех секций, нужно в <strong>GetPrivateProfileString</strong> вместо имени секции передать NULL. Функция заполнит возвращаемое значение Value строкой из всех разделов, разделённых символом с кодом 0. Аналогично для списка всех параметров в разделе: вместо имени требуемого параметра передать NULL.

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
	<span class="remark">&apos; Получение всех секций</span><br />
	<span class="keyword">Dim</span> Result2 <span class="keyword">As</span> DWORD = GetPrivateProfileString(NULL, NULL, DefaultValue, Value, BufferSize, FileName)<br />
	PrintResult(Value, Result2)<br />
	<br />
	<span class="remark">&apos; Получение всех ключей</span><br />
	Result2 = GetPrivateProfileString(SectionWindow, Null, DefaultValue, Value, BufferSize, FileName)<br />
	PrintResult(Value, Result2)<br />
	<br />
	<span class="remark">&apos; Печать результата</span><br />
	<span class="keyword">Sub</span> PrintResult(<span class="keyword">ByRef</span> Value <span class="keyword">As</span> <span class="keyword">WString</span>, <span class="keyword">ByVal</span> ValueLength <span class="keyword">As</span> <span class="keyword">Integer</span>)<br />
	&t;<span class="keyword">Dim</span> Start <span class="keyword">As</span> <span class="keyword">Integer</span> = 0<br />
	&t;<span class="keyword">Dim</span> w <span class="keyword">As</span> <span class="keyword">WString</span> <span class="keyword">Ptr</span> = <span class="keyword">Any</span><br />
	&t;<span class="keyword">Do</span> <span class="keyword">While</span> Start &lt; ValueLength<br />
	&t;&t;<span class="remark">&apos; Получить указатель на начало строки</span><br />
	&t;&t;w = @Value[Start]<br />
	&t;&t;<span class="remark">&apos; Распечатать</span><br />
	&t;&t;<span class="keyword">Print</span> *w<br />
	&t;&t;<span class="remark">&apos; Измерить длину строки, прибавить это к указателю + 1</span><br />
	&t;&t;Start += <span class="keyword">Len</span>(*w) + 1<br />
	&t;<span class="keyword">Loop</span><br />
	<span class="keyword">End Sub</span>
</code></p>


### Запись в файл

Попробуем сменить имя пользователя:

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
	<span class="keyword">Const</span> SectionUser = <span class="string">&quot;Пользователь&quot;</span><br />
	<span class="keyword">Const</span> KeyUser = <span class="string">&quot;Имя&quot;</span><br />
	<span class="keyword">Const</span> UserName = <span class="string">&quot;Саша&quot;</span><br />
	<br />
	<span class="remark">&apos; Функция возращает значение WinBool</span><br />
	<span class="keyword">Dim</span> Result <span class="keyword">As</span> <span class="keyword">WinBool</span> = WritePrivateProfileString(SectionUser, KeyUser, UserName, FileName)<br />
	<span class="keyword">If</span> Result <span class="keyword">Then</span><br />
	&t;<span class="keyword">Print</span> <span class="string">&quot;Запись удалась&quot;</span><br />
	<span class="keyword">End If</span>
</code></p>


### Удаление раздела или параметра

<p>Удаление — это запись NULL в ключ или раздел.</p>

<p>Удалим параметр «Имя» из раздела «Пользователь»:</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
	Result = WritePrivateProfileString(SectionUser, KeyUser, NULL, FileName)<br />
	<span class="keyword">If</span> Result <span class="keyword">Then</span><br />
	&t;<span class="keyword">Print</span> <span class="string">&quot;Удаление параметра успешно&quot;</span><br />
	<span class="keyword">End If</span>
</code></p>

<p>Точно также можно удалять целые секции из ini‐файлов:</p>

<p class="codebox"><span>Код</span>&#32;<span>FreeBASIC</span><br /><code>
	Result = WritePrivateProfileString(SectionUser, NULL, NULL, FileName)<br />
	<span class="keyword">If</span> Result <span class="keyword">Then</span><br />
	&t;<span class="keyword">Print</span> <span class="string">&quot;Удаление секции успешно&quot;</span><br />
	<span class="keyword">End If</span>
</code></p>

Не забываем сохранять исходный код в кодировке UTF-8 или UTF-16, а сам ini‐файл в юникоде (UTF-16).

## Литература

* Описание функции <strong>GetPrivateProfileString</strong> на сайте MSDN <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms724353%28v=vs.85%29.aspx">https://msdn.microsoft.com/en-us/library/windows/desktop/ms724353%28v=vs.85%29.aspx</a>
* Описание функции <strong>WritePrivateProfileString</strong> на сайте MSDN <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms725501%28v=vs.85%29.aspx">https://msdn.microsoft.com/en-us/library/windows/desktop/ms725501%28v=vs.85%29.aspx</a>
* Недостатки INI‐файлов <a href="http://www.transl-gunsmoker.ru/2010/05/ini.html">http://www.transl-gunsmoker.ru/2010/05/ini.html</a>
