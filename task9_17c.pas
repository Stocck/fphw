const n = 9;
var a: array[1..n, 1..n] of real;
    b: array[1..n, 1..n] of integer;
    i,j, max, min: integer;
    s: real;
begin 
    writeln('Введите кв. матрицу размером, - ',  n);
    for i := 1 to n do 
        for j := 1 to n do begin
            read(a[i][j]);
            b[i][j] := 0;
        end;
    s := 0;
    for i := 1 to n do begin
        max := n - i + 1;
        min := i;
        if min > max then begin
            max := max + min;
            min := max - min;
            max := max - min;
        end;
        for j := min to max do begin
            s := s + a[i][j];
            b[i][j] := 1;
        end;
    end;
    writeln('Сумма равна - ',s:2:4);
    writeln('Массив взятых индексов');
    for i := 1 to n do begin 
        for j := 1 to n do
            write(b[i][j], ' ');
        writeln;    
    end;
end.