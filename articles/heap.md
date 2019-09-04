# Динамическое распределение памяти

Время жизни локальных переменных ограничено временем выполнения функции. После завершения функции они автоматически уничтожаются.

Глобальные переменные живут до завершения программы, но имеют заранее известный размер, поэтому они не подходят, когда требуется хранить и обрабатывать данные неизвестного размера и длины.

Динамическое выделение и освобождение памяти работает по запросу. Как следствие, ты можешь:

* выделять память под неизвестный заранее объём данных, причём этот объём может меняться в широких пределах;
* управляя временем существования объектов, созданных в динамической памяти, программа может решать по обстоятельствам, когда создавать какие-то объекты и когда их уничтожать;
* динамическая память видна из любого места программы, так что можно легко перекидывать объекты в функции, в другие потоки, возвращать их и тому подобное.

Во фрибейсике можно использовать как встроенные функции выделения памяти, так и функции операционной системы.


## Случаи, где FreeBASIC автоматически управляет памятью

Везде, где используются строки:

* переменной длины типа `String`: присваивание, копирование, уничтожение, объединение;
* фиксированной длины типов `ZString` и `WString`: создание временных объектов.

```
' Компилятор создаёт объект
Dim a As String

' Компилятор выделяет необходимое количество памяти под строку
' И копирует туда строковый литерал
a = "Hello"
Print a

' В этом месте также выделяется память для новой строки
a += ", world!"
Print a

' Здесь создаётся строка переменной длины сразу же с захватом памяти
var b = "Welcome to FreeBASIC"

' Здесь уже создаётся временный объект, состоящий из объединения нескольких строк,
' Который сразу же уничтожается после вывода его на печать
Print b + "! " + a

```

После выхода из зоны видимости все автоматические объекты уничтожаются, и память освобождается.


## Встроенные функции работы с памятью

### Allocate

Выделяет блок памяти из свободной.

```
Declare Function Allocate( _
    ByVal Count As UInteger _
)As Any Ptr
```


#### Параметры

| *** | *** |
|-----|-----|
| Count | Количество требуемых байт в блоке. |

#### Возвращаемое значение

В случае успеха функция возвращает указатель на первый байт блока памяти.

В случае ошибки функция возвращает 0.

<h4>Описание</h4>

<p>Функция <code>Allocate</code> выделяет блок памяти, количеством <code>Count</code> байт, и возвращает указатель на начало блока. Содержимое выделенного блока не инициализируется нулями или чем‐либо ещё, оно остаётся с неопределёнными значениями (так называемый мусор).</p>

<p>Тип возвращаемых данных — это <code>Any Ptr</code>, поэтому результат может быть приведен к любому желаемому типу данных.</p>

<p>Когда блок памяти больше не нужен, то выделенную таким способом память следует освобождать функцией <code>Deallocate</code>.</p>

<p>Памяти может не хватить, поэтому всегда следует проверять возвращаемое значение на 0, чтобы избежать ошибок.</p>


<h3><a id="c2c2">Deallocate</a></h3>

<p>Освобождает ранее выделенный блок памяти.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Declare</span> <span class="keyword">Sub</span> <span class="keyword">Deallocate</span>( _<br />
&t;<span class="keyword">ByVal</span> Pointer <span class="keyword">As</span> <span class="datatype">Any Ptr</span> _<br />
)
</code></p>

<h4>Параметры</h4>

<dl>
<dt>Pointer</dt>
<dd>Указатель на ранее выделенный функцией <code>Allocate</code> блок памяти.</dd>
</dl>

<h4>Возвращаемое значение</h4>

<p>Функция не возвращает значений.</p>

<h4>Описание</h4>

<p>Функция <code>Deallocate</code> освобождает место в памяти. Блок памяти, ранее выделенный с помощью вызова <code>Allocate</code> отмечается как свободный. Освобождённая память может захватываться программами или операционной системой. Обрати внимание, что эта функция оставляет значение параметра <code>Pointer</code> неизменным, он по‐прежнему будет указывать на тот же блок памяти, а не на нулевой указатель.</p>

<p>Освобождать один и тот же блок памяти более одного раза нельзя. Это ошибка, приводящая к неопределённому поведению.</p>

<p>После вызова <code>Deallocate</code> блок памяти уже недоступен программе, поэтому использовать указатель на него в дальнейшем нельзя. Некоторые программисты сразу же после вызова <code>Deallocate</code> присваивают 0 этому указателю, чтобы избежать ошибок.</p>

