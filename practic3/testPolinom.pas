uses polynomList;
var p1,p2,p3: polimon;
    n, i: integer;
    d,r: TE;

function pow(a,b: TE): TE;
begin
    if a = 0 then pow := 0
    else if (a < 0) and odd(b) then pow := -round(exp(b*ln(-a)))
    else pow := round(exp(b*ln(abs(a))))
end;

procedure readPolinom(var p: polimon);
var n: integer;
    r,d: TE;
begin
    p := nil;
    write('Entry count el polinom: '); read(n);
    for i := 1 to n do 
    begin
        write('Entry ratioX and degree: ');
        read(r,d);
        push(p, r,d);
    end;
end;

begin
    {   test pow();
    for n := -5 to 5 do 
        for i := 1 to 20 do
            writeln(n, '^', i,' = ', pow(n,i));
    }
    readPolinom(p1);
    {readPolinom(p2);
    p3 := sum(p1,p2);
    
    print(p1);
    writeln;
    print(p2);
    writeln;
    print(p3);
    writeln;
    
    delPolinom(p3);
    
    p3 := differential(p1);
    print(p3);
    writeln;
    delPolinom(p3);

    p3 := multiplication(p1,p2);
    print(p3);
    writeln;}

    print(p1);
    writeln('=0');
    writeln(root(p1));

    delPolinom(p1);
    delPolinom(p2);
    delPolinom(p3);
end.