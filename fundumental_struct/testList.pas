uses LinkedListOne;
{
    test in compileter use flag -gh
    fpc -gh .\testList.pas 
}
var n: integer;
    arr, tmp: list;
    a, b: TE;
begin
    write('Enter to count element List: ');
    read(n);
    write('Enter element list (integer): ');
    arr := buildList(n);
    writeln('List after build');
    printList(arr);
    writeln();

    write('Enter find element and replacement element: ');
    read(a,b);
    tmp := find(arr, a);
    tmp^.el := b;

    writeln('List after find and replacement element: ');
    printList(arr);
    writeln();

    write('Enter delete element: ');
    read(a);
    del(arr, a);

    writeln('List after delete element: ');
    printList(arr);
    writeln();

    write('Enter app first element and end element: ');
    read(a,b);
    appbegin(arr, a);
    append(arr, b);

    writeln('List after app element: ');
    printList(arr);
    writeln();

    dellast(arr);
    writeln('List after delete last el: ');
    printList(arr);
    writeln();

    delList(arr);
end.