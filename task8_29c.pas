const n = 10;
var x: array[1..n] of integer;
    s,tmp: integer;
begin
    writeln('Введите последовательность из ', n, ' чисел');
    for s := 1 to n do read(x[s]);
    for s := 1 to n div 2 do begin 
        tmp := x[s];
        x[s] := x[(n div 2) + s];
        x[(n div 2) + s] := tmp
    end;
    write('Итоговый массив [');
    for s := 1 to n-1 do write(x[s], ', ');
    writeln(x[n],']');
end.