<p>Функции встроенной библиотеки могут не сразу отдавать память операционной системе. Хотя для самой программы эта память помечена как свободная, но операционная система видит её до сих пор зарезервированной за этой программой. Такое поведение упрощает последующие выделения памяти, экономя несколько системных вызовов.</p>

<h4>Пример</h4>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Будем выделять 8 килобайт</span><br />
<span class="keyword">Const</span> BufferSize <span class="keyword">As</span> <span class="datatype">Integer</span> = 1024 * 8<br />
<br />
<span class="remark">&apos; Выделить кусок памяти определённого размера</span><br />
<span class="keyword">Dim</span> buffer <span class="keyword">As</span> <span class="datatype">Byte Ptr</span> = <span class="keyword">Allocate</span>(BufferSize)<br />
<br />
<span class="remark">&apos; Проверить на ошибку и завершиться, если не удалось выделить память</span><br />
<span class="keyword">If</span> buffer = 0 <span class="keyword">Then</span><br />
&t;<span class="keyword">Print</span> <span class="string">&quot;Не могу выделить память&quot;</span><br />
&t;<span class="keyword">End</span>(1)<br />
<span class="keyword">End If</span><br />
<br />
<span class="remark">&apos; Что‐нибудь сделать с памятью</span><br />
<span class="keyword">For</span> i <span class="keyword">As</span> <span class="datatype">Integer</span> = 0 <span class="keyword">To</span> BufferSize - 1<br />
&t;buffer[i] = 123<br />
<span class="keyword">Next</span><br />
<br />
<span class="remark">&apos; Память больше не нужна, возвращаем её</span><br />
<span class="keyword">Deallocate</span>(buffer)
</code></p>


<h3><a id="c2c3">New</a></h3>

<p>Выделяет память под объект. Особенность этой функции: после того, как компилятор встретит её в тексте, он автоматически добавит вызов конструктора объекта.</p>

<p>Есть два варианта этой функции:</p>

<ul>
<li><code>New тип</code> без квадратных скобок выделяет память для одного объекта, это могут быть как встроенные типы данных, так и определяемые самостоятельно;</li>
<li><code>New тип[количество]</code> с квадратными скобками выделяет память для нескольких объектов, фактически создаёт массив, в этом случае в квадратных скобках указывается их количество.</li>
</ul>

<p>Результатом выполнения функции <code>New</code> будет указатель на отведенную память или 0 в случае ошибки.</p>


<h3><a id="c2c4">Delete</a></h3>

<p>Освобождает память, занятую объектом. Перед этим компилятор автоматически добавляет вызов деструктора объекта.</p>

<p>Освобождение памяти связано с тем, как она выделялась: для одного элемента или для нескольких. В соответствии с этим существуют две формы применения <code>Delete</code>:</p>

<ul>
<li><code>Delete указатель</code> без квадратных скобок применяется для уничтожения одиночного объекта, когда он был создан функцией <code>New</code> без квадратных скобок;</li>
<li><code>Delete[] указатель</code> с квадратными скобками применяется для уничтожения нескольких объектов, когда они все были созданы функцией <code>New[]</code> с квадратными скобками (скобки <code>Delete[]</code> должны быть пустые).</li>
</ul>

<p>Освобождаться с помощью <code>Delete</code> может только память, выделенная функцией <code>New</code>.</p>

<h4>Пример с одиночным объектом</h4>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Объявим какой‐нибудь класс, например, обыкновенную дробь</span><br />
<span class="keyword">Type</span> Rational<br />
&t;<span class="keyword">Dim</span> Numerator <span class="keyword">As</span> <span class="datatype">Integer</span><br />
&t;<span class="keyword">Dim</span> Denominator <span class="keyword">As</span> <span class="datatype">Integer</span><br />
<span class="keyword">End Type</span><br />
<br />
<span class="remark">&apos; Создаём объект, компилятор также вызовет его конструктор</span><br />
<span class="keyword">Dim</span> pRational <span class="keyword">As</span> <span class="datatype">Rational Ptr</span> = <span class="keyword">New</span> <span class="datatype">Rational</span>(3, 4)<br />
<br />
<span class="remark">&apos; Удаление объекта</span><br />
<span class="keyword">Delete</span> pRational
</code></p>

