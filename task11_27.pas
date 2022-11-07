const n = 3;
type arrayN = array[1..n, 1..n] of real;
var arr1, arr2: arrayN;

procedure readArr(var arr: arrayN);
var i, j: integer;
begin
        for i := 1 to n do for j := 1 to n do read(arr[i][j])
end;

procedure printArr(arr: arrayN);
var i, j: integer;
begin
        for i := 1 to n do
        begin
                for j := 1 to n do write(arr[i][j]:8:2);
                writeln
        end
end;

function trArr(arr: arrayN): real;
var i: integer;
begin
        trArr := 0;
        for i := 1 to n do
                trArr := arr[i][i];
end;

procedure multMatrix(arr1, arr2: arrayN; var arrResult: arrayN);
var i, j, x: integer;
begin 
	for i:= 1 to n do
		for j := 1 to n do begin
			arrResult[i][j] := 0;
			for x := 1 to n do 
				arrResult[i][j] := arrResult[i][j] + arr1[i][x] * arr2[x][j]
		end
end;

begin
        writeln('Введите кв. матрицу 1 размером ', n);
        readArr(arr1);  
        writeln('Введите кв. матрицу 2 размером ', n);
        readArr(arr2);
        if trArr(arr1) < trArr(arr2) then 
	begin 
		writeln('Меньший трейсер имеет матрица 1');
		multMatrix(arr1, arr1, arr1);
		printArr(arr1)
	end else 
	begin 
		writeln('Меньший трейсер имеет матрица 2');
		multMatrix(arr2, arr2, arr2);
		printArr(arr2)
	end;
end.

