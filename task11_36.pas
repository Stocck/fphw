const n = 6;
label EndProgramm;
type str = string[n];
var wl, w, wr: str;
	stopC: char;
	count : integer;

procedure readword(var w: str);
var i: integer;
	c: char;
begin 
	w := '';
	for i := 1 to n+1 do 
	begin
		read(c);
		if (c = ',') or (c = '.') then 
		begin
			stopC := c; exit
		end;
		w := w + c
	end
end;

begin 
	count := 0;
	stopC := ',';
	readword(wl);
	if stopC = '.' then goto EndProgramm;
	{if stopC = '.' then 
	begin 
		writeln('Кол-во слов с одинаковыми соседями', count); 
		exit 
	end;}
	readword(w);
	while stopC <> '.' do 
	begin
		readword(wr);
		if wl = wr then count := count + 1;
		wl := w;
		w := wr;
	end;
EndProgramm:
	writeln('Кол-во слов с одинаковыми соседями ', count);
end.
