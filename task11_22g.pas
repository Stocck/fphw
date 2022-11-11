const SIZE = 4;
type vector = array[1..SIZE] of integer;
var x,y,z: vector;
    i, xi, yi, zi: integer;

procedure readArr(var arr: vector);
var i: integer;
begin
    for i := 1 to SIZE do 
        read(arr[i])
end;

function iMaxEl(var arr: vector): integer;
var maxel: integer;
begin
    maxel := arr[1];
    iMaxEl := 1;
    for i := 2 to SIZE do
        if maxel < arr[i] then 
        begin
            iMaxEl := i;
            maxel := arr[i]
        end
end;

procedure writeArr(var arr: vector);
var i: integer;
begin
    for i := 1 to SIZE do
        write(arr[i], ' ');
    writeln;
end;

begin
    readArr(x);
    readArr(y);
    readArr(z);
    xi := iMaxEl(x);
    yi := iMaxEl(y);
    zi := iMaxEl(z);
    if (x[xi] = 10) and (xi <= SIZE div 2) then 
        if y[yi] <= 0 then
            for xi := 1 to zi-1 do
                z[xi] := z[xi]*z[xi]*z[xi];
    writeArr(z);
end.