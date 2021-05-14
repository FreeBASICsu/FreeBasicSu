# Юникод

Разрабатывая приложение, ты определённо должен использовать преимущества юникода. Даже если ты пока не собираешься локализовать программный продукт, разработка с прицелом на юникод упростит эту задачу в будущем. Юникод также позволяет:

* легко обмениваться данными на разных языках;
* распространять единственный двоичный EXE‐ или DLL‐файл, поддерживающий все языки;
* увеличить эффективность приложений (об этом мы поговорим чуть позже).


## Юникод и FreeBASIC

### Типы данных ZString и WString

В язык FreeBASIC введены новые типы данных: `ZString` и `WString`.

ZString
 ~ Стандартный тип данных, содержащий 8‐битные символы, ANSI‐строки

WString
 ~ Стандартный тип данных, содержащий широкий (юникодный) символ, Wide‐строки

Для обычных символьных данных — символов ANSI — в языке FreeBASIC используется тип `ZString`; переменная этого типа занимает в памяти один байт. Для хранения символов юникода необходимо больше байт, из-за чего их называют широкими символами (Wide Characters). В языке FreeBASIC широким символам соответствует тип `WString`.

### Тип данных String

Тип данных для строк, пришедший из QuickBasic. Является удобной объектной оболочкой для `ZString` с автоматическим управлением памятью. По своей природе `String` могут содержать только 8‐битные символы, ANSI‐строки.

### Выделение памяти для строки

Если ты хочешь, скажем, создать буфер для хранения юникодной строки длиной до 99 символов с нулевым символом в конце, сделай так:

```FreeBASIC
Dim wszBuffer As WString * (99 + 1)
```

Эта конструкция создаст строку известного на этапе компиляции размера из ста значений `WString`: 99 для данных и 1 для нулевого символа.

Если длина строки заранее неизвестна, то её создают динамически:

```FreeBASIC
Dim pwszBuffer As WString Ptr = Allocate((nCharacters + 1) * SizeOf(WString))
```

Функция `Allocate` выделяет память в байтах, а строка работает с символами, поэтому для расчёта точного количества байт для строки вместо `Allocate(nCharacters)` необходимо использовать `Allocate((nCharacters + 1) * SizeOf(WString))`. Это правило запомнить труднее всего — если ты ошибёшься, компилятор не выдаст никаких предупреждений, а программа будет работать неправильно.

### Строковые литералы

Используя `WString` можно заполнять строки данными:

```FreeBASIC
' Для строки с фиксированной длиной
wszBuffer = "Error"

' Для указателя на WString
*pwszBuffer = "Error"
```

Правда, в этом операторе есть проблема. По умолчанию FreeBASIC транслирует строковые литералы в зависимости от кодировки исходного файла. Если кодировка ANSI, то и литерал будет состоять из символов ANSI, а не из широких символов, присваивание широкой строке ANSI‐строки приведёт к неявной конвертации символов.

#### Создание литерала с широкими символами через функцию WStr

Чтобы литерал состоял из широких символов, необходимо обернуть его в функцию `WStr`:

```FreeBASIC
' Для строк фиксированной длины
wszBuffer = WStr("Error")

' Для динамической строки
*pwszBuffer = WStr("Error")
```

Если в литерале встречаются символы с кодами больше 127 (например, кириллица), компилятор может их неправильно распознать. Для явного укзания кода символа следует использовать экранированную строку:

```FreeBASIC
' «Текст строки»
Const SOME_STRING = WStr(!"\u0422\u0435\u043A\u0441\u0442 \u0441\u0442\u0440\u043E\u043A\u0438")
```

Здесь могут встречаться последовательности:

`\uXXXX`
 ~ шестнадцатеричный код символа

`\&hXX`
 ~ шестнадцатеричный код символа

`\nnn`
 ~ десятичный код символа

Коды нужных символов можно смотреть через утилиту `charmap.exe`.

#### Создание литерала с широкими символами через кодировку исходного файла

Если ты сохранишь файл в одной из юникодных кодировок: UTF-8 с BOM, UTF-16 LE, UTF-16 BE, то все строковые литералы станут широкими. Тогда в литерале можно сразу использовать символы с кодами больше 127:

```FreeBASIC
' «Текст строки»
Const SOME_STRING = "Текст строки"
```

### Создание литерала с ANSI‐символами

Иногда требуется получить литерал только с ANSI‐символами, для этого литерал оборачивают в функцию `Str`:

```FreeBASIC
Const SOME_STRING = Str("ANSI")
```

В этом случае может произойти потеря информации при конвертации кодов символов с кодами больше 127.

### Функции работающие со строками

Эти стандартные функции работают с ANSI‐ и широкими строками:

* InStr
* LCase
* Left
* Len
* LSet
* LTrim
* Mid
* Right
* RSet
* RTrim
* Trim
* UCase
* Val
* VALLNG
* VALINT
* VALUINT
* VALULNG
* Print

Эти стандартные функции работают только с ANSI‐строками:

* String
* Space
* BIN
* CHR
* HEX
* OCT
* STR
* INPUT

