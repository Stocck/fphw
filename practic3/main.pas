uses polynomList;
type error = (errorX, errorD, errorInt, errorSp, notError);
var t1,t2,ts: polimon;
    ErrorFlag: error;
    stFlag: boolean;
function readPolinom(var errorFlag: error):polimon;
type typeSet = set of char;
var p: polimon;
    c: char;
    degree, ratio: integer;
    
    function readInt(var c: char; endI: typeSet): integer;
    var r: integer;
        r1, sign: boolean;
    begin
        readInt := 1;
        r := 0;
        if c = 'x' then exit;
        while not (c in endI) do
        begin
            r := r *10 + (ord(c) - ord('0')); 
            read(c);
        end;
        readInt := r;
    end;


begin
    read(c);
    p := nil;
    while c <> ' ' do
    begin
        ratio := 1;
        if c = '-' then 
        begin
            read(c); 
            ratio := -1;
        end else if c = '+' then
            read(c);
        ratio := ratio * readInt(c, ['+','-','x', ' ']);
        if c = 'x' then begin
            read(c);
            if c = '^' then begin 
                read(c);
                degree := readInt(c, ['+','-','x', ' ']);
            end else degree := 1;
        end else degree := 0;
        push(p, ratio, degree);
    end;
    readPolinom := p;
end;


begin
    errorFlag := notError;
    write('Entry polinom 1: ');
    t1 := readPolinom(errorFlag);
    readln;
    write('Entry polinom 2: ');
    t2 := readPolinom(errorFlag);
    
{
    print(t1); writeln;
    print(t2); writeln;
    }
    
    ts := sum(t1,t2);
    write('Result sum: ');
    print(ts);
    writeln;
    delPolinom(t1);
    delPolinom(t2);
    delPolinom(ts);
end.