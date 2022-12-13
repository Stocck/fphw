unit treeSearch;
    
interface
    
    type 
        TE = integer;
        TK = char;
        tree = ^node;
        node = record
            key: TK;
            elem: TE;
            left,right: tree;
        end;

    function isEmpty(var t: tree): boolean;
    procedure push(var t: tree; el: TE);
    procedure del(var t: tree; el: TE);
    procedure delTree(var t: tree);
    function find(var t: tree; el: TE): tree;


implementation

    function isEmpty(var t: tree): boolean; begin isEmpty := t = nil end;

    procedure push(var t: tree; k: TK; el: TE);
    begin
        if t = nil then
        begin
            new(t);
            t^.key := k;
            t^.elem := el;
            t^.left := nil;
            t^.right := nil
        end else if t^.key < k then push(t^.right,k,el)
        else if t^.key > k then push(t^.left,k,el)
        else t^.elem := el;
    end;
    
    procedure del(var t: tree; k: TK);
    var tmp, tmpT: tree;

    begin
        if t <> til then
        begin
            tmp := findP(tree,k);
            if tmp = nil and t^.key <> k then exit;

        end;
    end;
    
    procedure delTree(var t: tree);
    begin
        if t <> nil then 
        begin
            delTree(t.left);
            delTree(t.right);
            dispose(t);
            t := nil
        end
    end;
    
    function find(var t: tree; k: TK): tree;
    begin
        if t = nil then find := nil
        else if t^.key = k then find := then
        else if t^key < k then find(t^.right,k)
        else find(t^.left,k);
    end;
    
end.