# Файлы инициализации

Практически любое программное обеспечение способно запоминать (сохранять) своё состояние. Например, внешний вид и размеры окон, язык, имя пользователя. Файлы инициализации — один из самых простых способов. Файлы с расширением «.ini» широко распространены не только в мире Windows, но и в других системах, например, php.ini.

Появились с самых первых версий Windows. В версии Windows 1.01 это был только файл WIN.INI. В Windows 3.0 добавился файл SYSTEM.INI. А затем их количество начало расти быстро и бесконтрольно.

Начиная с Windows 95, INI‐файлы считаются устаревшими и в качестве замены им корпорация Microsoft предлагает использовать системный реестр. Тем не менее INI‐файлы продолжают использоваться как приложениями других производителей, так и компонентами ОС от Microsoft. Например, файл boot.ini используется в Windows при загрузке.

Хотя INI‐файлы и приобрели популярность в Windows, они могут использоваться в любой ОС. Несложная структура этого формата позволяет легко обрабатывать их программно и имеет достаточно понятный вид для чтения и изменения людьми.


## Формат файла

Не существует официальной спецификации формата, есть лишь общие принципы.

Формат INI‐файла очень прост: файл разделён на секции (или разделы), в каждой секции может находиться произвольное число записей вида «ключ=значение». Секции указываются в квадратных скобках. Имена ключей в разных секциях могут совпадать.

В INI‐файлах предусмотрены комментарии — это строки, начинающиеся с точки с запятой.

```INI
[секция_1]
параметр1=значение1
; Это комментарий
параметр2=значение2
; Иногда значения отсутствуют 
параметр3=

[секция_2]
параметр1=значение1
параметр2=значение2
```


## Достоинства и недостатки

Достоинства:

* простой текстовый формат, который можно редактировать даже в блокноте.

Недостатки прямо вытекают из текстового формата и старых версий Windows и оставлены для совместимости:

* файл инициализации не может быть больше 32 килобайт;
* для хранения юникодных строк файл необходимо создавать не через официальные функции, а сторонними программами;
* при записи в файл из строки теряется начальная кавычка «"», при чтении — исчезают начальные и конечные кавычки;
* отсутствует настройка доступа: ты не можешь сказать «кто угодно может редактировать эту секцию, а другую могут изменять только администраторы»;
* INI‐файлы содержат только строки, для хранения двоичных данных необходимо кодировать их в строку;
* чтение INI‐файла — медленная операция, каждый раз при открытии файла требуется прочитать его в память до конца и разобрать на секции;
* INI‐файлы имеют только два уровня вложенности: секции и пары «ключ=значение», секции внутри секций не поддерживаются;
* многие программы работают с файлами напрямую, минуя официальные функции, такие программы содержат ошибки или ограничения в своих парсерах INI‐файлов, так что на практике ты можешь столкнуться с ситуацией, когда невозможно хранить строку длиннее 80 символов, иначе вылетит другая программа, которая читает этот файл.

Корпорация Microsoft рекомендует для хранения настроек в новых версиях программ использовать реестр.


## Функции для работы с INI‐файлами

Существуют специальные функции, предназначенные для чтения и записи INI‐файлов, они лежат в библиотеке kernel32.dll:

* **GetPrivateProfileString** — считывает строковое значение параметра из раздела;
* **GetPrivateProfileInt** — считывает целочисленное значение параметра из раздела;
* **WritePrivateProfileString** — записывает значение параметра в раздел INI‐файла. Если раздела или параметра не существует, то он будет создан. Если указанного INI‐файла не существует, то он также будет создан.

Эти функции работают со строками и существуют в двух вариантах: в ANSI‐версии и в юникодной версии, однако запись и чтение INI‐файлов в юникоде будет работать только если файл уже был ранее создан в юникоде (кодировка UTF-16 LE). То есть создать юникодный INI‐файл функцией WritePrivateProfileString нельзя, но можно создать сторонними программами, например, блокнотом. Это поведение оставлено для совместимости со старыми  версиями программ.

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

lpAppName:
 ~ Имя секции для получения параметра. Если этот параметр равен NULL, то функция возвратит все секции в файле.

lpKeyName:
 ~ Имя ключа. Если этот параметр равен NULL, то функция возвратит все включи в данной секции.

