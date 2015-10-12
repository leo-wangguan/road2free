function NewData = get_dynamic_ma_buy_sell_signal(Data, DatePair, Arg)

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
    Close     = TrunData(:,5);
    BuyPrice  = TrunData(:,6);
    SellPrice = TrunData(:,5);

    % Main algorithm
    Len        = size(TrunData, 1);
    BuySignal  = zeros(Len, 1);
    SellSignal = zeros(Len, 1);
    HoldSignal = zeros(Len, 1);

    for i = Offset+1:Len

        % Get optimized buy / sell average upto i - 1
        [AvgBuy, AvgSell] = get_opt_org(Data, TrunData(i-1,1), Intv, Dim);

        % Determine signal and price of i
        if AvgBuy < AvgSell

            [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
                do_get_ma_buy_sell_signal(Close, BuyPrice, SellPrice, ...
                    BuySignal, SellSignal, HoldSignal, AvgBuy, AvgSell, i);

        else

            [SellSignal, HoldSignal, SellPrice] = ...
                do_check_and_sell(Close, BuySignal, SellSignal, HoldSignal, SellPrice, i);

        end

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end

function [AvgBuy, AvgSell] = get_opt_org(Data, EndDate, Intv, Dim)

    Idx      = find(Data(:,1) <= EndDate, 1, 'last');
    DatePair = [Data(Idx-Intv+1,1) EndDate];
    ModelPct = zeros(length(Dim), length(Dim));

    for i = 1:length(Dim)

        parfor j = 1:length(Dim)

            [~, ~, ~, ~, ~, ~, ~, ModelPct(i,j)] = ...
                backtest_model(Data, DatePair, @get_ma_buy_sell_signal, {Dim(i),Dim(j)});

        end

    end

    % Find the optimized buy/sell MA values
    [~, Row, Col] = find_max_row_col_idx(ModelPct);
    AvgBuy  = Dim(Row);
    AvgSell = Dim(Col);

    disp(DatePair)
    disp([AvgBuy AvgSell])

end
