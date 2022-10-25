const N = 10;
type mas = array[1..N] of integer;
var arr: mas;
    i: integer;
begin
    for i := 1 to N do read(arr[i]);
    for i := 1 to N do if (not odd(arr[i])) then write(arr[i], ' ');
    writeln();
    for i := 2 to N do if (not odd(i)) then write(arr[i], ' ');
    writeln()
end.