var 
	f: text;
	arr: array['a'..'z'] of integer; 
	i: integer;
	c, c1, pc: char;
	s: set of 'a'..'z';

procedure sort()


begin
	assign(f, 'input.txt');
	reset(f);
	for c := 'a' to 'z' do arr[c] := 0;
	while not eof(f) do
	begin
		read(f, c);
		if ('A' <= c) and (c <= 'Z') then arr[chr(ord(c)-ord('A')+ord('a'))] := arr[chr(ord(c)-ord('A')+ord('a'))] + 1;
		if ('a' <= c) and (c <= 'z') then arr[c] := arr[c] + 1;
	end;
	close(f);
	s := [];
	for c := 'a' to 'z' do
	begin
		i := arr['a']; 
		for c1 := 'a' to 'z' do
			if  
	end;
end.
