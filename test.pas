var c: char;
    flag, flagEoln: boolean;
    el: integer;
begin 
    flag := true;
    flagEoln := true;
    el := 0;
    while flag and flagEoln do 
    begin
        el := el * 10 + ord(c) - ord('0');
        flagEoln := not eoln;
        if flagEoln then 
        begin
            read(c);
            flag := ('0' <= c) and (c <= '9')
        end
    end;
    if not flag then writeln('1')
    else if not flagEoln then writeln('0')
    else writeln(3);
end.