{Методы сортировка простыми вставками и простым слиянием}
const 
    MAXSIZE = 100;
type 
    vector = array[1..MAXSIZE] of int64;
    prMods = (Release, Debug);
    tSort = (Incresing, Descending);
var 
    arr, arrcopy: vector;
    i,n, countCmp, countMove: integer;
    sortType: tSort;
    programMode: prMods;
    errorFlag, testRandom: boolean; {Флаг ошибки ввода и флаг тестового режима (без ввода массива)}

{Чтение данных, возвращает true если считывание прошло успешно}
function readData(var arr: vector; var n: integer; 
                    var sortType: tSort; var programMode: prMods): boolean;
var 
    tmp: int64;
    errorFlag: boolean;

    {Считывание целых чисел, возвращает true если считывание прошло успешно}
    function readInt(var el:int64): boolean;
    var 
        c: char;
        sign, flag, flagEoln, errorFlag: boolean;
    begin
        errorFlag := false;
        el := 0;
        c := ' ';
        while (c = ' ') do 
        begin
            while eoln do readln;
            read(c);
        end;

        sign := (c = '-');
        if sign then el := 0
        else if ('0' <= c) and (c <= '9') then el := ord(c) - ord('0')
            else begin 
                writeln('Ожидалась цифра или знак -, а полученно ', c);
                errorFlag := true
            end;
        if not errorFlag then 
        begin
            flagEoln := not eoln;
            if flagEoln then 
                begin
                    read(c);
                    flag := ('0' <= c) and (c <= '9')
                end;
            flag := ('0' <= c) and (c <= '9');
            while flag and flagEoln do 
            begin
                el := el * 10 + ord(c) - ord('0');
                flagEoln := not eoln;
                if flagEoln then 
                begin
                    read(c);
                    flag := ('0' <= c) and (c <= '9')
                end;
            end;
            if not flag and (c <> ' ') then 
            begin 
                writeln('Error ожидалась цифра пробел или перенос строки, а полученно ', c);
                errorFlag := true
            end
            else if sign then el := -el
        end;
        readInt := not errorFlag;
    end;

begin
    errorFlag := false;
    write('Enter sequence size: '); 
    errorFlag := not readInt(tmp);
    if not errorFlag and ((tmp > MAXSIZE) or (tmp <= 0)) then
    begin 
        writeln('Error, a natural number <= 100 was expected');
        errorFlag := true;
    end else n := tmp;
    if not errorFlag then 
    begin
        if testRandom then 
            for i := 1 to n do
                arr[i] := random(200) - 100
            else 
            begin
                write('Enter sequence: ');
                for i := 1 to n do 
                    if not errorFlag then 
                        errorFlag := not readInt(arr[i]);
            end;
    end;
    if not errorFlag then
    begin
        write('Sort type (1 - incresing sequence, 2 - descending sequence): ');
        errorFlag := not readInt(tmp);
        case tmp of
            1: sortType := incresing;
            2: sortType := descending;
            else begin 
                writeln('Error, expected 1 or 2');
                errorFlag := true
            end  
        end;
        {В случае обратной сортировки весь массив умножается на -1}
        if sortType = Descending then for i := 1 to n do arr[i] := -arr[i]
    end;
    if not errorFlag then begin
        write('Program mode (1 - Release, 2 - Debug): ');
        errorFlag := not readInt(tmp);
        case tmp of
            1: programMode := Release;
            2: programMode := Debug;
            else 
            begin 
                writeln('Error, expected 1 or 2');
                errorFlag := true
            end  
        end
    end;
    readData := not errorFlag;
end;

procedure writeArr(var arr: vector; n: integer);
var 
    i, sign: integer;
begin
    {В случае обратной сортировки весь массив является умноженым на -1}
    if sortType = Incresing then sign := 1 
    else sign := -1;
    for i := 1 to n do
        write(sign*arr[i], ' ');
    writeln;
end;

procedure writeDebugStep(var arr: vector; n, step, currCmp, currMove: integer);
begin
    writeln('Step: ', step);
    writeArr(arr, n);
    writeln('Сurrent number of comparison: ', currCmp);
    writeln('Сurrent number of movements: ', currMove);
    writeln;
