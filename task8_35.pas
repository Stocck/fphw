const n = 10;
var x: array[1..n] of integer;
    k, i, j: integer;
    f: boolean;
begin 
    writeln('Введите последовательность из ', n, ' чисел');
    for i := 1 to n do read(x[i]);
    k := 0;
    for i := 1 to n do begin
        f := true;
        for j := 1 to i-1 do 
            if x[j] = x[i] then begin f := false; break end;
        if f then k := k + 1;
    end;
    writeln('Кол-во уникальных элементов - ', k)
end.