# Что такое GUID и зачем он нужен

Как‐то в один прекрасный день корпорация Open Software Foundation придумала концепцию UUID — Universally Unique Identifier, вселенски уникального идентификатора. Она взяла 128‐битное число и написала для его вычисления специальный алгоритм, более‐менее равномерно выдающий значения из такого огромного диапазона. Вероятность выдачи алгоритмом двух одинаковых чисел невелика, на практике можно говорить, что любое новое число UUID будет уникально.

Корпорация Microsoft взяла на вооружение эту мысль и число UUID без изменения, назвала его немного по‐другому: GUID, то есть Globally Unique Identifier, глобально уникальный идентификатор.


## Применение

Корпорация Microsoft применяет GUID в следующих случаях:

* идентификатор классов (CLSID — Class Identifier);
* идентификатор интерфейсов (IID — Interface Identifier);
* идентификатор библиотек типов (LIBID — Library Identifier);
* много где ещё.

Ты тоже можешь использовать GUID в своих целях, например, так:

* идентификатор записей в базе данных;
* идентификатор сущностей;
* серийный номер чего‐либо.


## Определение GUID

GUID — это беззнаковое целое 128‐битное число. Ничего таинственного и сверхъестественного.

Тип данных «128‐битное число» в языке программирования не предусмотрен, но программисты из Microsoft элегантно выкрутились из ограничения, представив такое число в виде стуктуры.

### Структура GUID

В заголовочном файле `win\guiddef.bi` (входит в `windows.bi`) тип данных GUID объявлен в виде структуры:

```FreeBASIC
Type _GUID
    Data1 As ULong
    Data2 As UShort
    Data3 As UShort
    Data4(0 To 7) As UByte
End Type

Type GUID As _GUID
```

По порядку следования байт числа:

* 32‐битное беззнаковое целое (ULong);
* 16‐битное беззнаковое целое (UShort);
* 16‐битное беззнаковое целое (UShort, второй раз);
* восемь штук 8‐битных беззнаковых целых (UByte).

### IID и CLSID

IID (идентификатор интерфейса) и CLSID (идентификатор класса) — это псевдонимы GUID:

```FreeBASIC
Type IID As GUID

Type CLSID As GUID
```

### REFGUID, REFIID и REFCLSID

Поскольку размер GUID — 16 байтов и в обычный параметр «не влезают», мы будем передавать его в функции не по значению, а как указатель на структуру, а лучше как константный указатель на константные данные. Программистам из Microsoft показалось утомительным писать каждый раз что‐то вроде `ByVal As Const IID Const Ptr`, поэтому они определили в заголовочнике типы данных для таких указателей (Reference — отсюда приставка REF) на GUID, IID и CLSID:

```FreeBASIC
Type REFGUID As Const GUID Const Ptr

Type REFIID As Const IID Const Ptr

Type REFCLSID As Const IID Const Ptr
```

Теперь можно объявлять параметр функции так: `ByVal As REFIID`.


## Объявление GUID

### В тексте

В тексте GUID записывается в виде строки из шестнадцатеричных цифр `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`, разбитой дефисоминусами на группы по пять штук. В формате реестра цифры обрамляют фигурными скобками.

Ты уже наверняка где‐нибудь встречал похожие строки GUID:

```
{00000000-0000-0000-C000-000000000046}

{00020400-0000-0000-C000-000000000046}

{717473E7-54B3-4580-A086-2199430834DA}

{4C9E6590-A9C5-40AD-9E13-AB55F6AAC05F}
```

Первая группа кодирует 32‐битное беззнаковое целое, вторая и третья группы — два 16‐битных беззнаковых целых, четвёртая и пятая — восемь 8‐битных беззнаковых целых.


### В коде

Посмотрим как объявляется IID интерфейса `IXmlHttpRequest` и CLSID класса `XmlHttpRequest`, который реализует этот интерфейс:

```FreeBASIC
Dim IID_IXmlHttpRequest As IID = Type( _
	&hED8C108D, &h4349, &h11D2, _
	{&h91, &hA4, &h00, &hC0, &h4F, &h79, &h69, &hE8} _
)

Dim CLSID_XMLHTTPREQUEST As CLSID = Type( _
	&hED8C108E, &h4349, &h11D2, _
	{&h91, &hA4, &h00, &hC0, &h4F, &h79, &h69, &hE8} _
)
```

Но этот вариант недостаточно гибкий, так как работает на уровне одного файла (одной единицы трансляции).

### Через макросы

В случае, когда одно и то же значение GUID необходимо использовать в нескольких файлах, то его объявляют в одном из общих заголовочных файлов как внешнюю константную переменную:

```FreeBASIC
Extern IID_IBaseStream Alias "IID_IBaseStream" As Const IID
```

Затем создают заголовочный файл `Guids.bas` с макросами:

```FreeBASIC
#ifndef GUIDS_BI
#define GUIDS_BI

#include once "windows.bi"

#ifndef DEFINE_GUID
#define DEFINE_GUID(n, l, w1, w2, b1, b2, b3, b4, b5, b6, b7, b8) Extern n Alias #n As Const GUID : _ 
	Dim n As Const GUID = Type(l, w1, w2, {b1, b2, b3, b4, b5, b6, b7, b8})
#endif

#ifndef DEFINE_IID
#define DEFINE_IID(n, l, w1, w2, b1, b2, b3, b4, b5, b6, b7, b8) Extern n Alias #n As Const IID : _ 
	Dim n As Const IID = Type(l, w1, w2, {b1, b2, b3, b4, b5, b6, b7, b8})
#endif

#ifndef DEFINE_CLSID
#define DEFINE_CLSID(n, l, w1, w2, b1, b2, b3, b4, b5, b6, b7, b8) Extern n Alias #n As Const CLSID : _ 
	Dim n As Const CLSID = Type(l, w1, w2, {b1, b2, b3, b4, b5, b6, b7, b8})
#endif

#ifndef DEFINE_LIBID
#define DEFINE_LIBID(n, l, w1, w2, b1, b2, b3, b4, b5, b6, b7, b8) Extern n Alias #n As Const GUID : _ 
	Dim n As Const GUID = Type(l, w1, w2, {b1, b2, b3, b4, b5, b6, b7, b8})
#endif

#endif
```

И уже файле реализации `Guids.bas` прописывают непосредственно значения GUID через макросы:

```FreeBASIC
#include "Guids.bi"

' {B6AC4CEF-9B3D-4B41-B2F6-DEA27D085EB7}
DEFINE_IID(IID_IBaseStream, _
	&hb6ac4cef, &h9b3d, &h4b41, &hb2, &hf6, &hde, &ha2, &h7d, &h8, &h5e, &hb7 _
)
```


## Функции для работы с GUID

Ввместе с заголовочником `windows.bi` для работы необходимо подключить `win\ole2.bi`.

### CoCreateGUID

Создаёт GUID.

```FreeBASIC
Declare Function CoCreateGuid( _
    ByVal pguid As GUID Ptr _
)As HRESULT
```

#### Параметры

pguid
 ~ Указатель на переменную, куда будет записан созданный GUID.

#### Возвращаемое значение

В случае успеха функция возвращает константу `S_OK`, в случае ошибки — что‐то другое.

Однако тип возвращаемого значения `HRESULT` говорит, что проверять успешность выполненения функции следует макросами `SUCCEEDED` и `FAILED`, а не сравнивать результат напрямую с константой.

### Макросы IsEqualGUID, IsEqualIID, IsEqualCLSID и InlineIsEqualGUID

Предназначены для сравнения двух GUID, IID или CLSID.

