unit polynomList;
    
interface
    
    type
        TE = int64; 
        polimon = ^node;
        node = record
            degreeX, ratioX: TE;
            next: polimon;
        end;
    
    procedure del(var p: polimon; dX: TE);              // Удаление элемента из полинома
    procedure push(var p: polimon; rX, dX: TE);         // В случае существование элемента с degreeX произойдет сложение по ratioX 
    function f(p: polimon; x: TE):TE;                   // Получение значение полинома в заданой точке X
    function root(p: polimon): TE;                      // Поиск целого корня
    function differential(p: polimon): polimon;         // Высчитывание производной полинома
    function equalz(p1,p2: polimon): boolean;           // Сравнение полиномов
    function sum(p1,p2: polimon): polimon;              // Сложение полиномов
    function multiplication(p1,p2: polimon): polimon;   // Умножение полиномов
    procedure print(p: polimon);                        // Вывод полинома
    procedure delPolinom(var p: polimon);               // Удаление полинома

implementation

    procedure del(var p: polimon; dX: TE);
    var tmp, pCopy: polimon;
    begin
        if p = nil then exit;
        if p^.degreeX = dX then 
        begin
            tmp := p;
            p := p^.next;
            dispose(tmp);
            exit
        end;
        pCopy := p;
        while pCopy^.next <> nil do
        begin
            if pCopy^.next^.degreeX = dX then
            begin
                tmp := pCopy^.next;
                pCopy^.next := tmp^.next;
                dispose(tmp);
                exit
            end;
            pCopy := pCopy^.next;
        end;
    end;

    procedure push(var p: polimon; rX, dX: TE);
    var tmp, pCopy: polimon;

        function push_(var p: polimon): boolean;
        begin
            if (p = nil) or (p^.degreeX < dX) then
            begin
                new(tmp);
                tmp^.degreeX := dX;
                tmp^.ratioX := rX;
                tmp^.next := p;
                p := tmp;
                push_ := true
            end else if p^.degreeX = dX then
            begin
                p^.ratioX := p^.ratioX + rX;
                if p^.ratioX = 0 then del(p,dX);
                push_ := true
            end else push_ := false;
        end;

    begin
        if rX = 0 then exit;
        if push_(p) then exit;
        pCopy := p;
        while true do
            if push_(pCopy^.next) then break
            else pCopy := pCopy^.next;
    end;

    function f(p: polimon; x: TE):TE;
    var sumF: TE;

        function pow(a,b: TE): TE; // a^b = pow(a,b)
        begin
            if a = 0 then pow := 0
            else if (a < 0) and odd(b) then pow := -round(exp(b*ln(-a)))
            else pow := round(exp(b*ln(abs(a))))
        end;

    begin
        sumF := 0;
        while p <> nil do 
        begin
            sumF := sumF + p^.ratioX * pow(x, p^.degreeX);
            p := p^.next
        end;
        f := sumF
    end;

    function root(p: polimon): TE;
    var tmp: polimon;
        i: integer;

        function root_(p: polimon; i: TE; var r: TE): boolean;
        begin
            root_ := f(p, i) = 0;
            if root_ then r := i;
        end;
    begin
        tmp := p;
        root := 0;
        if tmp = nil then exit;
        while tmp^.next <> nil do tmp := tmp^.next;
        if tmp^.degreeX <> 0 then exit;
        for i := 1 to round(sqr(abs(tmp^.ratioX)))+1 do
            if (tmp^.ratioX mod i) = 0 then 
            begin
                if root_(p, i, root) then exit;
                if root_(p,-tmp^.ratioX div i, root) then exit;
                if root_(p,tmp^.ratioX div i, root) then exit;
                if root_(p,-i, root) then exit;
            end;
    end;

    

    // O(n^2/2)
    {function differential(p: polimon): polimon;
    var dP: polimon;
    begin
        dP := nil;
        while p <> nil do
        begin
            push(dp, p^.ratioX*p^.degreeX, p^.degreeX-1);
            p := p^.next;
        end;
        differential := dP;
    end;}
    
    // O(n)
    function differential(p: polimon): polimon;
    var dP: polimon;
    begin
        dP := nil;
        if p <> nil then 
        begin
            push(dp, p^.ratioX*p^.degreeX, p^.degreeX-1);
            p := p^.next;
        end;
        differential := dP;
        while p <> nil do
        begin
            push(dp, p^.ratioX*p^.degreeX, p^.degreeX-1);
            p := p^.next;
            dp := dp^.next;
        end;
    end;

    function equalz(p1,p2: polimon): boolean;
    var flag: boolean;
    begin
        flag := true;
        while (p1 <> nil) and (p2 <> nil) do
        begin
            flag := flag and (p1^.degreeX = p2^.degreeX) and (p1^.ratioX = p2^.ratioX);
            if not flag then break;
            p1 := p1^.next;
            p2 := p2^.next;
        end;
        equalz := flag and (p1 = nil) and (p2 = nil)
    end;

    function sum(p1,p2: polimon): polimon;
    var ds: polimon;

        procedure sum_(var ds, p: polimon);
        begin
            push(ds, p^.ratioX, p^.degreeX);
            p := p^.next;
        end;

        function sum1(var ds,p1,p2: polimon): boolean;
        begin
            sum1 := true;
            if p1 = nil then
                sum_(ds,p2)
            else if p2 = nil then
                sum_(ds, p1)
            else if p2^.degreeX > p1^.degreeX then
                sum_(ds, p2)
            else begin sum_(ds, p1); sum1 := false end;
        end;

    begin
        ds := nil;
        if (p1 <> nil) and (p2 <> nil) then
            sum1(ds, p1, p2);
        sum := ds;
        while (p1 <> nil) or (p2 <> nil) do
            if sum1(ds^.next, p1, p2) then
                ds := ds^.next;
    end;

    function multiplication(p1,p2: polimon): polimon;
    var dm, p2s: polimon;
    begin
        dm := nil;
        p2s := p2;
        while p1 <> nil do
        begin
            while p2 <> nil do
            begin
                push(dm, p1^.ratioX*p2^.ratioX, p1^.degreeX+p2^.degreeX);
                p2 := p2^.next
            end;
            p1 := p1^.next;
            p2 := p2s;
        end;
        multiplication := dm;
    end;

    procedure print(p: polimon);

        procedure printEl(a,b: TE);
        begin
            if (a <> 1) or (b = 0) then write(a);
            if (a = -1) and (b <> 0) then write('-');
            if (b <> 0) then write('x');
            if b > 1 then write('^', b);
        end;

    begin
        if p = nil then begin write(0); exit end;
        printEl(p^.ratioX, p^.degreeX);
        p := p^.next;
        while p <> nil do
        begin
            if p^.ratioX > 0 then write('+');
            printEl(p^.ratioX, p^.degreeX);
            p := p^.next;
        end;
    end;
    
    procedure delPolinom(var p: polimon);
    var tmp1: polimon;
    begin
        while p <> nil do 
        begin
            tmp1 := p;
            p := p^.next;
            dispose(tmp1)
        end
    end;

end.