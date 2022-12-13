type pint = ^integer;
var a,b: ^pint;
begin
    writeln(1);
    new(a);
    writeln(2);
    new(a^);
    writeln(3);
    a^^ := 15;
    writeln(4);
    b^ := a^;
    writeln(5);
    writeln(a^^,b^^);
end.