<h4>Пример с массивом объектов</h4>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Выделяем память для 100 целых чисел</span><br />
<span class="keyword">Dim</span> p <span class="keyword">As</span> <span class="datatype">Integer Ptr</span> = <span class="keyword">New</span> <span class="datatype">Integer</span>[100]<br />
<br />
<span class="remark">&apos; Присвоим какие‐нибудь значения элементам в этом массиве</span><br />
<span class="keyword">For</span> i <span class="keyword">As</span> <span class="datatype">Integer</span> = 0 <span class="keyword">To</span> 99<br />
&t;p[i] = i<br />
<span class="keyword">Next</span><br />
<br />
<span class="remark">&apos; Удаление массива объектов</span><br />
<span class="keyword">Delete</span>[] p
</code></p>


<h2><a id="c3">Кучи памяти</a></h2>

<p>Куча памяти — это специальный регион виртуальной памяти, с помощью которого в операционной системе реализована динамически распределяемая память процесса. Физически представляет собой область памяти, поделённую на занятые и свободные части различного размера. При запуске любого процесса операционная система создаёт для него одну стандартную кучу. В дальнейшем можно самостоятельно создавать и уничтожать кучи.</p>

<p>Все кучи принадлежат и доступны только тому процессу, в котором были созданы. Вся выделенная память из кучи является «собственными байтами» процесса. Если библиотека динамический компоновки (DLL) создаёт дополнительную кучу, то она также будет принадлежать вызвавшему эту библиотеку процессу.</p>

<p>Для того, чтобы запросить память у операционной системы, необходимо каким‐либо образом получить описатель кучи: либо из стандартной кучи процесса, либо из самостоятельно созданной.</p>


<h3><a id="c3c1">Стандартная куча процесса</a></h3>

<p>Создаётся операционной системой при запуске процесса и автоматически уничтожается при его завершении. Самостоятельно уничтожить такую кучу нельзя.</p>

<p>Получить описатель стандартной кучи процесса можно функцией <code>GetProcessHeap</code>.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Declare</span> <span class="keyword">Function</span> GetProcessHeap( _<br />
)<span class="keyword">As</span> <span class="datatype">HANDLE</span>
</code></p>

<h4>Параметры</h4>

<p>Функция не имеет параметров.</p>

<h4>Возвращаемое значение</h4>

<p>В случае успеха функция возвращает описатель стандартной кучи процесса.</p>

<p>В случае ошибки функция возвращает 0.</p>

<h4>Описание</h4>

<p>Функция <code>GetProcessHeap</code> получает описатель кучи, который можно использовать для выделения памяти без необходимости создания дополнительных куч.</p>

<p>Все глобальные переменные хранятся в стандартной куче процесса.</p>


<h3><a id="c3c2">Создание дополнительных куч</a></h3>

<p>Во многих случаях одной кучи вполне достаточно, но в силу ряда причин иногда целесообразно иметь в своём распоряжении несколько куч:</p>

<ul>
<li>защита компонентов, например, элементы одного списка создаются в одной куче, а элементы второго списка в другой;</li>
<li>более эффективное управление памятью, когда в куче создаются объекты одинакового размера;</li>
<li>локальный доступ, когда связанные объекты создаются в одной куче «близко друг к другу» для уменьшения подкачки страниц;</li>
<li>исключение издержек, связанных с синхронизацей потоков;</li>
<li>быстрое освобождение памяти в куче.</li>
</ul>

<p>Дополнительные кучи можно создать функцией <code>HeapCreate</code>.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Declare</span> <span class="keyword">Function</span> HeapCreate( _<br />
&t;<span class="keyword">ByVal</span> flOptions <span class="keyword">As</span> <span class="datatype">DWORD</span>, _<br />
&t;<span class="keyword">ByVal</span> dwInitialSize <span class="keyword">As</span> <span class="datatype">SIZE_T_</span>, _<br />
&t;<span class="keyword">ByVal</span> dwMaximumSize <span class="keyword">As</span> <span class="datatype">SIZE_T_</span> _<br />
)<span class="keyword">As</span> <span class="datatype">HANDLE</span>
</code></p>

<h4>Параметры</h4>

<dl>
<dt>flOptions</dt>
<dd>Специальные флаги, модифицирующие выполняемые операции с кучей. Самый интересный — это <code>HEAP_NO_SERIALIZE</code>, который заставит операционную систему отключить синхронизацию выделения памяти. Если не уверен, просто указывай здесь 0.</dd>
</dl>

<dl>
<dt>dwInitialSize</dt>
<dd>Количество байтов памяти, первоначально выдаваемых куче. Может быть 0.</dd>
</dl>

