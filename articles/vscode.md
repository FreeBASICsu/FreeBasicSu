# Visual Studio Code

Как настроить Visual Studio Code для работы с фрибейсиком.

## Студия и расширения

Скачиваем и устанавливаем студию с официального сайта: [Visual Studio Code](https://code.visualstudio.com/)

После установки нам необходимы расширения.

### Важные

Русификатор для студии [Russian Language Pack for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-ru)

Нужен для отладки [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

### Подсветка синтаксиса

Для фрибесика: [FreeBASIC](https://marketplace.visualstudio.com/items?itemName=sorucoder.freebasic)

Для ассемблера: [x86 and x86_64 Assembly](https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly)

Для файлов с ресурсами: [RC Script Language](https://marketplace.visualstudio.com/items?itemName=willasm.rc-script)

### Дополнительно для отладки

Просмотр дампов памяти во время отладки: [MemoryView](https://marketplace.visualstudio.com/items?itemName=mcu-debug.memory-view)

16‐ричный редактор [Hex Editor](https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor)

### Прочее

Программа контроля версий: [git](https://git-scm.com/download/win).

Расширение стандартных git‐возможностей: [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

Интеграция утилиты make: [Makefile Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools)

Подсчёт количества строк в проекте: [VS Code Counter](https://marketplace.visualstudio.com/items?itemName=uctakeoff.vscode-counter)

Горячие клавиши как в Notepad++: [Notepad++ keymap](https://marketplace.visualstudio.com/items?itemName=ms-vscode.notepadplusplus-keybindings)

Проверка правильности кода: [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

Русификатор для Code Spell Checker [Russian - Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-russian)

## Создание проекта

Для единообразия и организованности, предположим, что все наши проекты будут расположены в каталоге `C:\FreeBasic Projects`.

Запускаем студию.

Чтобы создать проект, в меню меню «Файл» выбираем «Открыть папку». Создаём в диалоге новую папку `Мой первый проект`, и выбираем её. Путь к проекту будет следующим: `C:\FreeBasic Projects\Мой первый проект`.

Создадим директории:

* `.vscode` — конфигурация проекта;
* `bin` — скомпилированные исполняемые файлы;
* `src` — исходные коды.

Иногда полезно размещать отладочную и окончательную версии программ по разным путям. Для этого создаём подкаталоги:

* `bin\Debug\x64` — отладочные исполняемые файлы для x64;
* `bin\Debug\x86` — отладочные исполняемые файлы для x86;
* `bin\Release\x64` — окончательные исполняемые файлы для x64;
* `bin\Release\x86` — окончательные исполняемые файлы для x86.

Объектные файлы можно разместить по таким путям:
 
* `obj\Debug\x64` — отладочные объектные файлы для x64;
* `obj\Debug\x86` — отладочные объектные файлы для x86;
* `obj\Release\x64` — окончательные объектные файлы для x64;
* `obj\Release\x86` — окончательные объектные файлы для x86.

### Исходный файл

Для примера создадим простую программу, которая сортирует массив чисел:

```FreeBASIC
#include once "crt.bi"

' Функция‐компаратор
' Такая функция принимает два аргумента и возвращает значение
' какой из этих аргументов больше, меньше или они равны
' Функция должна быть отмечена как "cdecl"
Function CompareInteger cdecl(ByVal p As Const Any Ptr, ByVal q As Const Any Ptr) As Long
	
	Dim x As Integer = *(CPtr(Integer Ptr, p))
	Dim y As Integer = *(CPtr(Integer Ptr, q))
	
	' Для сортировки по возрастанию
	If x > y Then
		' Возвращаем 1 когда первый элемент больше
		Return 1
	Else
		If y > x Then
			' Возвращаем -1 когда второй элемент больше
			Return -1
		End If
	End If
	
	' Когда элементы равны, возвращаем 0
	Return 0
	
End Function

' Вводим массив чисел
Dim Vector(9) As Integer
For i As Integer = LBound(Vector) To UBound(Vector)
	Input "Input vector item", Vector(i)
Next

' Сортировать
qsort( _
	@Vector(0), _      /' Функция требует указатель на начало массива '/
	10, _              /' Количество элементов в массиве '/
	SizeOf(Integer), _ /' Размер одного элемента '/
	@CompareInteger _  /' Адрес функции-компаратора '/
)

' Распечатываем
For i As Integer = LBound(Vector) To UBound(Vector)
	Print i, Vector(i)
Next
```

### Задачи

Если вы не хотите возиться с утилитой `make`, и у вас есть какой‐нибудь пакетный файл с командами для сборки проекта, то можно добавить задачу на сборку.

Создадим файл `tasks.json`:

```json
{
	"version": "2.0.0",
	"tasks": [
		{
			/* Название задачи, придумываем говорящее название */
			"label": "Build project",
			
			/* Оставляем как есть */
			"type": "shell",
			
			/* Команда, которую нужно выполнить */
			"command": "fbc",
			
			/* Если у пакетного файла есть параметры — пишем их тут */
			"args": [
				"-v", /* подробный вывод компиляции */
				"-g", /* включить отладочную информацию */
				"./src/file.bas"
			],
			
			/* Рабочий каталог */
			"options": {
				"cwd": "src/compiler"
			},
			
			/* Оставляем как есть */
			"problemMatcher": [],
			"group": {
				"kind": "build",
				"isDefault": true
			},
		}
	]
}
```

### Настройки для отладчика

Процесс отладки описан на офсайте визуальной студии:

https://code.visualstudio.com/docs/editor/debugging

Чтобы ставить точки останова мышкой:

Заходим в Файл → Настройки → Параметры → Функции → Отладка → Включаем галочку `Allow Breakpoints Everywhere`.

Создадим файл `launch.json`. В этом файле находятся настройки для отладчика `gdb`:

```json
{
	"version": "0.2.0",
	"configurations": [
		{
			/* Название конфигурации */
			"name": "x64 FBC-1.09.0 GCC-12.2.0",
			/* тип отладчика */
			"type": "cppdbg",
			/* Режим исполнения — запуск файла */
			"request": "launch",
			/* Путь исполняемому файлу */
			"program": "${workspaceFolder}/bin/Debug/x64/Station922_GCC-12.2.0_FBC-1.09.0_-Rt.exe",
			/* Аргументы */
			"args": [],
			/* Остановка на точке входа */
			"stopAtEntry": true,
			/* Текущий каталог */
			"cwd": "${fileDirname}",
			
			/* Если программа получает ввод с консоли
			её необходимо запустить в отдельном окне
			в этом случае ставим true */
			"externalConsole": false,
			
			"MIMode": "gdb",
			/* Путь к отладчику GDB */
			"miDebuggerPath": "C:\\Programming\\mingw64\\bin\\gdb.exe",
			"setupCommands": [
				{
					"description": "Включить автоматическое форматирование для gdb",
					"text": "-enable-pretty-printing",
					"ignoreFailures": true
				}
			]
		}
	]
}
```



### Настройки для утилиты make

Корпорация Микрософт анонсировала расширение которое интегрирует утилиту `make`:

https://devblogs.microsoft.com/cppblog/now-announcing-makefile-support-in-visual-studio-code/

Если вы собираете проект утилитой `make`, создайте (или подкорректируйте) файл `settings.json`:

```json
{
	"makefile.configurations": [
		{
			/* Название конфигурации */
			"name": "x64 FBC-1.09.0 GCC-12.2.0",
			/* Параметры утилиты make
			в этом примере пути к компилятору задаются через параметры
			если у вас путь к fbc.exe лежит в %PATH% тогда не нужно
			имя цели all студия самостоятельно ставит первым параметром
			здесь его указывать не нужно
			*/
			"makeArgs": [
				"FBC_VER=FBC-1.09.0",
				"GCC_VER=GCC-12.2.0",
				"FBC=\"C:\\Programming\\FreeBASIC-1.09.0-win64-gcc-9.3.0\\fbc64.exe\"",
				"CC=C:\\Programming\\mingw64\\bin\\gcc.exe",
				"AS=C:\\Programming\\mingw64\\bin\\as.exe",
				"LD=C:\\Programming\\mingw64\\bin\\ld.exe",
				"AR=C:\\Programming\\mingw64\\bin\\ar.exe",
				"GORC=\"C:\\Programming\\FreeBASIC-1.09.0-win64-gcc-9.3.0\\bin\\win64\\GoRC.exe\"",
				"DLL_TOOL=\"C:\\Programming\\mingw64\\bin\\dlltool.exe\"",
				"LIB_DIR=\"C:\\Programming\\FreeBASIC-1.09.0-win64-gcc-9.3.0\\lib\\win64\"",
			],
			/* Путь к утилите make
			если путь стандартный или находится в %PATH%
			то можно не указывать */
			"makePath": "C:\\Programming\\mingw64\\bin\\mingw32-make.exe"
		},
		{
			/* Другая конфигурация, где просто печатаем версию утилиты
			без сборки проекта  */
			"name": "Print make version",
			"makeArgs": [
				"--version"
			],
			"makePath": "C:\\Programming\\mingw64\\bin\\mingw32-make.exe"
		},
		{
			/* Просто печатаем справку */
			"name": "Print help",
			"makeArgs": [
				"--help"
			],
			"makePath": "C:\\Programming\\mingw64\\bin\\mingw32-make.exe"
		}
	],
	/* Если нужно предварительно настроить переменные среды
	"makefile.preConfigureScript": "Z:\\Programming\\setcompilerpath_gcc-12.2.0_x64.cmd",
	*/
	"makefile.launchConfigurations": [
		{
			/* Текущий каталог запускаемой для отладки программы */
			"cwd": "z:\\Programming\\FreeBASIC Projects\\Station922\\bin\\Debug\\x64",
			/* Запускаемая для отладки программа */
			"binaryPath": "z:\\Programming\\FreeBASIC Projects\\Station922\\bin\\Debug\\x64\\Station922_GCC-12.2.0_FBC-1.09.0_-Rt.exe",
			/* Параметры */
			"binaryArgs": []
		}
	],
}
```
