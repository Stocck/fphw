unit LinkedListTwo; // Двунаправленный список

interface
    type
        TE = integer; //TypeElement
        list = ^node;
        node = record 
            el: TE;
            head: list;
            next: list
        end;
    
    function buildList(n: integer): list;           // Создание массива из N элементов
    function find(arr: list; sh: TE): list;         // Поиск 1 вхождения в список элемента sh(search) 
    procedure appbegin(var arr: list; elem: TE);    // Добавление elem в начало списка 
    procedure append(var arr: list; elem: TE);      // Добавление elem в конец списка
    procedure del(var arr: list; elem: TE);         // Удаление элмента elem по 1 вхождению в список 
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
            tmp^.head := nil;
        end;
        for i := 2 to n do 
        begin
            read(elem);
            new(tmp^.next);
            tmp^.next^.head := tmp;
            tmp := tmp^.next;
            tmp^.el := elem;
        end;
        tmp^.next := nil;
        buildList := arr;
    end;