<dl>
<dt>dwMaximumSize</dt>
<dd>Указывает максимальный размер, до которого может расширяться куча. Если он больше 0, то куча будет именно такого размера и не сможет увеличиваться. Если этот параметр равен 0, то система резервирует регион и, если надо, расширяет его до максимально возможного объёма.</dd>
</dl>

<h4>Возвращаемое значение</h4>

<p>Если функция завершилась успешно, то возвращается описатель созданной кучи.</p>

<p>В случае ошибки возвращается 0.</p>

<h4>Описание</h4>

<p>Функция создаёт кучу, из которой вызывающий процесс может запрашивать память.</p>

<p>Если флаг <code>HEAP_NO_SERIALIZE</code> не указан (значение по умолчанию), то операционная система синхронизирует доступ к куче в вызывающем процессе. Синхронизация обеспечивает взаимное исключение при попытке двух или более потоков одновременно выделить или освободить блоки памяти из одной кучи. Синхронизация требует небольших затрат на производительность, её необходимо использовать всякий раз, когда несколько потоков выделяют и освобождают память из одной кучи. Чтобы не повредить данные в куче, флаг <code>HEAP_NO_SERIALIZE</code> следует указывать только в следующих случаях:</p>

<ul>
<li>в процессе существует лишь один поток;</li>
<li>в процессе несколько потоков, но с кучей работает лишь один из них;</li>
<li>в процессе несколько потоков, но он сам регулирует доступ к куче, применяя различные формы взаимоисключения, например, критические секции, мьютексы, семафоры.</li>
</ul>

<p>Если ты не уверен, нужен ли тебе флаг <code>HEAP_NO_SERIALIZE</code>, то лучше не пользуйся им.</p>


<h3><a id="c3c3">Выделение памяти из кучи</a></h3>

<p>Для этого достаточно вызвать функцию <code>HeapAlloc</code>.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Declare</span> <span class="keyword">Function</span> HeapAlloc( _<br />
&t;<span class="keyword">ByVal</span> hHeap <span class="keyword">As</span> <span class="datatype">HANDLE</span>, _<br />
&t;<span class="keyword">ByVal</span> dwFlags <span class="keyword">As</span> <span class="datatype">DWORD</span>, _<br />
&t;<span class="keyword">ByVal</span> dwBytes <span class="keyword">As</span> <span class="datatype">SIZE_T_</span> _<br />
)<span class="keyword">As</span> <span class="datatype">Any Ptr</span>
</code></p>

<h4>Параметры</h4>

<dl>
<dt>hHeap</dt>
<dd>Описатель кучи, из которой запрашивается блок памяти.</dd>
</dl>

<dl>
<dt>dwFlags</dt>
<dd>Комбинация флагов:
<ul>
<li><code>HEAP_NO_SERIALIZE</code> — чтобы не синхронизировать доступ к куче из разных потоков;</li>
<li><code>HEAP_ZERO_MEMORY</code> — если требуется обнулить блок памяти, без этого флага память отдаётся без очистки, там может быть всё, что угодно.</li>
</ul>
</dd>
</dl>

<dl>
<dt>dwBytes</dt>
<dd>Размер требуемого блока в байтах.</dd>
</dl>

<h4>Возвращаемое значение</h4>

<p>Если функция завершилась успешно, то возвращается указатель на выделенную память.</p>

<p>В случае ошибки возвращается 0.</p>

<h4>Описание</h4>

<p>Функция <code>HeapAlloc</code> выделяет блок памяти, количеством <code>dwBytes</code> байт, и возвращает указатель на начало блока. Содержимое выделенного блока можно обнулить, если указать флаг <code>HEAP_ZERO_MEMORY</code>, или оставить как есть с неопределёнными значениями (так называемый мусор).</p>

<p>Тип возвращаемых данных — это <code>Any Ptr</code>, поэтому результат может быть приведен к любому желаемому типу данных.</p>

<p>Когда блок памяти больше не нужен, то выделенную таким способом память следует освобождать функцией <code>HeapFree</code>.</p>

<p>Всегда следует проверять возвращаемое значение на 0, чтобы избежать ошибок.</p>


<h3><a id="c3c5">Освобождение памяти из кучи</a></h3>

