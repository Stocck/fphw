unit stackLinked;
    
interface
    type 
        TE = char;
        stack = ^node;
        node = record
            elem: TE;
            next: stack
        end;

    function isEmpty(var s: stack): boolean;
    function pop(var s: stack): TE;
    procedure push(var s: stack; el: TE);

implementation

    function isEmpty(var s: stack): boolean; begin isEmpty := s = nil end;

    function pop(var s: stack): TE;
    var tmp: stack;
    begin
        pop := s^.elem;
        tmp := s;
        s := s^.next;
        dispose(tmp);
    end;

    procedure push(var s: stack; el: TE);
    var tmp: stack;
    begin
        new(tmp);
        tmp^.elem := el;
        tmp^.next := s;
        s := tmp;
    end;
    
end.