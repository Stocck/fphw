const size = 5;
type index = 1..size;
    matrix = array[index, index] of real;
var A: matrix;
    i,j, n,k: index;

function max(var A: matrix; n,k: index): real;
var max1: real;

    function maxP(x1,x2,y1,y2: index): real;
    var i,j : integer;
    begin
            maxP := A[x1][y1];
            for i := x1 to x2 do 
                for j := y1 to y2 do
                    if maxP < A[i][j] then maxP := A[i][j]
    end;

begin
    max := maxP(n, k, 1, size);
    max1 := maxP(1, n - 1, n, k);
    if max1 > max then max := max1;
    max1 := maxP(k+1, size, n, k); 
    if max1 > max then max := max1
end;

{function test(var A: matrix; n,k: index): real;
var max1: real;

    function maxP(x1,x2,y1,y2: index): real;
    var i,j : integer;
    begin
            maxP := A[x1][y1];
            for i := x1 to x2 do 
                for j := y1 to y2 do
                    A[i][j] := 1;
    end;

begin
    test := maxP(n, k, 1, size);
    max1 := maxP(1, n - 1, n, k);
    if max1 > test then test := max1;
    max1 := maxP(k+1, size, n, k); 
    if max1 > test then test := max1
end;}


begin
    writeln('Введите квад. матрицу размером ', size);
    for i := 1 to size do 
        for j := 1 to size do read(A[i][j]);
    writeln('Введите область подсчета ограниченную 2 числами ');
    read(n,k);
    writeln('Максимальный элемент в данной области ', max(a, n, k):4:2);
    {writeln('test');
    for i := 1 to size do 
        for j := 1 to size do
            A[i][j] := 0;
    test(A, n, k);
    for i := 1 to size do begin
        for j := 1 to size do
            write(a[i][j]:2:0);
        writeln;
    end;}
    writeln('Область где производился подсчет');
    for i := 1 to size do begin
        for j := 1 to size do 
            if (n <= i) and (i <= k) or (n <= j) and (j <= k) then write('1 ')
            else write('0 ');
        writeln
    end
end.    