<p>Если память больше не нужна, её следует отдать операционной системе функцией <code>HeapFree</code>.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Declare</span> <span class="keyword">Function</span> HeapFree( _<br />
&t;<span class="keyword">ByVal</span> hHeap <span class="keyword">As</span> <span class="datatype">HANDLE</span>, _<br />
&t;<span class="keyword">ByVal</span> dwFlags <span class="keyword">As</span> <span class="datatype">DWORD</span>, _<br />
&t;<span class="keyword">ByVal</span> lpMem <span class="keyword">As</span> <span class="datatype">Any Ptr</span> _<br />
)<span class="keyword">As</span> <span class="datatype">Integer</span>
</code></p>

<h4>Параметры</h4>

<dl>
<dt>hHeap</dt>
<dd>Описатель кучи, из которой освобождается память.</dd>
</dl>

<dl>
<dt>dwFlags</dt>
<dd>Флаги доступа к куче, может быть 0 или <code>HEAP_NO_SERIALIZE</code>.</dd>
</dl>

<dl>
<dt>lpMem</dt>
<dd>Указатель на память, которую следует вернуть системе.</dd>
</dl>

<h4>Возвращаемое значение</h4>

<p>Если функция завершилась успешно, то возвращается любое ненулевое значение.</p>

<p>В случае ошибки возвращается 0.</p>


<h4>Описание</h4>

<p>Функция даёт указание операционной системе отметить участок памяти как свободный. В то же время система необязательно сразу же забирает его себе, она может придержать его за процессом для лучшей производительности в операциях последующего выделения памяти. Так или иначе, переменная, которая ссылалась на этот блок памяти, теперь ссылается на недействительные адреса, использовать её больше нельзя, некоторые программисты присваивают ей 0, чтобы исключить ошибки.</p>


<h3><a id="c3c6">Уничтожение куч</a></h3>

<p>Когда куча больше не нужна, её следует уничтожить функцией <code>HeapDestroy</code>.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Declare</span> <span class="keyword">Function</span> HeapDestroy( _<br />
&t;<span class="keyword">ByVal</span> hHeap <span class="keyword">As</span> <span class="datatype">HANDLE</span> _<br />
)<span class="keyword">As</span> <span class="datatype">Integer</span>
</code></p>

<h4>Параметры</h4>

<dl>
<dt>hHeap</dt>
<dd>Описатель кучи, которую требуется уничтожить.</dd>
</dl>

<h4>Возвращаемое значение</h4>

<p>Если функция завершилась успешно, то возвращается любое ненулевое значение.</p>

<p>В случае ошибки возвращается 0.</p>


<h4>Описание</h4>

<p>Это действие уничтожает дополнительну кучу и лишает законной силы описатель кучи, который больше не может использоваться программой. Когда куча разрушается, то освобождаются все выделенные из неё блоки памяти и возвращаются системе.</p>

<p>Это удобно, когда требуется уничтожить какой‐нибудь список или дерево, целиком располагающеися в одной куче: в таком случае вместо последовательных вызовов освобождения памяти для каждого элемента списка, достаточно один раз вызвать <code>HeapDestroy</code>. Все переменные, которые ранее ссылались на блоки памяти в уничтоженной куче, теперь будут указывать на недействительные адреса.</p>

<p>Если не уничтожать кучу самостоятельно, то операционная система уничтожит её автоматически, но только при завершении процесса. Кучи, созданные в других потоках, тоже будут уничтожены только при завершении всего процесса, поэтому хорошей практикой является уничтожение кучи сразу же как только она уже не нужна.</p>

<p>Система не позволит уничтожить стандартную кучу процесса: она уничтожается только при завершении процесса. Если ты передашь указатель стандартной кучи процесса в функцию <code>HeapDestroy</code>, то система проигнорирует такой вызов.</p>


<h2><a id="c4">Ошибки при использовании динамической памяти</a></h2>

<p>При работе с динамической памятью можно совершить большое количество ошибок разной степени тяжести. Последствия наступают не сразу при возникновении ошибки, а через некоторое время в процессе выполнения программы. Такие ошибки трудно находить, и потому они особенно опасны.</p>

<h3><a id="c4c1">Отсутствие проверки успешного выделения памяти</a></h3>