Эти стандартные функции работают только с широкими строками:

* WSpace
* WString
* WBIN
* WCHR
* WHEX
* WOCT
* WSTR
* WINPUT


## Юникод и библиотека языка Си

### Типы данных char и wchar_t

В языке Си существуют типы данных: `char` и `wchar_t`.

char
 ~ Стандартный тип данных, содержащий 8‐битные символы, ANSI‐строки

wchar_t
 ~ Стандартный тип данных, содержащий широкий (юникодный) символ, Wide‐строки

### Функции работающие со строками

Эти стандартные функции работают только с ANSI‐строками:

```C
char * strcat(char *, const char *);
char * strchr(const char *, int);
int strcmp(const char *, const char *);
char * strcpy(char *, const char *);
size_t strlen(const char *);
```

Эти стандартные функции работают только с широкими строками:

```C
wchar_t * wcscat(wchar_t *, const wchar t *);
wchar_t * wcschr(const wchar_t *, wchar_t);
wchar_t * wcscpy(wchar_t *, const wchar_t *);
int wcscmp(const wchar_t *, const wchar_t *);
size_t wcslen(const wchar_t *);
```

Имена всех новых функций начинаются с `wcs` — это аббревиатура «wide character set» (набор широких символов). Таким образом, имена юникодных функций образуются простой заменой префикса `str` соответствующих ANSI‐функций на `wcs`.

### Дефиниция _UNICODE

Макрос `_UNICODE` используется в заголовочных файлах библиотек Си.


## Юникод и WinAPI

Под WinAPI можно писать в двух вариантах: юникодном и неюникодном. Чтобы реализовать возможность компиляции «двойного назначения»:

* используй универсальные типы данных (вроде `TCHAR` или `PTSTR`) для текстовых символов и строк;
* используй явные типы данных (вроде `BYTE` или `PBYTE`) для байтов, указателей на байты и буферов данных;
* оборачивай строковые литералы в макрос `__TEXT`;
* предусмотри возможность глобальных замен (например, `PSTR` на `PTSTR`).

### Строковые типы данных

Для символов ANSI используется тип `CHAR`:

```FreeBASIC
Type CHAR As Byte
Type PCHAR As CHAR Ptr
```

ANSI‐строки:

```FreeBASIC
Type LPSTR As ZString Ptr
Type PSTR As ZString Ptr
```

Константные ANSI‐строки:

```FreeBASIC
Type LPCSTR As Const ZString Ptr
Type PCSTR As Const ZString Ptr
```

Широким символам соответствует тип `WCHAR`:

```FreeBASIC
Type WCHAR As wchar_t
Type PWCHAR As WCHAR Ptr
```

Широкие строки:

```FreeBASIC
Type LPWSTR As WString Ptr
Type PWSTR As WString Ptr
```

Константные широкие строки:

```FreeBASIC
Type LPCWSTR As Const WString Ptr
Type PCWSTR As Const WString Ptr
```

### Дефиниция UNICODE

Макрос `UNICODE` используется в заголовочных файлах Windows. Этот макрос включает использование широких символов.

Указываем, что будем использовать юникодные версии строковых функций:

```FreeBASIC
#define UNICODE
#include once "windows.bi"
```

Но лучше передавать дефиницию в параметрах компилятора:

```BatchFile
fbc -d UNICODE file.bas
```

### Обобщённые типы данных

В заголовочных файлах Windows есть обобщённые типы данных для символов и строк. Посмотрим, как некоторые из них раскрываются в зависимости от установки `UNICODE`:

| Тип данных      | UNICODE определена | UNICODE не определена | Описание |
|-----------------|--------------------|-----------------------|----------|
| TCHAR           | WCHAR              | Byte                  | Символ |
| PTCHAR          | WCHAR Ptr          | Byte Ptr              | Указатель на символ |
| TBYTE           | WCHAR              | UByte                 | Символ |
| PTBYTE          | WCHAR Ptr          | UByte Ptr             | Указатель на символ |
| PTSTR, LPTSTR   | LPWSTR             | LPSTR                 | Указатель на строку |
| PCTSTR, LPCTSTR | LPCWSTR            | LPCSTR                | Указатель на константную строку |

### Префиксы переменных

Ты также можешь встречать префиксы у переменных:

| Префикс       | Описание                                                      |
|---------------|---------------------------------------------------------------|
| sz            | ANSI‐строка с нулевым символом                                |
| psz, lpsz     | указатель на ANSI‐строку с нулевым символом                   |
| pcsz, lpcsz   | указатель на сонстантную ANSI‐строку с нулевым символом       |
| wsz           | широкая строка с нулевым символом                             |
| pwsz, lpwsz   | указатель на широкую строку с нулевым символом                |
| pcwsz, lpcwsz | указатель на константную широкую строку с нулевым символом    |
| tsz           | обобщённая строка с нулевым символом                          |
| ptsz, lptsz   | указатель на обобщённую строку с нулевым символом             |
| pctsz, lpctsz | указатель на константную обобщённую строку с нулевым символом |

