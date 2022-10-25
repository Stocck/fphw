const n = 30; k = 5;
var a: array[1..n] of string[k+1];
    i, j: integer;
    c: char;
begin 
    writeln('Введите последовательность слов');
    for i := 1 to n do begin
        for j := 1 to k+1 do begin
            read(c);
            if (c = ',') or (c = '.') then begin
                a[i][0] := chr(j-1); 
                break 
            end
            else if ('a' <= c) and (c <= 'z') then a[i][j] := c;
        end;
        if (c <> ',') and (c <> '.') then begin 
            writeln('Error, ожидалась , или . ', a[i]); exit
        end;
        if (c = '.') then break;
    end;
    writeln('Последовательность в обратном порядке');
    for i := i downto 1 do begin
        for j := 1 to ord(a[i][0]) do
            write(a[i][j]);
        write(' ');
    end
end.
{azsxd,a,asf,ewt,hfgv,vbrsf,s,saax,s,ds.}