<p>Библиотечные функции <code>Allocate</code> или <code>New</code> используют стандартную кучу процесса для выделения памяти. Если затребованный размер памяти слишком большой, то операционная система не будет выделять память и тогда функции вернут нулевое значение. Если это нулевое значение будет присвоено указателю, к которому впоследствии будет применён оператор разыменования указателя или оператор индексирования, то операционная система аварийно завершит работу программы с ошибкой сегментации (Segmentation Fault). Для того чтобы избежать таких ошибок необходимо сразу после выделения памяти проверять возвращаемое значение функций на ноль.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Const</span> MaxLength <span class="keyword">As</span> <span class="datatype">Integer</span> = 1000000000<br />
<span class="keyword">Dim</span> p <span class="keyword">As</span> <span class="datatype">Integer Ptr</span> = <span class="keyword">Allocate</span>(MaxLength * <span class="keyword">SizeOf</span>(<span class="datatype">Integer</span>))<br />
<span class="keyword">If</span> p = 0 <span class="keyword">Then</span><br />
&t;<span class="keyword">Print</span> <span class="string">&quot;Требуемая память не выделена&quot;</span><br />
<span class="keyword">End If</span>
</code></p>

<h3><a id="c4c2">Утечки памяти</a></h3>

<p>Данная ошибка возникает, когда память не освобождается, но перестаёт контролироваться указателем. Подобную ошибку называют утечкой памяти, поскольку такую память невозможно освободить. Ошибка труднонаходима, она не сказывается на работе приложения. Однако при систематических утечках программа требует всё больше памяти у операционной системы. Рано или поздно вступают в действие архитектурные ограничения операционной системы, и тогда новое выделение памяти становится невозможным. В этой ситуации в программе, которая запрашивает память, обычно происходит аварийная остановка.</p>

<p>Утечки памяти происходят по следующим причинам:</p>

<ul>
<li>есть вызов <code>Allocate</code>, но нет соответствующего ему <code>Deallocate</code>;</li>
<li>есть <code>New</code>, но нет соответствующего ему <code>Delete</code>;</li>
<li>есть создание динамического массива, но нет соответствующего ему стирания массива;</li>
<li>есть выделение памяти из кучи, но нет соответствующего ему освобождения.</li>
</ul>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Dim</span> p <span class="keyword">As</span> <span class="datatype">Integer Ptr</span> = <span class="keyword">New</span> <span class="datatype">Integer</span><br />
*p = 55<br />
<span class="remark">&apos; Выделяется новый кусок памяти в тот же указатель</span><br />
p = <span class="keyword">New</span> <span class="datatype">Integer</span><br />
<span class="remark">&apos; Доступ к старой памяти невозможен, теперь её невозможно освободить, произошла утечка</span>
</code></p>

<h3><a id="c4c3">Повторное освобождение</a></h3>

<p>Попытка передать в функцию указатель на память, которая ранее была освобождена, приведёт к неопределённому поведению. На практике это означает, что может произойти всё, что угодно: программа упадёт, закричит, перестанет отвечать, повредятся важные данные или что‐нибудь ещё.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="remark">&apos; Создаём динамическтй массив из 20 целых чисел</span><br />
<span class="keyword">Dim</span> p <span class="keyword">As</span> <span class="datatype">Integer Ptr</span> = <span class="keyword">New</span> <span class="datatype">Integer[20]</span><br />
<span class="remark">&apos; Освобождаем память</span><br />
<span class="keyword">Delete</span>[] p<br />
<span class="remark">&apos; Повторно освобождать память нельзя, это приводит к неопрделённому поведению</span><br />
<span class="keyword">Delete</span>[] p
</code></p>

<h3><a id="c4c4">Освобождение памяти не своей функцией</a></h3>

<p>Освобождение памяти следует производить соответствующей парной функцией:</p>

<ul>
<li>для <code>Allocate</code> — <code>Deallocate</code>;</li>
<li>для <code>New</code> — <code>Delete</code>;</li>
<li>для <code>New[]</code> — <code>Delete[]</code>;</li>
</ul>

<p>Нельзя смешивать эти функции, так как это приводит к неопределённому поведению.</p>

<h3><a id="c4c5">Обращение к неинициализированному указателю</a></h3>

<p>Нельзя обращаться к указателю, которому не присвоен действительный адрес памяти:</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Dim</span> p <span class="keyword">As</span> <span class="datatype">Integer Ptr</span><br />
<span class="remark">&apos; Освобождение невыделенной памяти — это ошибка</span><br />
<span class="keyword">Delete</span> p
</code></p>

<h3><a id="c4c6">Освобождение нединамической памяти</a></h3>

<p>Нельзя освобождать память, которая не выделена динамически:</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="keyword">Dim</span> Size <span class="keyword">As</span> <span class="datatype">Integer</span> = 42<br />
<span class="keyword">Dim</span> p <span class="keyword">As</span> <span class="datatype">Integer Ptr</span> = @Size<br />
<span class="remark">&apos; Овсобождение нединамической памяти — это ошибка</span><br />
<span class="keyword">Delete</span> p
</code></p>



