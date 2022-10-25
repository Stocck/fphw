const n = 10;
var x, y: array[1..n] of real;
    k: 1..(n-1);
    a,b,i: integer;
begin
    writeln('Введите последовательность из ', n, ' чисел');
    for i := 1 to n do read(x[i]);
    a := 1;
    b := n;
    for i := 1 to n do 
        if x[i] < 0 then begin
            y[a] := x[i];
            a := a + 1
        end else begin 
            y[b] := x[i];
            b := b - 1
        end; 
    write('Итоговый массив [');
    for i := 1 to n-1 do write(y[i]:4:2, ', ');
    writeln(y[n]:4:2,']');
end.