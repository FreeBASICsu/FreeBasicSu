> Короче for с несколькими условиями. Такое на бейсике можно сделать только при помощи while.
Нет. Можно через For.

Оператор For — это не просто какая‐то команда, выражение или ключевое слово, это настоящий оператор, который можно переопределить.

Для начала определим структуру, которая будет выражать наш переопределённый For:

Type CycleCounter
	Declare Constructor( ByVal n As Integer )
	
	' Переопределение для неявного использования
	Declare Operator For ( )
	Declare Operator Step( )
	Declare Operator Next( ByRef end_cond As CycleCounter ) As Integer
	
	' Переопределение для явного использования
	Declare Operator For ( ByRef step_var As CycleCounter )
	Declare Operator Step( ByRef step_var As CycleCounter )
	Declare Operator Next( ByRef end_cond As CycleCounter, ByRef step_var As CycleCounter ) As Integer
	
	' Счётчик
	i As Integer
End Type

Я не знаю что такое clause_terminations, но полагаю что это какая‐то строка.

Используем переопределённый For. В качестве счётчика цикла будет использоваться наша структура CycleCounter:

Dim Shared clause_terminations As ZString * 265 = "Hello world!"
Dim Shared termination As Integer = 0

For i As CycleCounter = 0 To 100
	If clause_terminations[i.i] = 32 Then
		' Теперь можно делать Continue
		' и счётчик не забудет обновлять сам себя
		Continue For
		' это просто для примера
		' чтобы не печатать символы с пробелом
	End If
	' печатаем текущее значение счётчика и символ из строки
	' для самоуспокоения
	Print i.i, clause_terminations[i.i]
Next

Ну а теперь реализация оператора For

Constructor CycleCounter( ByVal n As Integer )
	' Конструктор, просто инициализируемся
	i = n
End Constructor

Operator CycleCounter.For( )
	Print "implicit step"
End Operator

Operator CycleCounter.Step( )
	' Эта функция будет вызываться для приращения счётчика
	' по умолчанию приращиваем счётчик на единицу
	this.i += 1
End Operator

Operator CycleCounter.Next( ByRef end_cond As CycleCounter ) As Integer
	' Эта функция вызывается для проверки окончания цикла
	
	' Параметр end_cond — это то, что стоит в выражении To
	' то есть мы должны сравнить себя с параметром end_cond
	' но в этом примере мы игнорируем этот параметр
	
	' Мы должны вернуть 1 если цикл ещё не завершён
	' и 0 когда цикл завершён
	
	' Тут немного изменённое условие
	' Но можно взять любое другое условие
	If i < (SizeOf(clause_terminations) \ SizeOf(WString)) AndAlso clause_terminations[i] <> termination Then
		Return 1
	End If
	Return 0
End Operator

Этот простой пример демонстрирует как добавить хоть сколько условий в оператор For. И без всякой возни с макросами.

На офсайте лежат примеры с переопределением For, рекомендую ознакомиться
https://www.freebasic.net/wiki/KeyPgOpStep