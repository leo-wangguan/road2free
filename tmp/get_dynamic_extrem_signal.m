function NewData = get_dynamic_extrem_signal(Data, DatePair, Arg)

    % Find the optimized buy/sell MA values in the past days.
    % Determine buy or sell based on the optimized values.
    %
    % Use Before/Close as BuyPrice/SellPrice to calculate the delta.
    % Update BuyPrice(i)/SellPrice if actions happen.
    %
    % Signal change at the same day.

    % Parse arguments
    Intv = Arg{1};
    Dim  = Arg{2};

    % Pre-processing
    Offset    = max(Dim) - 1;
    TrunData  = truncate_data(Data, DatePair, Offset);
    Open      = TrunData(:,2);
    High      = TrunData(:,3);
    Low       = TrunData(:,4);
    BuyPrice  = TrunData(:,6);
    SellPrice = TrunData(:,5);

    % Main algorithm
    Len        = size(TrunData, 1);
    BuySignal  = zeros(Len, 1);
    SellSignal = zeros(Len, 1);
    HoldSignal = zeros(Len, 1);

    for i = Offset+1:Len

        [IntvBuy, IntvSell] = get_opt_arg(Data, TrunData(i-1,1), Intv, Dim);
        Max = extremum(@max, High, IntvBuy);
        Min = extremum(@min, Low,  IntvSell);

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_get_extrem_signal(Open, High, Low, BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, Max, Min, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end

function [IntvBuy, IntvSell] = get_opt_arg(Data, EndDate, Intv, Dim)

    Idx      = find(Data(:,1) <= EndDate, 1, 'last');
    DatePair = [Data(Idx-Intv+1,1) EndDate];
    ModelPct = zeros(length(Dim), length(Dim));

    for i = 1:length(Dim)

        parfor j = 1:length(Dim)

            [~, ~, ~, ~, ~, ~, ~, ModelPct(i,j)] = ...
                backtest_model(Data, DatePair, @get_extrem_signal, {Dim(i),Dim(j)});

        end

    end

    % Find the optimized buy/sell MA values
    [~, Row, Col] = find_max_row_col_idx(ModelPct);
    IntvBuy  = Dim(Row);
    IntvSell = Dim(Col);

    disp(DatePair)
    disp([IntvBuy IntvSell])

end
