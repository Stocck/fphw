type pWord = (im, gen, dat, acc, cr, pr);
    {падеж = (им, род, дат, вин, твор, предл)}
    word = (steppe, pain, notebook, door);
    {слово = (степь, боль, тетрадь, дверь)}
const aw : array [word] of string = ('степ','бол','тетрад','двер');
{aw => массив где индекс слово на англ а значение на слово на русском}
var w: word;
    p: pWord;
begin 
    write('Введите слово на англ (доступно steppe, pain, notebook, door) слово = ');
    read(w);
    write('Введите желаемый подеж (im - им, gen - род, dat - дат, acc - вин, cr - твор, pr - предл) = ');
    read(p);
    case p of
        im, acc: writeln(aw[w],'ь');
        gen, dat, pr: writeln(aw[w],'и');
        cr: writeln(aw[w],'ью');
    end;
end.