var f1,f2: text;


function equalTXT(var f1,f2: text): boolean;
var c1,c2: char;
    flag: boolean;
begin
    flag := true;
    reset(f1);
    reset(f2);
    while not (eof(f1) or eof(f2)) and flag do
    begin
        read(f1,c1);
        read(f2,c2);
        flag := c1 = c2
    end;
    equalTXT := flag and eof(f1) and eof(f2);
    close(f1);
    close(f2);
end;

begin
    assign(f1,'input1.txt');
    assign(f2,'input2.txt');
    writeln(equalTXT(f1,f2));
end.