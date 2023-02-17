unit function_unit;
    
interface
    const 
        // [rfs,rfe)
        rfs = 0; // rangeFunctionStart
        rfe = 4; // rangeFunctionEnd
        sizeP = 10; // размер популяции
        accuracy = 14; // 1/2^accuracy - точность подсчета
    type 
        elementP = array[1..accuracy] of boolean;
        populationType = array[1..sizeP] of elementP;

    function f(x: real): real; // main function
    function number_by_rael(x: real): elementP; // real -> number
    function real_by_number(e: elementP): real; // number -> real
    procedure selection(p: populationType); // селекция
    procedure crossing(p: populationType); // скрещивание
    procedure mutation(p: populationType); // мутация
    
    procedure setCMutation(); // Изменение шанса значения мутации (Необходимо задать начальное значение) 
    function getCMutation(); // Получение шанса значения мутации
    procedure setCcrossing(); // Изменение кол-ва скрещиваемых особей (Необходимо задать начальное значение) 
    function getCcrossing(); // Получение кол-ва скрещиваемых особей

uses
    SysUtils, Classes;
    
implementation
    var cMutation: real;
        cCrossing: integer;
    
    function f(x: real): real; // main function
    begin
        x*exp(log(x-1.1)*5)*exp(log(x-1.2)*4)*exp(log(x-1.3)*3)*cos(x+100)
    end;

    function number_by_rael(x: real): elementP; // real -> number
    var tmp: elementP;
        i: integer;
    begin
        x := x * exp(accuracy*ln(2)); 
        for i := 1 to accuracy do 
        begin
            tmp[i] := odd(trunc(x));
            x := x / 2;
        end;
        number_by_rael := tmp;
    end;

    function real_by_number(e: elementP): real; // number -> real
    var tmp: real;
        i: integer;
    begin
        tmp := 0;
        for i := 1 to accuracy do
        begin
            tmp := tmp * 2;
            if e[i] then tmp := tmp + 1;
        end;
        tmp := tmp / exp(accuracy*ln(2));
        real_by_number := tmp;
    end;

    procedure selection(p: populationType); // селекция
    begin
    
    end;
    
    procedure crossing(p: populationType); // скрещивание
    begin
    
    end;

    procedure mutation(p: populationType); // мутация
    begin

    end;
    

    procedure setCMutation(); // Изменение шанса значения мутации (Необходимо задать начальное значение) 
    function getCMutation(); // Получение шанса значения мутации
    procedure setCcrossing(); // Изменение шанса значения мутации (Необходимо задать начальное значение) 
    function getCcrossing(); // Получение шанса значения мутации
    procedure setCselection(); // Изменение шанса значения мутации (Необходимо задать начальное значение) 
    function getCselection(); // Получение шанса значения мутации
end.