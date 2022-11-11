var n: integer;

function cd(n: integer): integer;
    function cd_(n:integer):integer;
    begin
        cd_ := 0;
        if n <> 0 then
            cd_ := 1 + cd_(n div 10);
    end;
begin
    if n = 0 then cd := 1
    else cd := cd_(n);
end;

begin 
    read(n);
    writeln(cd(n));
end.