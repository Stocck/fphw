const COUNT = 0;
type mas = array['A'..'Z'] of integer;
var arr: mas;
    c, maxc: char;
    max: integer;
begin
    for c := 'A' to 'Z' do arr[c] := 0;
    read(c);
    while (c <> '.') do begin
        arr[c] := arr[c] + 1;
        read(c);
    end;
    max := 0;
    for c := 'A' to 'Z' do 
        if arr[c] > max then begin 
            max := arr[c];
            maxc := c;
        end;
    writeln(maxc, ' - ', max);
end.