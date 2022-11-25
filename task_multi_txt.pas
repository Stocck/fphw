var 
	f, g: text;
	tmpInt,res: integer;
    c: char;
    flag : boolean;

procedure writeInt(var f: file; el:integer);
begin
    if el < 10 then 
        writeInt(f, el div 10);
    write(f, el mod 10);
end;


begin
	assign(f,'unput.txt');
    assign(g, 'output.txt')
	reset(f);
    rewrite(g);
    
    flag := false;
    tmpInt := 0;
	while not eof(f) do
	begin
		read(f, c);
		if ('0' <= c) and (c <= '9') then 
        begin
            flag := true;
            tmpInt := tmpInt * 10 + ord(c) - ord('0');
        end else if flag then 
        begin 
            writeInt(g, tmpInt);
            tmpInt := 0;
            flag := false
        end else write(g, c);
	end;
	close(f);
    close(g)
end.