<h2><a id="c5">Пример</a></h2>

<p>Рассмотрим программу, которая сортирует слова, переданные в командной строке, по алфавиту с помощью двоичного дерева.</p>

<p class="codebox"><span>Код</span> <span>FreeBASIC</span><br /><code>
<span class="preprocessor">#define unicode</span><br />
<span class="preprocessor">#include once &quot;windows.bi&quot;</span><br />
<span class="preprocessor">#include once &quot;win\shellapi.bi&quot;</span><br />
<br />
<span class="remark">&apos; Размер буфера под строку</span><br />
<span class="keyword">Const</span> NodeDataBufferSize <span class="keyword">As</span> <span class="datatype">Integer</span> = 256<br />
<br />
<span class="remark">&apos; Узел дерева</span><br />
<span class="keyword">Type</span> <span class="datatype">Node</span><br />
&t;<span class="remark">&apos; Левая ветка</span><br />
&t;<span class="keyword">Dim</span> LeftNode <span class="keyword">As</span> <span class="datatype">Node Ptr</span><br />
&t;<span class="remark">&apos; Правая ветка</span><br />
&t;<span class="keyword">Dim</span> RightNode <span class="keyword">As</span> <span class="datatype">Node Ptr</span><br />
&t;<span class="remark">&apos; Данные</span><br />
&t;<span class="keyword">Dim</span> Data <span class="keyword">As</span> <span class="datatype">WString</span> * (NodeDataBufferSize + 1)<br />
<span class="keyword">End Type</span><br />
<br />
<span class="remark">&apos; Создание узла</span><br />
<span class="keyword">Function</span> CreateNode(<span class="keyword">ByVal</span> hHeap <span class="keyword">As</span> <span class="datatype">Handle</span>)<span class="keyword">As</span> <span class="datatype">Node Ptr</span><br />
&t;<span class="remark">&apos; Выделить память в куче под объект</span><br />
&t;<span class="keyword">Dim</span> pNode <span class="keyword">As</span> <span class="datatype">Node Ptr</span> = HeapAlloc(hHeap, HEAP_NO_SERIALIZE, <span class="keyword">SizeOf</span>(<span class="datatype">Node</span>))<br />
&t;<span class="keyword">If</span> pNode &lt;&gt; 0 <span class="keyword">Then</span><br />
&t;&t;<span class="remark">&apos; Обнулить поля, потому что в них сейчас мусор</span><br />
&t;&t;pNode-&gt;LeftNode = 0<br />
&t;&t;pNode-&gt;RightNode = 0<br />
&t;&t;pNode-&gt;Data[0] = 0<br />
&t;<span class="keyword">End If</span><br />
&t;<span class="keyword">Return</span> pNode<br />
<span class="keyword">End Function</span><br />
<br />
<span class="remark">&apos; Добавление данных</span><br />
<span class="keyword">Sub</span> AddNode(<span class="keyword">ByVal</span> pNode <span class="keyword">As</span> <span class="datatype">Node Ptr</span>, <span class="keyword">ByVal</span> hHeap <span class="keyword">As</span> <span class="datatype">Handle</span>, <span class="keyword">ByVal</span> s <span class="keyword">As</span> <span class="datatype">WString Ptr</span>)<br />
&t;<span class="keyword">If</span> <span class="keyword">Len</span>(pNode-&gt;Data) = 0 <span class="keyword">Then</span><br />
&t;&t;<span class="remark">&apos; В узле нет данных, добавить</span><br />
&t;&t;pNode-&gt;Data = *s<br />
&t;<span class="keyword">Else</span><br />
&t;&t;<span class="keyword">Select</span> <span class="keyword">Case</span> lstrcmp(s, @pNode-&gt;Data)<br />
&t;&t;&t;<span class="keyword">Case</span> <span class="keyword">Is</span> &gt; 0<br />
&t;&t;&t;&t;<span class="remark">&apos; Добавить в правую ветку</span><br />
&t;&t;&t;&t;<span class="keyword">If</span> pNode-&gt;RightNode = 0 <span class="keyword">Then</span><br />
&t;&t;&t;&t;&t;pNode-&gt;RightNode = CreateNode(hHeap)<br />
&t;&t;&t;&t;<span class="keyword">End If</span><br />
&t;&t;&t;&t;<span class="keyword">If</span> pNode-&gt;RightNode &lt;&gt; 0 <span class="keyword">Then</span><br />
&t;&t;&t;&t;&t;AddNode(pNode-&gt;RightNode, hHeap, s)<br />
&t;&t;&t;&t;<span class="keyword">End If</span><br />
&t;&t;&t;<span class="keyword">Case</span> 0<br />
&t;&t;&t;&t;<span class="remark">&apos; Не добавлять дубликат</span><br />
&t;&t;&t;<span class="keyword">Case</span> <span class="keyword">Is</span> &lt; 0<br />
&t;&t;&t;&t;<span class="remark">&apos; Добавить в левую ветку</span><br />
&t;&t;&t;&t;<span class="keyword">If</span> pNode-&gt;LeftNode = 0 <span class="keyword">Then</span><br />
&t;&t;&t;&t;&t;pNode-&gt;LeftNode = CreateNode(hHeap)<br />
&t;&t;&t;&t;<span class="keyword">End If</span><br />
&t;&t;&t;&t;<span class="keyword">If</span> pNode-&gt;LeftNode &lt;&gt; 0 <span class="keyword">Then</span><br />
&t;&t;&t;&t;&t;AddNode(pNode-&gt;LeftNode, hHeap, s)<br />
&t;&t;&t;&t;<span class="keyword">End If</span><br />
&t;&t;<span class="keyword">End Select</span><br />
&t;<span class="keyword">End If</span><br />
<span class="keyword">End Sub</span><br />
<br />
<span class="remark">&apos; Печать дерева</span><br />
<span class="keyword">Sub</span> PrintTree(<span class="keyword">ByVal</span> pNode <span class="keyword">As</span> <span class="datatype">Node Ptr</span>)<br />
&t;<span class="keyword">If</span> pNode &lt;&gt; 0 <span class="keyword">Then</span><br />
&t;&t;<span class="remark">&apos; Печать левой ветки</span><br />
&t;&t;PrintTree(pNode-&gt;LeftNode)<br />
&t;&t;<span class="remark">&apos; Печать данных</span><br />
&t;&t;<span class="keyword">Print</span> pNode-&gt;Data<br />
&t;&t;<span class="remark">&apos; Печать правой ветки</span><br />
&t;&t;PrintTree(pNode-&gt;RightNode)<br />
&t;<span class="keyword">End If</span><br />
<span class="keyword">End Sub</span><br />
<br />
<span class="remark">&apos; Разбить командную строку на пробелы</span><br />
<span class="keyword">Dim</span> ArgsCount <span class="keyword">As</span> <span class="datatype">Long</span> = <span class="keyword">Any</span><br />
<span class="keyword">Dim</span> Args <span class="keyword">As</span> <span class="datatype">WString Ptr Ptr</span> = CommandLineToArgvW(GetCommandLine(), @ArgsCount)<br />
<br />
<span class="remark">&apos; Создать кучу</span><br />
<span class="keyword">Dim</span> hHeap <span class="keyword">As</span> <span class="datatype">Handle</span> = HeapCreate(HEAP_NO_SERIALIZE, 0, 0)<br />
<span class="keyword">If</span> hHeap &lt;&gt; 0 <span class="keyword">Then</span><br />
&t;<span class="remark">&apos; Дерево</span><br />
&t;<span class="keyword">Dim</span> Tree <span class="keyword">As</span> <span class="datatype">Node Ptr</span> = CreateNode(hHeap)<br />
&t;<span class="keyword">If</span> Tree &lt;&gt; 0 <span class="keyword">Then</span><br />
&t;&t;<span class="remark">&apos; Добавление данных</span><br />
&t;&t;<span class="keyword">For</span> i <span class="keyword">As</span> <span class="datatype">Integer</span> = 1 <span class="keyword">To</span> ArgsCount - 1<br />
&t;&t;&t;AddNode(Tree, hHeap, Args[i])<br />
&t;&t;<span class="keyword">Next</span><br />
&t;&t;<span class="remark">&apos; Показать результат</span><br />
&t;&t;PrintTree(Tree)<br />
&t;<span class="keyword">End If</span><br />
<br />
&t;<span class="remark">&apos; Удаление дерева простым уничтожением кучи, в которой оно размещалось</span><br />
&t;HeapDestroy(hHeap)<br />
<span class="keyword">End If</span><br />
<br />
LocalFree(Args)
</code></p>
