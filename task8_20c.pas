const n = 10;
var x: array[1..n] of integer;
    s: integer;
    t: boolean;
begin 
    writeln('Введите последовательность из ', n, ' чисел');
    for s := 1 to n do read(x[s]);
    t := true;
    for s := 1 to (n div 2) do
        if x[s] <> x[n-s+1] then begin 
            t := false; 
            break end;
    writeln('Последовательность симметрична ? Ответ - ', t);
end.