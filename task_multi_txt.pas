const MULTITASK = 2;
var 
	f, g: text;
	tmpInt, countInt, i, modInt: int64;
    c: char;

begin
	assign(f,'unput.txt');
    assign(g, 'output.txt')
	reset(f);
    rewrite(g);
    
    countInt := 0;
    tmpInt := 0;
    modInt := 1;
	while not eof(f) do
	begin
		read(f, c);
		if ('0' <= c) and (c <= '9') then 
        begin
            countInt := countInt + 1;
            tmpInt := tmpInt * 10 + ord(c) - ord('0');
            modInt := 10 * modInt
        end else if countInt <> 0 then 
        begin
            tmpInt := tmpInt * MULTITASK;
            for i := countInt downto 1 do
            begin
                write(g, tmpInt mod modInt);
                modInt := modInt mod 10;
            end;
            tmpInt := 0;
            countInt := 0
            modInt := 1;
        end else write(g, c);
	end;
	close(f);
    close(g)
end.
