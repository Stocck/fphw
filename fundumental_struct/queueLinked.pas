unit queueLinked;

interface
    type 
        TE = char;
        queue = ^node;
        node = record
            elem: TE;
            next: queue    
        end;

    function isEmpty(var h,t: queue): boolean;
    procedure push(var h,t: queue; el: TE);
    function pop(var h,t: queue): TE;
    
implementation

    function isEmpty(var h,t: queue): boolean; begin isEmpty := h = nil end;
    
    procedure push(var h,t: queue; el: TE);
    var tmp: queue;
    begin
        new(tmp);
        tmp^.elem := el;
        t^.next := tmp;
        t := tmp;
    end;

    function pop(var h,t: queue): TE;
    var tmp: queue;
    begin
        tmp := h;
        pop := h^.elem;
        h := h^.next;
        dispose(tmp);
        if h = nil then t := nil;
    end;
end.