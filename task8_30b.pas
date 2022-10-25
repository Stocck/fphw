const n = 10;
var x, y: array[1..n] of real;
    k: 1..(n-1);
    i: integer;
begin
    writeln('Введите последовательность из ', n, ' чисел');
    for i := 1 to n do read(x[i]);
    write('Кол-во сдвигаемых позиций [1..', n-1, '] - ');
    read(k);
    for i := k+1 to n do y[i-k] := x[i];
    for i := 1 to k do y[n-k+i] := x[i];
    write('Итоговый массив [');
    for i := 1 to n-1 do write(y[i]:4:2, ', ');
    writeln(y[n]:4:2,']');
end.