Префиксы `P` и `LP` означают указатели. Разница между ними объясняется исторически: в 16‐битном мире `P` — короткий указатель, `LP` — длинный. В настоящее время эти указатели равнозначны.

Префиксы не являются абсолютной истиной, например, поле `lpszClassName` в структуре `WNDCLASSEX` может ссылаться как на ANSI, так и на широкую строку.

### Константы

Текст литерала обрамляем макросом `__TEXT`:

```FreeBASIC
Const SOME_STRING = __TEXT("String Text")
```

### Указатели

Указатели на строки делаем обобщённым типом `LPTSTR` или `LPCTSTR`:

```FreeBASIC
Const SOME_STRING = __TEXT("This is a text")
Dim ptszString As LPTSTR = StrPtr(SOME_STRING)
```

### Буфер

Буфер для хранения символов делаем массивом обобщённого типа `TCHAR`:

```FreeBASIC
' Буфер
Dim tszString(265) As TCHAR

' УКазатель на буфер
Dim ptszString As LPTSTR = @tszString(0)
```

Для вывода на консоль приводим указатель к `LPTSTR` и разыменовываем:

```FreeBASIC
Print *CPtr(LPTSTR, @tszString(0))
```

### Ресурсы

Строки, которые требуют локализации, следует выносить в ресурсы программы.

Строки в ресурсах (таблицы строк, шаблоны диалоговых окон, меню и др.) всегда записываются в юникоде. Такой файл рекомендуют сохранять в одной из юникодных кодировок: UTF-8 с BOM или UTF-16 LE.

```
#define IDS_CLIENTERRORSTRING 20001
#define IDS_SERVERERRORSTRING 20002

STRINGTABLE LANGUAGE LANG_ENGLISH, SUBLANG_ENGLISH_US
BEGIN
	IDS_CAPTION    "Hello world program"
	IDS_HELLOWORLD "Hello world"
END

STRINGTABLE LANGUAGE LANG_RUSSIAN, SUBLANG_NEUTRAL
BEGIN
	IDS_CAPTION    "Программа Hello world"
	IDS_HELLOWORLD "Здравствуй, мир"
END
```

Извлекаем строку из ресурсов функцией `LoadString`:

```FreeBASIC
Dim ptszString As LPTSTR = Allocate((265 + 1) * SizeOf(TCHAR))

Dim ret As Long = LoadString( _
	GetModuleHandle(NULL), _
	IDS_CLIENTERRORSTRING, _
	ptszString, _
	265 _
)

Print *CPtr(LPTSTR, @tszString(0))
```


## Юникод и COM

Все методы СОМ‐интерфейсов, работающие со строками, должны принимать только строки типа `BSTR`, которые содержат только символы типа `OLECHAR`.

OLECHAR
 ~ псевдоним для `WCHAR`

Для инициализации COM‐строки можно использовать `WString`, так как она совместима с `OLECHAR`:

```FreeBASIC
Dim wszString As WString * (15 + 1)
Dim b As BSTR = SysAllocString(StrPtr(wszString))
```

Второй вариант — использовать массив `OLECHAR`:

```FreeBASIC
Dim oleString(15) As OLECHAR
Dim b As BSTR = SysAllocString(@oleString(0))
```


## DLL и строки

Если ты пишешь динамически подключаемую библиотеку работающую со строками, то тебе просто необходимо поступать так, как делает это Windows: экспортировать два вида функций, первые будут принимать ANSI‐строки, вторые широкие строки.

Например, мы создаём функцию `FindCrLfIndex`, которая будет искать в строке символы CrLf. Для этого мы определяем две функции `FindCrLfIndexA` и `FindCrLfIndexW`, принимающие ANSI‐строки и широкие строки соответственно:

```FreeBASIC
#include once "windows.bi"

Declare Function FindCrLfIndexA Alias "FindCrLfIndexA"( _
	ByVal pszBuffer As LPCSTR, _
	ByVal pFindIndex As Long Ptr _
)As WINBOOL

Declare Function FindCrLfIndexW Alias "FindCrLfIndexW"( _
	ByVal pwszBuffer As LPCWSTR, _
	ByVal pFindIndex As Long Ptr _
)As WINBOOL
```

Ключевое слово `Alias` здесь обязательно, иначе FreeBASIC переведёт название функции в верхний регистр.

Затем мы создаём макрос `FindCrLfIndex`, раскрывающийся в вызов нужной функции в зависимости от установки `UNICODE`:

```FreeBASIC
#ifdef UNICODE
Declare Function FindCrLfIndex Alias "FindCrLfIndexW"( _
	ByVal pwszBuffer As LPCWSTR, _
	ByVal pFindIndex As Long Ptr _
)As WINBOOL
#else
Declare Function FindCrLfIndex Alias "FindCrLfIndexA"( _
	ByVal pszBuffer As LPCSTR, _
	ByVal pFindIndex As Long Ptr _
)As WINBOOL
#endif
```

В ANSI-версии функции просто выделяй память, преобразуй ASNI‐строку функцией `MultiBytoToWideChar` в широкую и вызывай Unicode-версию той же функции.
