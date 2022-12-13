{
    function (10)
        f1 = 1 + 4/(pow(x,2)+1);
        f2 = pow(x,3);
        f3 = pow(2,-x);
    method (3)

    square formula (3)

}
uses num_method, triangle;

var
    pMod,nI, cDigit : integer;
    eps,a,b : real;

//auxiliary function
function max(a,b: real): real; begin if a > b then max := a else max := b end;
function min(a,b: real): real; begin if a < b then min := a else min := b end;
function pow(x, y: real): real; begin pow := exp(y*ln(x)) end;
procedure setEps(x: real); begin setEps1(x*100); setEps2(x) end;
function lenghtDigit(x: real; f: boolean): integer; begin 
    lenghtDigit := 0;
    if (x < 1) and f then lenghtDigit := lenghtDigit(x * 10, f) + 1
end;
procedure printReal(x: real; n: integer); begin write(x:n:n) end;


{$F+}
//Relase and Debug
function f1(x: real): real; begin f1 := 1 + 4/(x*x + 1) end;
function f1d(x: real): real; begin f1d := -8*x/((x*x + 1)*(x*x + 1)) end;
function f2(x: real): real; begin f2 := x*x*x end;
function f2d(x: real): real; begin f2d := 3*x*x end;
function f3(x: real): real; begin f3 := pow(2, -x) end;
function f3d(x: real): real; begin f3d := -ln(2)*pow(2, -x) end;

//Simple Test
function st1(x: real): real; begin st1 := x end;
function st1d(x: real): real; begin st1d := 1 end;
function st2(x: real): real; begin st2 := -x end;
function st2d(x: real): real; begin st2d := -1 end;
function st3(x: real): real; begin st3 := -0.5*x + 1 end;
function st3d(x: real): real; begin st3d := -0.5 end;


//test integral
function i1(x:real):real; begin i1 := 3*exp(ln(x*x)) end;


//test root
function r1(x: real):real; begin r1 := x end;
function r1d(x: real):real; begin r1d := 1 end;
function r2(x: real):real; begin r2 := sin(x) end;
function r2d(x: real):real; begin r2d := cos(x) end;

procedure mainProgram(mode: integer; f1, f1d, f2, f2d, f3, f3d: TF);
var x12,x23,x13, a,b, eps: real;
    src: real;
    n1,n2,n3, cDigit: integer;

    procedure readAB(var a,b: real; n1,n2: integer);
    begin
        if (mode = 2) or (mode = 3) then 
        begin
            write('Enter [a,b] for f',n1, ', f',n2,': ');
            read(a,b);
        end;
    end;
begin
    a := -100;
    b := -0.001;
    eps := 0.0001;
    if (mode = 2) or (mode = 3) then // Debug or Simple mode
    begin
        writeln('Enter eps: ');
        read(eps);
    end;
    setEps(eps);
    cDigit := lenghtDigit(eps, abs(eps) < 1);
    readAB(a,b,1,2);
    x12 := root(f1,f2,f1d,f2d,a,b); // [-100, -0.001]
    write('x12 = ');
    printReal(x12, cDigit);
    writeln;
    
    readAB(a,b,2,3);
    x23 := root(f3,f2,f3d,f2d,a,b); // [-100, 100]
    write('x23 = ');
    printReal(x23, cDigit);
    writeln;

    readAB(a,b,1,3);
    x13 := root(f1,f3,f1d,f3d,a,b); // [-100, -0.001]
    write('x13 = ');
    printReal(x13, cDigit);
    writeln;

    src := x13 + x12 + x23 - max(x12, max(x23, x13)) - min(x13, min(x12, x23));
    if src = x12 then src := square_triangle(f1,f2,f3,x13,x12,x23,n1,n2,n3)
    else if src = x23 then src := square_triangle(f2,f3,f1,x12,x23,x13,n2,n3,n1)
    else src := square_triangle(f1,f3,f2,x12,x13,x23,n1,n3,n2);
    
    if (mode = 2) or (mode = 3) then 
    begin
        writeln('Count iteration in search Integral');
        writeln('   f1: ', n1);
        writeln('   f2: ', n2);
        writeln('   f3: ', n3);
        writeln;        
    end;
    write('Square trinanle = ');
    printReal(src, cDigit);
end;

begin
    writeln('the program for finding the area of a triangle');
    write('Program mode (1 - Release, 2 - Debug, 3 - Simple test triangle square, 4 - Numceral method test): ');
    read(pMod);
    case pMod of 
        1,2: // Release and Debug mode
        begin
            mainProgram(pMod,@f1,@f1d,@f2,@f2d,@f3,@f3d);
        end;
        3: // Simple test
        begin
            mainProgram(pMod,@st1,@st1d,@st2,@st2d,@st3,@st3d);
        end;
        4: // Root and Integral test
        begin
            
            //Install Eps
            eps := 0.0001;
            write('Enter eps [base = 0.0001]: ');
            read(eps);
            setEps(eps);
            cDigit := lenghtDigit(eps, abs(eps) < 1);

            //Root test
            writeln('Root function test');
            
            write('Enter [a,b] for r1: ');
            read(a,b);
            write('root r1 = ');
            printReal(root(@r1,@r2,@r1d,@r2d, a, b), cDigit);
            writeln;

            //Integral test
            writeln('Integral test');
            write('Enter [a,b] for r1: ');
            read(a,b);
            write('Integral i1: '); 
            printReal(integral(@i1, a, b, nI), cDigit);
            writeln(' ', nI);
        end
        else writeln();
    end; // Error message
end.