type cr = (n,e,s,w);
{курс = (с,в,ю,з)}
    command = (forward, right, back, left);
{команда = (вперед, влево, назад, впарво)}
var k1, k2: cr; 
    pr: command;
begin 
    writeln('Компас');
    writeln('  n  ');
    writeln('w   e');
    writeln('  s  ');
    write('Введи старый курс (n - север, e - восток, s - юг, w - запад) = ');
    read(k1);
    k2 := k1;
    write('Введи приказ (forward, right, back, left) = ');
    read(pr);
    while(pr <> forward) do begin {Цикл поворота}
        if k2 = w then k2 := n
        else k2 := succ(k2);
        pr := pred(pr);
    end;
    write('Новый курс ');
    case k2 of
        n: writeln('Север(n)');
        e: writeln('Восток(e)');
        s: writeln('Юг(s)');
        w: writeln('Запад(w)');
    end;
end.
