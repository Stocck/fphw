unit AVGTree;
    
interface
    type
        typeKey = integer;
        typeElem = integer; 
        tree = ^node;
        node = record
                key: typeKey;
                elem: typeElem;
                right, left: tree;
            end;
    
    function buildTree(n: integer): tree;
    function heightTree(t: tree): integer;
    function find(t: tree; k: typeKey): tree;
    function min(t: tree): tree;
    function max(t: tree): tree;
    procedure add(var t: tree; k: typeKey; el: typeElem);
    procedure printTree(t: tree);
    procedure del(var t: tree; k: typeKey);
    procedure delTree(var t: tree);

implementation

    function buildTree(n: integer): tree;
    var 
        i: integer;
        tmpK: typeKey;
        tmpE: typeElem;
        t: tree;
    begin
        t := nil;
        if n > 0 then
        begin
            read(tmpK, tmpE);
            new(t);
            t^.key := tmpk;
            t^.elem := tmpe;
            t^.right := nil;
            t^.left := nil;
        end;
        for i := 2 to n do 
        begin
            read(tmpK, tmpE);
            add(t, tmpk, tmpe);
        end;
        buildTree := t;
    end;

    function heightTree(t: tree): integer;
    var 
        hr, hl: integer;
    begin
        if t = nil then heightTree := 0
        else begin
            hr := heightTree(t^.right) + 1;
            hl := heightTree(t^.left) + 1;
            if hr > hl then heightTree := hr
            else heightTree := hl;
        end;
    end;

    function find(t: tree; k: typeKey): tree;
    begin
        find := nil;
        while t <> nil do
        begin
            if t^.key > k then t := t^.left
            else if t^.key < k then t := t^.right
            else begin find := t; exit end
        end
    end;

    function min(t: tree): tree;
    begin
        min := nil;
        if t = nil then exit;
        while t^.left <> nil do t := t^.left;
        min := t;
    end;

    function max(t: tree): tree;
    begin
        max := nil;
        if t = nil then exit;
        while t^.right <> nil do t := t^.right;
        max := t;
    end;

    procedure printTree(t: tree);
    begin
        if t = nil then exit;
        printTree(t^.left);
        writeln('key: ', t^.key,' elem', t^.elem);
        printTree(t^.right);
    end;

    procedure add(var t: tree; k: typeKey; el: typeElem);
    var tOld, tHead, tMid, tNext: tree;

        procedure balAllLeft();
        begin
            tHead^.left := tMid^.right;
            tMid^.right := tHead;
        end;

        procedure balAllRight();
        begin
            tHead^.right := tMid^.left;
            tMid^.left := tHead;
        end;

        procedure balMidLeft();
        begin
            tMid^.right := tNext^.left;
            tHead^.left := tNext^.right;
            tNext^.left := tMid;
            tNext^.right := tHead;
        end;

        procedure balMidRight();
        begin
            tMid^.left := tNext^.right;
            tHead^.right := tNext^.left;
            tNext^.left := tHead;
            tNext^.right := tMid;
        end;

        procedure ballanced();
        var htM, htH: integer;
        begin
            htM := heightTree(tHead^.right) - heightTree(tHead^.left);
            htH := heightTree(tMid^.right) - heightTree(tMid^.left);
            if abs(htM + htH) = 3 then
            begin
                if tOld = nil then t := tMid
                else if tOld^.left = tHead then tOld^.left := tMid
                else tOld^.right := tMid;

                if htM = -1 then balAllLeft()
                else balAllRight()

            end else begin
                if tOld = nil then t := tNext
                else if tOld^.left = tHead then tOld^.left := tNext
                else tOld^.right := tNext;

                if htM = -1 then balMidRight()
                else balMidLeft()

            end;
        end;

    begin
        tOld := nil;
        tHead := nil;
        tMid := t;
        if t = nil then 
        begin
            new(t);
            t^.key := k;
            t^.elem := el;
            t^.right := nil;
            t^.left := nil;
            exit
        end;
        if t^.key < k then tNext := t^.right 
        else tNext := t^.left;
        while tNext <> nil do 
        begin
            tOld := tHead;
            tHead := tMid;
            tMid := tNext;
            if tMid^.key < k then tNext := tMid^.right 
            else tNext := tMid^.left;
        end;
        new(tNext);
        tNext^.key := k;
        tNext^.elem := el;
        tNext^.left := nil;
        tNext^.right := nil;
        ballanced();
    end;

    procedure del(var t: tree; k: typeKey);
    var tmp, tOld: tree;
        hr, hl: integer;
        procedure del_(var t: tree);
        begin
            while t <> nil do 
            begin
                hl := heightTree(t^.left);
                hr := heightTree(t^.right);
                if (hr < 2) and (hl < 2) then 
                begin
                    if hl = 1 then 
                    begin
                        t^.key := t^.left^.key;
                        t^.elem := t^.left^.elem;
                        dispose(t^.left);
                        t^.left := nil;
                    end else if hr = 1 then
                    begin
                        t^.key := t^.right^.key;
                        t^.elem := t^.right^.elem;
                        dispose(t^.right);
                        t^.right := nil;
                    end else 
                    begin
                        if tOld <> nil then
                        begin
                            if tOLd^.left = t then tOLd^.left := nil  
                            else tOLd^.right := nil
                        end;
                        dispose(t);
                        t := nil;
                    end
                end else if hr > hl then 
                begin 
                    t^.key := t^.right^.key;
                    t^.elem := t^.right^.elem;
                    t := t^.right;
                end else
                begin
                    t^.key := t^.left^.key;
                    t^.elem := t^.left^.elem;
                    t := t^.left;
                end
            end
        end;

    begin
        if t^.key = k then 
        begin
            del_(t);
        end;
        tOld := nil;
        tmp := t;
        while tmp <> nil do
        begin
            if tmp^.key = k then del_(tmp)
            else begin
                tOld := tmp;
                if tmp^.key < k then tmp := tmp^.right
                else if tmp^.key > k then tmp := tmp^.left
            end
        end
    end;

    procedure delTree(var t: tree);
    begin
        if t = nil then exit;
        delTree(t^.right);
        delTree(t^.left);
        dispose(t);
    end;
end.