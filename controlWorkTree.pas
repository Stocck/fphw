type tree = ^node;
    node = record
        key: integer;
        left, right: tree
    end;

var n, i, tmpI: integer;
    t: tree;

procedure del(var t: tree);
var p: tree;
begin
    if t^.left = nil then
    begin
        p := t;
        t := t^.right;
        dispose(p)
    end else del(t^.left);
end;

procedure insert(var t: tree; k: integer);
begin
    if t = nil then 
    begin
        new(t);
        t^.key := k;
        t^.left := nil;
        t^.right := nil
    end else if k < t^.key then insert(t^.left, k)
    else insert(t^.right, k);
end;

procedure printTree(t: tree);
begin
    if t <> nil then
    begin
        printTree(t^.left);
        write(t^.key, ' ');
        printTree(t^.right)
    end 
end;

procedure delTree(t: tree);
var p: tree;
begin
    if t <> nil then
    begin
        p := t;
        delTree(t^.left);
        delTree(t^.right);
        dispose(p)
    end;
end;


begin
    t := nil;
    write('Entry count el: ');
    read(n);
    for i := 1 to n do
    begin
        read(tmpI);
        insert(t, tmpI)
    end;
    printTree(t);
    writeln();
    del(t);
    
    printTree(t);
    writeln();
    del(t);
    
    printTree(t);
    writeln();
    delTree(t);
end.
