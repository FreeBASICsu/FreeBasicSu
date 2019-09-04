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

Функция возвращает число, представленное в INI‐файле. Если ключ не найден, будет возвращено значение по умолчанию.


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
; Параметры пользователя
[Пользователь]
Имя=Алексей

[Окно]
; Ширина и высота окна
Width=640
Height=480
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

Чтобы получить список всех секций, нужно в функцию <strong>GetPrivateProfileString</strong> вместо имени секции передать NULL. Функция заполнит буфер списком из всех секций, разделённых символом с кодом 0. Аналогично для списка всех ключей в разделе.


```FreeBASIC
#define unicode
#include "windows.bi"

Const SectionWindow = "Окно"
Const KeyWidth = "Width"
Const KeyHeight = "Height"
Const DefaultValue = NULL
Const BufferSize As Integer = 32000 - 1

' Печать результата
Sub PrintResult(ByRef ValueList As WString)
	Dim pItem As WString Ptr = @ValueList
	Dim ItemLength As Integer = Len(*pItem)
	
	' До тех пор, пока элемент больше нуля
	Do While ItemLength > 0
		Print *pItem
		pItem = @pItem[ItemLength + 1]
		ItemLength = Len(*pItem)
	Loop
End Sub


' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Все секции ini‐файла
Dim AllSections As WString * (BufferSize + 1) = Any ' + 1 под завершающий нулевой символ

GetPrivateProfileString(Null, Null, DefaultValue, @AllSections, BufferSize, FileName)
PrintResult(AllSections)

' Получение всех ключей в секции Окно
Dim AllKeys As WString * (BufferSize + 1) = Any ' + 1 под завершающий нулевой символ

GetPrivateProfileString(SectionWindow, Null, DefaultValue, @AllKeys, BufferSize, FileName)
PrintResult(AllKeys)
```

### Запись в файл

Попробуем сменить имя пользователя:

```FreeBASIC
#define unicode
#include "windows.bi"

Const SectionUser = "Пользователь"
Const KeyUser = "Имя"
Const NewUserName = "Саша"

' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Функция возращает значение WinBool
Dim Result As WinBool = WritePrivateProfileString(SectionUser, KeyUser, NewUserName, FileName)
If Result Then
    Print "Запись удалась"
End If
```

### Удаление ключа

Чтобы удалить ключ из секции, необходимо записать NULL в значение параметра.

Удалим ключ «Имя» из секции «Пользователь»:

```FreeBASIC
#define unicode
#include "windows.bi"

Const SectionUser = "Пользователь"
Const KeyUser = "Имя"

' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Функция возращает значение WinBool
Dim Result As WinBool = WritePrivateProfileString(SectionUser, KeyUser, NULL, FileName)
If Result Then
    Print "Параметр «Имя» удалён"
End If
```

### Удаление секции

Аналогично удалению ключа из файла конфигурации удаляются целые секции. Записываем NULL в имя ключа:


```FreeBASIC
#define unicode
#include "windows.bi"

Const SectionUser = "Пользователь"

' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Функция возращает значение WinBool
Dim Result As WinBool = WritePrivateProfileString(SectionUser, NULL, NULL, FileName)
If Result Then
    Print "Секция «Пользователь» удалёна"
End If
```

Не забываем сохранять исходный код в кодировке UTF-8 или UTF-16, а сам ini‐файл в юникоде (UTF-16).


## Литература

* Описание функции <strong>GetPrivateProfileString</strong> на сайте MSDN <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms724353%28v=vs.85%29.aspx">https://msdn.microsoft.com/en-us/library/windows/desktop/ms724353%28v=vs.85%29.aspx</a>
* Описание функции <strong>WritePrivateProfileString</strong> на сайте MSDN <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms725501%28v=vs.85%29.aspx">https://msdn.microsoft.com/en-us/library/windows/desktop/ms725501%28v=vs.85%29.aspx</a>
* Недостатки INI‐файлов <a href="http://www.transl-gunsmoker.ru/2010/05/ini.html">http://www.transl-gunsmoker.ru/2010/05/ini.html</a>
