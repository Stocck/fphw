var a,b: real;
    t: boolean;
    x1,x2, y1,y2: real;

function sqr(a,b,c:real; var x1, x2: real):boolean; {x1 <= x2}
var d: real;
begin
    sqr := true;
    if a <> 0 then
    begin
        d := b*b-4*a*c;
        if d < 0 then
            sqr := false
        else begin
            d := sqrt(d);
            x1 := (-b-d)/(2*a);
            x2 := (-b+d)/(2*a)
        end
    end else
    begin
        if b <> 0 then
            x1 := -c/b
        else if c <> 0 then 
            sqr := false
    end
end;

begin
    read(a,b);
    t := sqr(1, 6.2, a*a, x1, x2) and sqr(1, a, b-1, y1, y2); 
    t := t and (y1 < x1) and (x2 < y2);
    writeln(t);
end.