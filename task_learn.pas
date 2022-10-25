var i, j: longint; 
    c: char;
begin 
    i := 0;
    write('Введите число в 16ричной системе счисления a = ');
    read(c);
    while(c <> '.') do begin 
        if ('A' <= c) and (c <= 'F') then 
            j := ord(c) - ord('A') + 10
        else if ('0' <= c) and (c <= '9') then 
            j := ord(c) - ord('0')
        else begin 
            writeln('Ошибка ввода, недопустимый символ ', c); 
            exit 
        end; 
        i := i*16 + j;
        read(c);
    end;
    writeln('Число в 10ной системе счисления a = ', i);
end.