{
max function - 6 
остановка после определенного числа итераций
турнирная селекция
универсальное скрещевание
перестановка случайных битов местами (мутация)
}
uses function_unit;
var i,epoxs : integer;
    p: populationType;
    x, bestE: real;
    mode: integer;
    change: real;

procedure print_population(p:populationType);
var tmp: real;
    i,j: integer;
begin
    for i := 1 to SIZEP do
    begin
        tmp := number_to_real(p[i]);
        write(i:2, ' N=');
        for j := 1 to ACCURACY do
            if p[i][j] then write(1)
            else write(0);
        writeln(' x=', tmp:6:5, ' f(x)=', f(tmp):6:5);
    end;
    writeln;
end;

begin
    randomize;
    write('Entry Relase[1] or Debug[2] mode: ');
    read(mode);
    write('Entry count epoxs: ');
    read(epoxs);
    write('Entry change crossing in [0,1]: ');
    read(change);
    setCcrossing(change);
    write('Entry change mutation in [0,1]: ');
    read(change);
    setCMutation(change);
    write('Entry change generate 1 [0,1]: ');
    read(change);
    setCgenerate(change);

    generateP(p);
    if mode = 2 then
    begin
        writeln('Generat population');
        print_population(p);
    end;
    x := -1;
    for i := 1 to epoxs do
    begin
        if mode = 2 then
        writeln('----Epoxs ',i, '----');

        selection(p);
        if mode = 2 then
        begin
            writeln('----Result selection----');
            print_population(p);
        end;

        crossing(p);
        if mode = 2 then
        begin
            writeln('----Result crossing----');
            print_population(p);
        end;

        mutation(p);
        
        if mode = 2 then
        begin
            writeln('----Result mutation----');
            print_population(p);
        end;

        bestE := find_best(p);
        if (x = -1) or optimaze(bestE, x) then x := bestE;
        
        if mode = 2 then
        begin
            writeln('best_X = ', x:6:5);
            writeln('F(x) = ',f(x):6:5);
            writeln;
        end;
    end;
    writeln('Result: x=', x:6:5, ' f(x)=', f(x):6:5);
end.