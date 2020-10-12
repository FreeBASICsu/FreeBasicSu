# Статьи

<article>

<header>

## Строки BSTR

:::: { .posternameblock}
[ ![Аватар пользователя](/avatars/mabu.50x50.jpg){ .avatar width="50" height="50" } \@mabu](/users/mabu.htm) опубликовал <time datetime="2020-07-19T02:37:20+07:00" pubdate="2020-07-19T02:37:20+07:00">19 июля 2020</time>
::::

</header>

:::: { .fileblock}
<svg width="18em" height="18em" xmlns="http://www.w3.org/2000/svg">
<rect x="0" y="0" width="100%" height="100%" fill="green" stroke="green" />
</svg>
::::

Строковый тип данных является одним из самых важных в любом языке программировании. Вряд ли можно написать полезную программу не задействовав этот тип данных. Строки `BSTR` применяют в COM, потому что строки COM должны быть универсальными для всех языков.

[Читать дальше →](/articles/bstr.htm)

</article>


<article>

<header>

## Что такое GUID и зачем он нужен

:::: { .posternameblock}
[ ![Аватар пользователя](/avatars/mabu.50x50.jpg){ .avatar width="50" height="50" } \@mabu](/users/mabu.htm) опубликовал <time datetime="2019-01-26T00:45:10+07:00" pubdate="2019-01-26T00:45:10+07:00">26 января 2019</time>
::::

</header>

:::: { .fileblock}
<svg width="18em" height="18em" xmlns="http://www.w3.org/2000/svg">
<rect x="0" y="0" width="100%" height="100%" fill="cyan" stroke="cyan" />
</svg>
::::

Данный акроним расшифровывается как «Globally Unique Identifier» (глобально уникальный идентификатор). Технически, GUID представляет собой 128‐битное целое число. Цель создания GUID — уникальная идентификации чего‐либо. Он используется в любом месте, где нужен идентификатор, который гарантированно отличается от любого другого.

[Читать дальше →](/articles/guid/)

</article>


<article>

<header>

## Обработка ошибок в Windows

:::: { .posternameblock}
[ ![Аватар пользователя](/avatars/mabu.50x50.jpg){ .avatar width="50" height="50" } \@mabu](/users/mabu.htm) опубликовал <time datetime="2017-08-10T12:49:07+07:00" pubdate="2017-08-10T12:49:07+07:00">10 августа 2017</time>
::::

</header>

:::: { .fileblock}
<svg width="18em" height="18em" xmlns="http://www.w3.org/2000/svg">
<rect x="0" y="0" width="100%" height="100%" fill="none" stroke="black" stroke-width="2" />
<rect x="1em" y="4em" width="16em" height="9em" fill="#C0C0C0" stroke="black" />
<rect x="1em" y="4em" width="16em" height="1.5em" fill="#FFFFFF" stroke="black" />
<rect x="15.5em" y="4em" width="1.5em" height="1.5em" fill="#FFFFFF" stroke="black" />
<text x="16em" y="5em"><tspan style="font-weight: bold;">X</tspan></text>
<text x="2em" y="5em">Ошибка</text>
<text x="8em" y="8em">Ошибка!</text>
<rect x="6em" y="10em" width="4em" height="2em" fill="none" stroke="black" />
<text x="7em" y="11.25em">OK</text>
<rect x="11em" y="10em" width="5.5em" height="2em" fill="none" stroke="black" />
<text x="12em" y="11.25em">Отмена</text>
<circle cx="3.5em" cy="8.5em" r="2em" fill="#FF0000" stroke="black" />
<text x="1.11em" y="3.75em" fill="#FFFFFF"><tspan style="font-weight: bold;font-size: 2.5em;">X</tspan></text>
</svg>
::::

Прежде чем изучать функции, предлагаемые Microsoft Windows, посмотрим, как в них устроена обработка ошибок.

[Читать дальше →](/articles/winapi-errors/)

</article>


<article>

<header>

## Тип данных HRESULT

:::: { .posternameblock}
[ ![Аватар пользователя](/avatars/mabu.50x50.jpg){ .avatar width="50" height="50" } \@mabu](/users/mabu.htm) опубликовал <time datetime="2018-12-10T05:24:00+07:00" pubdate="2018-12-10T05:24:00+07:00">10 декабря 2018</time>
::::

</header>

:::: { .fileblock}
<svg width="18em" height="18em" xmlns="http://www.w3.org/2000/svg">
<rect x="0" y="0" width="100%" height="100%" fill="orange" stroke="orange" />
</svg>
::::

Тип HRESULT является одним из средств контроля ошибок в COM. Этот тип представляет собой 32‐битное число, в котором кодируется результат операции.

[Читать дальше →](/articles/datatype-hresult/)

</article>


<article>

<header>

## Файлы инициализации

:::: { .posternameblock}
[ ![Аватар пользователя](/avatars/mabu.50x50.jpg){ .avatar width="50" height="50" } \@mabu](/users/mabu.htm) опубликовал <time datetime="2016-02-10T09:25:31+07:00" pubdate="2016-02-10T09:25:31+07:00">10 февраля 2016</time>
::::

</header>

