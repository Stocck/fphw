const n = 10;
var x: array[1..n] of integer;
    s,tmp: integer;
begin
    writeln('Введите последовательность из ', n, ' чисел');
    for s := 1 to n do read(x[s]);
    tmp := x[n];
    for s := n downto 2 do x[s] := x[s-1];
    x[1] := tmp;
    write('Итоговый массив [');
    for s := 1 to n-1 do write(x[s], ', ');
    writeln(x[n],']');
end.