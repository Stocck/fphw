type FR = file of real;

function mid(var f: FR; var m: real): boolean;
var m1, r, tmp1, tmp2: real;
    c: integer;
    
    procedure mid_(num: integer);
    var tmp: real;
    begin
        if not eof(f) then
        begin
            read(tmp);
            c := c + 1;
            mid_(c)
        end;
        if (num*2+1 = c) then
            m := tmp;
    end;

begin
    f.reset();
    c := 1;
    mid := false;
    mid_(1);
    f.close();
end;