:::: { .fileblock}
<svg width="18em" height="18em" xmlns="http://www.w3.org/2000/svg">
<rect x="0" y="0" width="100%" height="100%" fill="none" stroke="black" stroke-width="2" />
<polygon points="130,12 207,12 207,251 62,251 62,72" fill="rgb(128,128,255)" stroke-width="3" stroke="rgb(0,0,0)" />
<polygon points="130,12 130,72 62,72" fill="rgb(128,128,255)" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="147" y1="33" x2="194" y2="33" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="147" y1="53" x2="194" y2="53" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="147" y1="73" x2="194" y2="73" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="93" x2="194" y2="93" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="113" x2="194" y2="113" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="133" x2="194" y2="133" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="153" x2="194" y2="153" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="173" x2="194" y2="173" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="193" x2="194" y2="193" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="213" x2="194" y2="213" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
<line x1="80" y1="233" x2="194" y2="233" stroke-linecap="round" stroke-width="3" stroke="rgb(0,0,0)" />
</svg>
::::

INI‐файл — это файл конфигурации, который содержит данные настроек для Microsoft Windows, Windows NT и некоторых приложений. С помощью функций `GetPrivateProfileString` и `WritePrivateProfileString` можно с лёгкостью манипулировать такими файлами: изменять, удалять и добавлять параметры и секции, получать весь список параметров и секций.

[Читать дальше →](/articles/winapi-inifiles/)

</article>


<article>

<header>

## Реестр Windows

:::: { .posternameblock}
[ ![Аватар пользователя](/avatars/mabu.50x50.jpg){ .avatar width="50" height="50" } \@mabu](/users/mabu.htm) опубликовал <time datetime="2017-03-05T23:25:31+07:00" pubdate="2017-03-05T23:25:31+07:00">5 марта 2017</time>
::::

</header>

:::: { .fileblock}
<svg width="18em" height="18em" xmlns="http://www.w3.org/2000/svg">
<rect x="0" y="0" width="100%" height="100%" fill="none" stroke="black" stroke-width="2" />
<rect x="1em" y="14em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="4em" y="14em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="7em" y="14em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="1em" y="11em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="4em" y="11em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="1em" y="8em" width="3em" height="3em" fill="cyan" stroke="blue" />
<line x1="1em" y1="8em" x2="2em" y2="7em" stroke="blue" />
<line x1="4em" y1="8em" x2="5em" y2="7em" stroke="blue" />
<line x1="2em" y1="7em" x2="5em" y2="7em" stroke="blue" />
<line x1="4em" y1="11em" x2="5em" y2="10em" stroke="blue" />
<line x1="7em" y1="11em" x2="8em" y2="10em" stroke="blue" />
<line x1="7em" y1="14em" x2="8em" y2="13em" stroke="blue" />
<line x1="10em" y1="14em" x2="11em" y2="13em" stroke="blue" />
<line x1="10em" y1="17em" x2="11em" y2="16em" stroke="blue" />
<line x1="11em" y1="16em" x2="11em" y2="13em" stroke="blue" />
<line x1="2em" y1="7em" x2="3em" y2="6em" stroke="blue" />
<line x1="5em" y1="7em" x2="6em" y2="6em" stroke="blue" />
<line x1="3em" y1="6em" x2="6em" y2="6em" stroke="blue" />
<line x1="8em" y1="7em" x2="9em" y2="6em" stroke="blue" />
<line x1="9em" y1="6em" x2="6em" y2="6em" stroke="blue" />
<line x1="8em" y1="10em" x2="9em" y2="9em" stroke="blue" />
<line x1="11em" y1="10em" x2="12em" y2="9em" stroke="blue" />
<line x1="11em" y1="13em" x2="12em" y2="12em" stroke="blue" />
<line x1="11em" y1="16em" x2="12em" y2="15em" stroke="blue" />
<line x1="12em" y1="15em" x2="12em" y2="12em" stroke="blue" />
<line x1="12em" y1="12em" x2="12em" y2="9em" stroke="blue" />
<line x1="3em" y1="6em" x2="4em" y2="5em" stroke="blue" />
<line x1="6em" y1="6em" x2="7em" y2="5em" stroke="blue" />
<line x1="4em" y1="5em" x2="7em" y2="5em" stroke="blue" />
<line x1="9em" y1="6em" x2="10em" y2="5em" stroke="blue" />
<line x1="10em" y1="5em" x2="7em" y2="5em" stroke="blue" />
<line x1="12em" y1="6em" x2="13em" y2="5em" stroke="blue" />
<line x1="13em" y1="5em" x2="10em" y2="5em" stroke="blue" />
<line x1="12em" y1="9em" x2="13em" y2="8em" stroke="blue" />
<line x1="13em" y1="8em" x2="13em" y2="5em" stroke="blue" />
<line x1="12em" y1="12em" x2="13em" y2="11em" stroke="blue" />
<line x1="13em" y1="11em" x2="13em" y2="8em" stroke="blue" />
<line x1="12em" y1="15em" x2="13em" y2="14em" stroke="blue" />
<line x1="13em" y1="14em" x2="13em" y2="11em" stroke="blue" />
<rect x="8em" y="10em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="5em" y="7em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="9em" y="6em" width="3em" height="3em" fill="cyan" stroke="blue" />
<rect x="10em" y="-10em" width="3em" height="3em" fill="cyan" stroke="blue" transform="rotate(45)" />
<rect x="7em" y="-6em" width="3em" height="3em" fill="cyan" stroke="blue" transform="rotate(45)" />
<rect x="15em" y="-7em" width="3em" height="3em" fill="cyan" stroke="blue" transform="rotate(45)" />
</svg>
::::

Реестр всегда был опасным местом для пользователей и разработчиков. Однако мы не будем избегать реестра как огня, а научимся им пользоваться.

[Читать дальше →](/articles/winapi-registry/)

</article>
