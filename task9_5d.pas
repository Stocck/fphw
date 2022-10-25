const n = 5;
var B: array[1..n, 1..n] of integer;
    m,r,c: integer;
    d: boolean;
begin 
    writeln('Введите кв. матрицу размером, - ',  n);
    for r := 1 to n do 
        for c := 1 to n do
            read(b[r][c]);
    m := maxint;
    for r := 1 to n do
        for c := r+1 to n do 
            if b[r][c] < m then m := b[r][c];
    d := true;
    for r := 1 to n do
        for c := 1 to r do
            if b[r][c] < m then d := false;
    writeln('Минимум в верхней диагонали ? Ответ - ', d);
end.