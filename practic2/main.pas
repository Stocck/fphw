{
    function (10)
        f1 = 1 + 4/(pow(x,2)+1);
        f2 = pow(x,3);
        f3 = pow(2,-x);
    method (3)

    square formula (3)

}
const eps = 0.001;
{$F+}
type TF = function (x: Real): Real;

function pow(var x, y: real): real; 
begin 
    pow := exp(y*ln(x))
end;

{$F+}
function f1(var x: real): real; 
begin 
    f1 := 1 + 4/(pow(x, 2) + 1) 
end;

{$F+}
function f2(var x: real): real; 
begin 
    f2 := pow(x, 3) 
end;

{$F+}
function f3(var x: real): real; 
begin 
    f3 := pow(2, -x) 
end;