```FreeBASIC
Declare Function IsEqualGUID( _
    ByVal rguid1 As REFGUID, _
    ByVal rguid2 As REFGUID _
)As Boolean

Declare Function IsEqualIID( _
    ByVal rguid1 As REFIID, _
    ByVal rguid2 As REFIID _
)As Boolean

Declare Function IsEqualCLSID( _
    ByVal rguid1 As REFCLSID, _
    ByVal rguid2 As REFCLSID _
)As Boolean

Declare Function InlineIsEqualGUID( _
    ByVal rguid1 As REFGUID, _
    ByVal rguid2 As REFGUID _
)As Boolean
```

Макросы IsEqualGUID, IsEqualIID и IsEqualCLSID сравнивают два GUID через функцию memcmp(), а InlineIsEqualGUID делает это в коде, побайтово.

### StringFromGUID2

Заполняет буфер строкой из GUID в формате реестра.

```FreeBASIC
Declare Function StringFromGUID2( _
    ByVal rguid As REFGUID , _
    ByVal lpsz As LPOLESTR, _
    ByVal cchMax As Long _
)As Long
```

#### Параметры

rguid
 ~ Указатель на GUID.

lpsz
 ~ Указатель на буфер, куда будет записана строка.

cchMax
 ~ Длина буфера.

#### Возвращаемое значение

В случае успеха функция возвратит количество записанных символов, включая нулевой.

В случае ошибки, когда буфер под строку слишком мал, вернёт 0.

### StringFromIID и StringFromCLSID

Возвращают строку из IID или CLSID в формате реестра.

```FreeBASIC
Declare Function StringFromIID( _
    ByVal rclsid As REFIID , _
    ByVal lplpsz As LPOLESTR Ptr _
)As HRESULT

Declare Function StringFromCLSID( _
    ByVal rclsid As REFCLSID, _
    ByVal lplpsz As LPOLESTR Ptr _
)As HRESULT
```

#### Параметры

rclsid
 ~ Указатель на IID или CLSID.

lplpsz
 ~ Указатель на переменную‐указатель, по которому будет записан адрес созданной строки. После использования строку следует уничтожить функцией CoTaskMemFree().

#### Возвращаемое значение

В случае успеха функция возвращает константу `S_OK`.

В случае ошибки, когда недостаточно памяти, вернёт `E_OUTOFMEMORY`.

Однако тип возвращаемого значения `HRESULT` говорит, что проверять успешность выполненения функции следует макросами `SUCCEEDED` и `FAILED`, а не сравнивать результат напрямую с константой.

### IIDFromString и CLSIDFromString

Заполняют структуры IID или CLSID из строки GUID в формате реестра.

```FreeBASIC
Declare Function IIDFromString( _
    ByVal lpsz As LPCOLESTR, _
    ByVal lpiid As LPIID _
)As HRESULT

Declare Function CLSIDFromString( _
    ByVal lpsz As LPCOLESTR, _
    ByVal pclsid As LPCLSID _
)As HRESULT
```

#### Параметры

lpsz
 ~ Указатель на строку с IID или CLSID.

lpiid или pclsid
 ~ Указатель на переменную типа GUID, куда будет записан GUID.

#### Возвращаемое значение

В случае успеха функция возвращает константу `S_OK`, в случае ошибки — что‐то другое.

Однако тип возвращаемого значения `HRESULT` говорит, что проверять успешность выполненения функции следует макросами `SUCCEEDED` и `FAILED`, а не сравнивать результат напрямую с константой.


## Примеры

### Генератор GUID

В этом простом примере посмотрим как создать GUID и вывести его на консоль.

```FreeBASIC
#include "windows.bi"
#include "win\ole2.bi"

' Наш IID интерфейса
Dim IID_IFace As IID = Any
CoCreateGUID(@IID_IFace)

' Получаем строку
Dim pstrIID_IFace As WString Ptr = Any
StringFromIID(@IID_IFace, @pstrIID_IFace)

' Выводим на консоль
Print *pstrIID_IFace

' Очищаем память
CoTaskMemFree(pstrIID_IFace)
```
