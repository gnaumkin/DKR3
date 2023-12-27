program dkr3;
var
  a, b, h, integral, error: real;
function f(x: real): real;
begin
  // Определение подынтегральной функции
  f := x * x * x + x * x - x + 10;
end;
function trapezoidalRule(a, b, h: real): real;
var
  n, i: integer;
  sum: real;
begin
  // Функция для численного вычисления определенного интеграла методом трапеций
  n := trunc((b - a) / h);
  sum := 0;
  for i := 1 to n - 1 do
  begin
    sum := sum + f(a + i * h);
  end;
  trapezoidalRule := h / 2 * (f(a) + 2 * sum + f(b));
end;
procedure calculateIntegral();
begin
  // Процедура для вычисления определенного интеграла
  writeln('Введите нижний предел интегрирования (a):');
  readln(a);
  writeln('Введите верхний предел интегрирования (b):');
  readln(b);
  writeln('Введите количество подинтервалов (n):');
  readln(h);
  integral := trapezoidalRule(a, b, h);
  writeln('Интеграл функции: ', integral:0:6);
end;
procedure calculateError();
begin
  // Процедура для вычисления оценки погрешности
  error := (1 / 3) * (integral - trapezoidalRule(a, b, h / 2));
  writeln('Оценка погрешности: ', error:0:6);
end;
var
  choice: integer;
begin
  repeat
    // Цикл для взаимодействия с пользователем
    writeln('1. Вычислить интеграл');
    writeln('2. Вычислить погрешность');
    writeln('3. Выйти');
    writeln('Выберите: ');
    readln(choice);
    case choice of
      1: calculateIntegral();
      2: calculateError();
    end;
  until choice = 3;
end.