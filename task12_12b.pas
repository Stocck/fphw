var n: integer;

function f(n: integer): integer;
begin
    if n div 10 <> 0 then
        f := f(n div 10)
    else f := n mod 10;
end;

begin
    read(n);
    writeln(f(n));
end.