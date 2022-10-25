var c: char;
    s,i: integer;
    flag: boolean;
begin 
    s := 0;
    i := 1;
    flag := false;
    while (true) do begin
        read(c); {Считывание цифры}
        if not (('0' <= c) and (c <= '9')) then begin
            writeln('Ожидалась цифра');
            exit
        end;
        s := s + i * (ord(c) - ord('0'));
        read(c); {Считывание знака}
        if ('+' = c) then i := 1
        else if ('-' = c) then i := -1
        else if ('.' = c) then begin 
            if flag then break {Проверка на кол-во введенных чисел}
            else begin 
                writeln('Ожидался занк + или -');
                exit
            end;
        end
        else begin 
            writeln('Ожидался знак - + или .');
            exit
        end;
        flag := true; {Введенно более одного числа}
    end;
    writeln('Введеная алгебраическая сумма равна ',s);
end.