{Вывод слов без повторений}
const n = 30; k = 5;
var a: array[1..n] of string[k+1];
    i, j: integer;
    c: char;
    f: boolean;
begin 
    writeln('Введите последовательность слов');
    for i := 1 to n do begin 
        for j := 1 to k+1 do begin {Посимвольное считывание}
            read(c);
            if (c = ',') or (c = '.') then begin
                a[i][0] := chr(j-1);
                break 
            end
            else if ('a' <= c) and (c <= 'z') then a[i][j] := c
            else begin writeln('Error, ожидалась строчная латинская буква , или . ', a[i]); exit end; {обработка исключений}
        end;
        if (c <> ',') and (c <> '.') then begin {обработка исключений}
            writeln('Error, ожидалась , или . ', a[i]); exit
        end;
        if (c = '.') then break;
    end;
    writeln('Последовательность без повторений');
    for i := 1 to n do begin
        f := true;
        for j := 1 to i - 1 do begin {Сравнение с остальными словами}
            f := f and (a[i] <> a[j]);
            if not f then break;
        end;
        if f then write(a[i], ' ');
    end;
end.
{azsxd,a,asf,ewt,hfgv,vbrsf,s,saax,s,ds.}