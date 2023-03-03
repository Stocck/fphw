unit function_unit;
    
interface
    const 
        // [RFS,RFE)
        RFS = 0; // rangeFunctionStart
        RFE = 4; // rangeFunctionEnd
        SIZEP = 10; // размер популяции
        ACCURACY = 14; // 1/2^ACCURACY - точность подсчета
    type 
        elementP = array[1..ACCURACY] of boolean;
        populationType = array[1..SIZEP] of elementP;

    function f(x: real): real; // main function
    function optimaze(x,y: real): boolean;
    function real_to_number(x: real): elementP; // real -> number
    function number_to_real(e: elementP): real; // number -> real
    procedure generateP(var p: populationType); // генерация популяции
    procedure selection(var p: populationType); // селекция
    procedure crossing(var p: populationType); // скрещивание
    procedure mutation(var p: populationType); // мутация
    function find_best(p: populationType): real;
    
    procedure setCMutation(x: real); // Изменение шанса мутации [0,1] (Необходимо задать начальное значение) 
    function getCMutation(): real; // Получение шанса мутации
    procedure setCcrossing(x: real); // Изменение шанса скрещивания [0,1] (Необходимо задать начальное значение) 
    function getCcrossing(): real; // Получение шанса успешного скрещивание
    procedure setCgenerate(x: real);
    function getCgenerate(): real;

implementation
    var cMutation, cCrossing, cGenerate: real;
    
    function pow(x: real; y: integer): real;
    begin
        if (x < 0) and odd(y) then pow := -exp(ln(-x)*y)
        else if x = 0 then pow := 0
        else pow := exp(ln(abs(x))*y);
    end;
    
    function f(x: real): real; // main function
    begin
        f := x*pow(x-1.1, 5)*pow(x-1.2, 4)*pow(x-1.3, 3)*cos(x+100)
    end;

    function optimaze(x,y: real): boolean;
    begin
        optimaze := f(x) > f(y);
    end;

    function real_to_number(x: real): elementP; // real -> number
    var tmp: elementP;
        i: integer;
    begin
        x := x * exp((ACCURACY-2)*ln(2)); 
        for i := 1 to ACCURACY do 
        begin
            tmp[i] := odd(trunc(x));
            x := x / 2;
        end;
        real_to_number := tmp;
    end;

    function number_to_real(e: elementP): real; // number -> real
    var tmp: real;
        i: integer;
    begin
        tmp := 0;
        for i := 1 to ACCURACY do
        begin
            tmp := tmp * 2;
            if e[ACCURACY-i + 1] then tmp := tmp + 1;
        end;
        number_to_real := tmp * exp(-(ACCURACY-2)*ln(2));
    end;

    procedure generateP(var p: populationType);
    var i, j: integer;
    begin
        for i := 1 to SIZEP do
            for j := 1 to ACCURACY do
                p[i][j] := random() < cGenerate;
    end;

    procedure selection(var p: populationType); // селекция
    var new_p: populationType;
        i,i1,i2 : integer;
        tmp1, tmp2 : real;
    begin
        for i := 1 to SIZEP do
        begin
            i1 := random(SIZEP)+1;
            i2 := random(SIZEP)+1;
            tmp1 := number_to_real(p[i1]);
            tmp2 := number_to_real(p[i2]);
            if optimaze(tmp1,tmp2) then new_p[i] := p[i1]
            else new_p[i] := p[i2];
        end;
        p := new_p;
    end;
    
    procedure crossing(var p: populationType); // скрещивание
    var 
        i,j: integer;
        tmp : boolean;
    begin
        for i := 1 to (SIZEP div 2) do
            for j := 1 to ACCURACY do //скрещивание 2*i-1 и 2*i 
                if random() < cCrossing then
                begin
                    tmp := p[2*i][j];
                    p[2*i][j] := p[2*i-1][j];
                    p[2*i-1][j] := tmp;
                end;
    end;

    procedure mutation(var p: populationType); // мутация
    var i, i1, i2: integer;
        tmp: boolean;
    begin
        for i := 1 to SIZEP do
            if random() < cMutation then
            begin
                i1 := random(ACCURACY)+1;
                i2 := random(ACCURACY)+1;
                tmp := p[i][i1];
                p[i][i1] := p[i][i2];
                p[i][i2] := tmp;
            end;
    end;

    function find_best(p: populationType): real;
    var i: integer;
        tmp, tmp1: real;
    begin
        tmp := number_to_real(p[1]);
        for i := 2 to SIZEP do
        begin
            tmp1 := number_to_real(p[i]);
            if optimaze(tmp1, tmp) then tmp := tmp1;
        end;
        find_best := tmp;
    end;


    procedure setCMutation(x: real);
    begin
        if x > 1 then cMutation := 1;
        if x < 0 then cMutation := 0;
        cMutation := x;
    end; 
    function getCMutation(): real; begin getCMutation := cMutation end;
    
    procedure setCcrossing(x: real);
    begin
        if x > 1 then cCrossing := 1;
        if x < 0 then cCrossing := 0;
        cCrossing := x;
    end;
    function getCcrossing(): real; begin getCcrossing := cCrossing end;

    procedure setCgenerate(x: real);
    begin
        if x > 1 then cGenerate := 1;
        if x < 0 then cGenerate := 0;
        cGenerate := x;
    end;
    function getCgenerate(): real; begin getCgenerate := cGenerate end;

end.