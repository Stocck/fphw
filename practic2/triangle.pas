unit triangle;

interface
uses num_method;
    function square_triangle(f1,f2,f3: TF; x1,x2,x3: real;var n1,n2,n3:integer): real;


implementation
    function square_triangle(f1,f2,f3: TF; x1,x2,x3: real; var n1,n2,n3:integer): real;
    {
        f1 - function x1 to x2
        f2 - function x2 to x3
        f3 - the longest function x1 to x3
        x1,x3 - left or right
        x2 - middle
    }
    begin
        square_triangle := abs(integral(f1,x1,x2,n1) + integral(f2,x2,x3,n2) - integral(f3,x1,x3,n3));
    end;
    
end.