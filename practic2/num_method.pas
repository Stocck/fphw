unit num_method;
    
interface
    type TF = function (x: Real): Real;
    var 
        EPS1, EPS2: real;
    procedure setEps1(x: real);
    procedure setEps2(x: real);
    function root(h, g, h1, g1: TF; a,b: real): real;
    function integral(f: TF; a,b: real; var n_c: integer):real;
implementation

    procedure setEps1(x: real); begin eps1 := x end;
    procedure setEps2(x: real); begin eps2 := x end;

    function root(h, g, h1, g1: TF; a,b: real): real;
    {Метод касательных (Ньютона)}
        
        function f(x:real):real; begin f:= h(x) - g(x) end;
        function f1(x: real):real; begin f1 := h1(x) - g1(x) end; 
        
        function root_(d,eps: real):real;
        begin
            while (f(d)*f(d + eps) > 0) do
            begin
                d := d - f(d)/f1(d);
            end;
            root_ := d;
        end;

    begin
        a := root_(a,EPS1);
        b := root_(b,-EPS1);
        root := (a + b) / 2;
    end;

    function integral(f: TF; a,b: real; var n_c: integer):real;
    {формула парабол (Симпсона)}
    type 
        integrall = record
            nIntegral, h, iPart1, iPart2, res: real; {4*iPart1, 2*iPart2}
        end;
    var 
        p, base: real;
        i1, i2: integrall;
        n: integer;

        function integral_part1(n: integer; h: real): real;
        var 
            res: real;
            i: integer;
        begin
            res := 0;
            for i := 1  to n div 2 do
                res := res + f(a+(2*i-1)*h);
            integral_part1 := res;
        end;
        
        procedure newIntegral(var i, iOld: integrall; n: integer);
        begin
            with i do begin
                nIntegral := n;
                h := (b-a)/n;
                iPart2 := iOld.iPart1 + iOld.iPart2;
                iPart1 := integral_part1(n,h);
                res := h/3*(4*iPart1 + 2*iPart2 + base);
            end;
        end;

    begin
        p := 1/15;
        base := f(a) + f(b);
        n := 1;
        with i2 do begin
            nIntegral := 1;
            h := (b-a);
            iPart2 := 0;
            iPart1 := 0;
            res := h/3*(base);
        end;
        repeat
            n := 2 * n;
            i1 := i2;
            newIntegral(i2, i1, n);
        until (p*abs(i1.res - i2.res) <= EPS2);
        newIntegral(i2, i2, n*2);
        n_c := n*2;
        integral := i2.res;
    end;
end.