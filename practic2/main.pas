{
    function (10)
        f1 = 1 + 4/(pow(x,2)+1);
        f2 = pow(x,3);
        f3 = pow(2,-x);
    method (3)

    square formula (3)

}

uses num_method, triangle;

type func = record nameF: string[255]; f: TF; end;
var g1, g1d, g2, g2d, g3, g3d: func;

//
function max(a,b: real): real; begin if a > b then max := a else max := b end;
function min(a,b: real): real; begin if a < b then min := a else min := b end;
function pow(x, y: real): real; begin pow := exp(y*ln(x)) end;
procedure setEps(x: real); begin setEps1(x*100); setEps2(x) end;
procedure printReal(); begin end;
procedure setFunc(original: func; name: string[255]; fu: TF); 
begin 
    with original do
    begin
        nameF := name;
        f := fu;
    end
end;
procedure mainProgram(mode: integer; f1, f1d, f2, f2d, f3, f3d: func);
var x12,x23,x13, a,b, eps: real;
    src: real;
    n1,n2,n3: integer;
begin
    a := -100;
    b := -0.001;
    eps := 0.0001;
    if mode = 2 or mode = 3 then // Debug or Simple mode
    begin
        read(a,b);
        read(eps);
    end;
    setEps(eps);
    x12 := root(@f1.f,@f2.f,@f1d.f,@f2d.f,a,b); // [-100, -0.001]
    b := 100;
    x23 := root(@f3.f,@f2.f,@f3d.f,@f2d.f,a,b); // [-100, 100]
    x13 := root(@f1.f,@f3.f,@f1d.f,@f3d.f,a,b); // [-100, 100]

    src := x13 + x12 + x23 - max(x12, max(x23, x13)) - min(x13, min(x12, x23));
    if src = x12 then src := square_triangle(@f1.f,@f2.f,@f3.f,x13,x12,x23,n1,n2,n3)
    else if src = x23 then src := square_triangle(@f2.f,@f3.f,@f1.f,x12,x23,x13,n2,n3,n1)
    else src := square_triangle(@f1.f,@f3.f,@f2.f,x12,x13,x23,n1,n3,n2);
    
    wrietln('Function in triangle');
    wrietln('   ', f1.nameF);
    wrietln('   ', f2.nameF);
    wrietln('   ', f3.nameF);
    writeln('   f1 = 1 + 4/(pow(x,2)+1)');
    writeln('   f2 = pow(x,3)');
    writeln('   f3 = pow(2,-x)');
    writeln;
    if a = 2 or a = 3 then 
    begin
        writeln('Count iteration in search Integral');
        writeln('   f1: ', n1);
        writeln('   f2: ', n2);
        writeln('   f3: ', n3);
        wrietln;        
    end;
    writeln('Square trinanle = ', src:6:6);
end;

{$F+}
//Relase and Debug
function f1(x: real): real; begin f1 := 1 + 4/(x*x + 1) end;
function f1d(x: real): real; begin f1d := -8*x/((x*x + 1)*(x*x + 1)) end;
function f2(x: real): real; begin f2 := x*x*x end;
function f2d(x: real): real; begin f2d := 3*x*x end;
function f3(x: real): real; begin f3 := pow(2, -x) end;
function f3d(x: real): real; begin f3d := -ln(2)*pow(2, -x) end;

//Simple Test



//test integral
function i1(x:real):real; begin i1 := 3*exp(ln(x*x)) end;


//test root
function r1(x: real):real; begin r1 := x end;
function r1d(x: real):real; begin r1d := 1 end;
function r2(x: real):real; begin r2 := sin(x) end;
function r2d(x: real):real; begin r2d := cos(x) end;

begin
    writeln('the program for finding the area of a triangle');
    writeln('Program mode (1 - Release, 2 - Debug, 3 - Simple test triangle square, 4 - Numceral method test): ');
    read(a);
    case a of 
        1,2: // Release and Debug mode
        begin
            setFunc(g1, 'f1(x) = ', @f1);
            setFunc(g1d, 'f1d(x) = ', @f1d);
            setFunc(g2, 'f2(x) = ', @f2);
            setFunc(g2d, 'f2d(x) = ', @f2d);
            setFunc(g3, 'f3(x) = ', @f3);
            setFunc(g3d, 'f3d(x) = ', @f3d);
            mainProgram(a,g1,g1d,g2,g2d,g3,g3d);
        end;
        3: // Simple test
        begin
            setFunc(g1, 'f1(x) = ', @st1);
            setFunc(g1d, 'f1d(x) = ', @st1d);
            setFunc(g2, 'f2(x) = ', @st2);
            setFunc(g2d, 'f2d(x) = ', @st2d);
            setFunc(g3, 'f3(x) = ', @stf3);
            setFunc(g3d, 'f3d(x) = ', @stf3d);
            mainProgram(a,g1,g1d,g2,g2d,g3,g3d);
        end;
        4: // Root and Integral test
        begin
            
            //Install Eps
            eps := 0.0001;
            writeln('Enter eps [base = 0.0001]: ');
            read(eps);
            setEps(eps);

            //Root test
            writeln('Root function test');
            
            write();
            writeln(root(@t1,@t2,@t1d,@t2d, -500, 500):4:4);

            //Integral test 
            writeln(integral(@test1, 1, 5, n1): 4: 4, ' ', n1);
        end
        else: writeln(); // Error message
end.