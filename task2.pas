const N = 10;
const COUNT = 0;
type mas = array['A'..'Z'] of integer;
var arr: mas;
    c: char;
begin
    for c := 'A' to 'Z' do arr[c] := 0;
    read(c);
    while (c <> '.') do begin
        arr[c] := arr[c] + 1;
        read(c);
    end;
    for c := 'A' to 'Z' do 
        if arr[c] = COUNT then write(c, ' ')
end.