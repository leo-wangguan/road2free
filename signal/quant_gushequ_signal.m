function ResData = quant_gushequ_signal(Data, Arg)

    % Parse arguments
    Avg    = Arg{1};
    Offset = Arg{end};

    % Pre-processing
    Open      = Data(:,2);
    Close     = Data(:,5);
    High = Data(:,3);
    Low = Data(:,4);
    Vol = Data(:,7);

    % References
    HHV5 = calc_hhv(High,5);
    MA10 = calc_ma(Close, 10);
    MA20 = calc_ma(Close, 20);

    % Triggers
    Filter  = condition1(Vol) .* ...
                  condition2(Close) .* ...
                  condition3(Vol) .* ...
                  condition4(High, HHV5) .* ...
                  condition5(Low, High) .* ...
                  condition6(Close, Open) .* ...
                  condition7(MA10, MA20) .* ...
                  condition8(Close) .* ...
                  condition9(Close, High);
    BuySignal = shift(Filter,1);        
    SellSignal = shift(Filter,2);
    SellSignal = adjust_sell_signal(SellSignal, Close);
    BuyPrice = Open;
    SellPrice = Close;
    
    % Post-processing
    ResData = [BuySignal, SellSignal, BuyPrice, SellPrice];

end

function Result = condition1(Vol)
    Result = shift(Vol,1) < shift(Vol,2) *2;
end

function Result = condition2(Close)
    Result = logical(Close);
end

function Result = condition3(Vol)
    Result = Vol < shift(Vol,1) *2;
end

function Result = condition4(High, HHV5)
    Result = High == HHV5;
end

function Result = condition5(Low, High)
    Result = Low < shift(High,1);
end

function Result = condition6(Close, Open)
    Result = shift(Close,1) > shift(Open,1) * 1.02;
end

function Result = condition7(MA10, MA20)
    Result = MA10 > MA20;
end

function Result = condition8(Close)
    Result = shift(Close,1) > shift(Close,2)*1.095;
end

function Result = condition9(Close, High)
    Result = Close < High*0.97;
end

function SellSignal = adjust_sell_signal(SellSignal, Close)
    N = length(Close);
    for i = 1:N
        if (SellSignal(i) == 1) && (Close(i) == 0)
            SellSignal(i) = 0;
            if i ~= N
                SellSignal(i+1) = 1;
            end
        end
    end
end