type strWord = string[255];
var 
	inp, out: text;
	s, word: strWord;
	c: char;
	i, lenWord: integer;
	

function split(var s: strWord; i,j: integer):strWord; 
var x : integer;
begin
	split := '';
	for x := i to j do split := split + s[x]
end;


begin
	assign(inp, 'input.txt');
	assign(out, 'output.txt');
	reset(inp);
	rewrite(out);
	write('Enter delete word (max lenght 255 symbol): ');
	readln(word);
	lenWord := ord(word[0]);
	s := '';
	while not eof(inp) do
	begin
		if s = word then s := ''
		else begin
			read(inp, c);
			if ord(s[0]) = lenWord then
			begin
				write(out, s[1]);
				s := split(s, 2,lenWord) + c
			end else
				s := s + c;
		end
	end;
	for i:= 1 to ord(s[0]) do	
		write(out,s[i]);
	writeln('Program complite');
	close(inp);
	close(out);
end.