end;

procedure writeResultSort(var arr, arrS: vector; var n: integer);
begin
    write('Source sequence: ');
    writeArr(arr, n);
    write('Final sequence: ');
    writeArr(arrS, n);
    writeln('Number of comparisons: ', countCmp);
    writeln('Number of movements: ', countMove);
    writeln;
end;

procedure swap(var a, b: int64);
var 
    c: integer;
begin 
    c := a;
    a := b;
    b := c;
end;

procedure insert_sort(var arr: vector; n: integer);
var 
    i, j, maxi: integer;  
    maxel: int64;
    {Debug mode}
    step, currCmp, currMove: integer; 
begin 
    step := 0;
    currCmp := 0;
    currMove := 0;
    i := 1;
    for i := 1 to n do 
    begin
        step := step + 1;
        maxel := arr[1];
        maxi := 1;
        for j := 1 to n-i+1 do 
        begin
            currCmp := currCmp + 1; {Сравнение arr[j] > maxel}
            if arr[j] > maxel then 
            begin
                {Макисимум}
                maxel := arr[j];
                maxi := j
            end	
        end;
        currCmp := currCmp + 1;
        if j <> maxi then 
        begin
            currMove := currMove + 2; {swap}
            swap(arr[j], arr[maxi]);
        end;
        if programMode = Debug then 
            writeDebugStep(arr, n, step, currCmp, currMove);
    end;
    countCmp := currCmp;
    countMove := currMove
end;



procedure quick_sort(var arr: vector; n: integer);
var 
    arrCopy: vector;
    i, step, currCmp, currMove: integer;

    procedure quick_sort_(var arr1, arr2: vector; a, b: integer);
    var i,x,y : integer;
    begin
        if a < b then
        begin
            x := a;
            y := a + (b-a) div 2 + 1;
            i := a;
            quick_sort_(arr2, arr1, a, y-1);
            quick_sort_(arr2, arr1, y, b);
            for i := a to b do 
            begin
                {
                    Одно присвоение одного элемента массива другому,
                    будет в любом из уловных операторов
                }
		        currMove := currMove + 1;
                if x > a + (b-a) div 2 then 
                begin
                    {Сравнение if (cmp), где cmp это сравнение}
                    currCmp := currCmp + 1;
                    arr1[i] := arr2[y];
                    y := y + 1
                end
                else if y > b then 
                begin
                    {Сравнение if (cmp) else if (cmp), где cmp это сравнение}
                    currCmp := currCmp + 2;
                    arr1[i] := arr2[x];
                    x := x + 1
                end
                else if arr2[x] > arr2[y] then
                begin
                    {Сравнение if (cmp) else if (cmp) else if (cmp), где cmp это сравнение}
                    currCmp := currCmp + 3;
                    arr1[i] := arr2[y];
                    y := y + 1
                end 
                else begin
                    {Сравнение if (cmp) else if (cmp) else if (cmp) else , где cmp это сравнение}
                    currCmp := currCmp + 3;
                    arr1[i] := arr2[x];
                    x := x + 1
                end 
            end;
            step := step + 1;
            if programMode = Debug then 
                writeDebugStep(arr1, n, step, currCmp, currMove);
        end
    end;

begin 
    step := 0;
    currCmp := 0;
    currMove := n; {Копирование массива}

    for i := 1 to n do arrCopy[i] := arr[i]; 
    quick_sort_(arr, arrCopy, 1, n);

    countCmp := currCmp;
    countMove := currMove;
end;

begin
    testRandom := false;
    errorFlag := not readData(arr, n, sortType, programMode);
    {
        После считывания данных глобальная переменная errorFlag,
        может быть false, что означает ошибку ввода
        и последующие выполнение программы бессмысленно
    }
    if not errorFlag then 
    begin
        arrcopy := arr;
        writeln;
        writeln('Sort method 1: Insert sort');
        insert_sort(arrcopy, n);
        writeResultSort(arr, arrcopy, n);
        arrcopy := arr;
        writeln('Sort method 2: Quick sort');
        quick_sort(arrcopy, n);
        writeResultSort(arr, arrcopy, n);
    end;
end. 