lpDefault:
 ~ Значение по умолчанию, которое возвратит функция, если ключ не будет найден. Если параметр равен NULL, то значением по умолчанию считается пустая строка "". Не следует указывать здесь строку с завершающими пустыми символами.

lpReturnedString:
 ~ Указатель на буфер (строку), куда функция запишет значение ключа.

nSize:
 ~ Размер передаваемого в функцию буфера в символах.

lpFileName:
 ~ Имя INI‐файла. Если имя не содержит полный путь к файлу, то функция будет искать его в папке Windows.

#### Возвращаемое значение

Функция возвращает количество скопированных символов в буфер не включая нулевой символ.

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

lpAppName:
 ~ Имя секции для получения параметра.

lpKeyName:
 ~ Имя ключа.

nDefault:
 ~ Значение по умолчанию, которое возвратит функция, если ключ не будет найден.

lpFileName:
 ~ Имя INI‐файла. Если имя не содержит полный путь к файлу, то функция будет искать его в папке Windows.

#### Возвращаемое значение

Функция возвращает число, представленное в INI‐файле. Если ключ не найден, будет возвращено значение по умолчанию.

### WritePrivateProfileString

Сохраняет или удаляет значение в INI‐файле.

```FreeBASIC
Declare Function WritePrivateProfileString( _
	ByVal lpAppName As LPCTSTR, _
	ByVal lpKeyName As LPCTSTR, _
	ByVal lpString As LPCTSTR, _
	ByVal lpFileName As LPCTSTR _
)As WINBOOL
```

#### Параметры

lpAppName:
 ~ Имя секции для записи.

lpKeyName:
 ~ Имя ключа. Если этот параметр будет равен NULL, то вся секция вместе со всеми ключами будет удалена.

lpString:
 ~ Строка, которая будет записана как значение ключа. Если этот параметр равен NULL, то ключ будет удалён.

lpFileName:
 ~ Имя INI‐файла. Если имя не содержит полный путь к файлу, то функция будет искать его в папке Windows. Если файл не существует, то он будет создан в кодировке ANSI. Значение будет записано в юникодной кодировке только если файл уже существует в юникодной кодировке, иначе значени ключа перед записью будет сконвертировано в кодировку ANSI.

#### Возвращаемое значение

Если функция выполнилась успешно, то возвращаемое значение не ноль.

При ошибке функция возвращает ноль. Для получения дополнительных сведений об ошибке можно вызвать функцию GetLastError.

## Примеры

Далее будут примеры использования с учётом юникода, а значит, программа будет корректно читать и записывать русские буквы.

### Получение значения ключа

Создай в блокноте текстовый файл «configuration.ini» и сохрани его в кодировке Unicode (UTF-16):

```INI
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

' Значение из INI‐файла, которое мы получим
Dim Value As WString * (BufferSize + 1) = Any ' + 1 под завершающий нулевой символ

' Получить значение ключа Width
GetPrivateProfileString(SectionWindow, KeyWidth, DefaultValue, @Value, BufferSize, FileName)

Print KeyWidth; " = "; Value

' Получить значение ключа Height 
GetPrivateProfileString(SectionWindow, KeyHeight, DefaultValue, @Value, BufferSize, FileName)

Print KeyHeight; " = "; Value
```

### Получение всех секций и ключей

Чтобы получить список всех секций, нужно в функцию GetPrivateProfileString вместо имени секции передать NULL. Функция заполнит буфер списком из всех секций, разделённых символом с кодом 0. Аналогично для списка всех ключей в разделе.


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

' Все секции INI‐файла
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

Не забываем сохранять исходный код в кодировке UTF-8 или UTF-16, а сам INI‐файл в юникоде (UTF-16).

## Литература

* Описание функции [GetPrivateProfileString](https://msdn.microsoft.com/en-us/library/windows/desktop/ms724353%28v=vs.85%29.aspx) на сайте MSDN
* Описание функции [WritePrivateProfileString](https://msdn.microsoft.com/en-us/library/windows/desktop/ms725501%28v=vs.85%29.aspx) на сайте MSDN
* [Недостатки INI‐файлов](https://www.transl-gunsmoker.ru/2010/05/ini.html)
