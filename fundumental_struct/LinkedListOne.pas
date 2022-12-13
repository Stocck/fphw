unit LinkedListOne; // Однонаправленный список
    
interface
    type
        TE = integer; //TypeElement
        list = ^node;
        node = record 
            el: TE;
            next: list
        end;
    
    function buildList(n: integer): list;           // Создание массива из N элементов
    function find(arr: list; sh: TE): list;         // Поиск 1 вхождения в список элемента sh(search) 
    procedure appbegin(var arr: list; elem: TE);    // Добавление elem в начало списка 
    procedure append(var arr: list; elem: TE);      // Добавление elem в конец списка
    procedure del(var arr: list; elem: TE);         // Удаление элмента elem по 1 вхождению в список
    procedure dellast(var arr: list);               // Удаление последнего элемента
    procedure delList(var arr: list);               // Освобождение памяти
    procedure printList(arr: list);                 // Печать списка

implementation
    
    function buildList(n:integer): list;
    var 
        i: integer;
        elem: TE;
        arr,tmp: list;
    begin
        arr := nil;
        if n > 0 then
        begin
            read(elem);
            new(tmp);
            arr := tmp;
            tmp^.el := elem;
            tmp^.next := nil;
        end;
        for i := 2 to n do 
        begin
            read(elem);
            new(tmp^.next);
            tmp := tmp^.next;
            tmp^.el := elem;
        end;
        tmp^.next := nil;
        buildList := arr;
    end;

    function find(arr: list; sh: TE): list;
    begin
        find := nil;
        while arr <> nil do
        begin
            if arr^.el = sh then 
            begin
                find := arr;
                break
            end;
            arr := arr^.next
        end
    end;

    procedure appbegin(var arr: list; elem: TE);
    var tmp: list;
    begin
        new(tmp); 
        tmp^.el := elem; tmp^.next := arr;
        arr := tmp;
    end;

    procedure append(var arr: list; elem: TE);
    var tmp: list;
    begin
        tmp := arr;
        if arr = nil then
        begin
            appbegin(arr, elem); exit 
        end;
        while tmp^.next <> nil do tmp := tmp^.next;
        appbegin(tmp^.next, elem);
    end;
    
    procedure del(var arr: list; elem: TE);
    var tmp, tmp2: list;
    begin
        tmp := arr;
        if tmp^.el = elem then
        begin
            arr := arr^.next;
            dispose(tmp);
            exit
        end;
        while tmp^.next <> nil do
        begin
            if tmp^.next^.el = elem then
            begin
                tmp2 := tmp^.next;
                tmp^.next := tmp2^.next;
                dispose(tmp2);
                exit
            end;
            tmp := tmp^.next
        end
    end;

    procedure dellast(var arr: list);
    var tmp, tmp2: list;
    begin
        if arr = nil then exit;
        if arr^.next = nil then 
        begin
            dispose(arr);
            arr := nil;
            exit
        end;
        tmp := arr;
        while tmp^.next^.next <> nil do tmp := tmp^.next;
        dispose(tmp^.next);
        tmp^.next := nil;
    end;

    procedure delList(var arr: list);
    var tmp: list;
    begin
        while arr <> nil do
        begin
            tmp := arr;
            arr := arr^.next;
            dispose(tmp);
        end;
    end;

    procedure printList(arr: list);
    begin
        while arr <> nil do
        begin
            write(arr^.el, ' ');
            arr := arr^.next;
        end;
    end;

end.