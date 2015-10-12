function NewData = get_dynamic_ma_dual_bottom_signal(Data, DatePair, Arg)

    % Find the optimized buy/sell MA values in the past days.
    % Determine buy or sell based on the optimized values.
    %
    % Use Before/Close as BuyPrice/SellPrice to calculate the delta.
    % Change Before(i) to Close(i) if buy action happens.
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
    Len        = length(Close);
    BuySignal  = zeros(Len, 1);
    SellSignal = zeros(Len, 1);
    HoldSignal = zeros(Len, 1);

    Max  = zeros(Len, 1);
    Avg1 = zeros(Len, 1);
    Avg2 = zeros(Len, 1);
    Mean = zeros(Len, 1);

    for i = Offset+1:Len

        % Get optimized buy / sell average upto i - 1
        [Max(i), Mean(i), Avg1(i), Avg2(i)] = ...
            get_opt_buy_sell_avg(Data, TrunData(i-1,1), Intv, Dim);

        % Determine signal and price of i
        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_get_ma_dual_bottom_signal(Close, BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, Avg1(i), Avg2(i), i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, Max, Mean, Avg1, Avg2];
    NewData = NewData(Offset+1:end,:);

end

function [Max, Mean, Avg1, Avg2] = get_opt_buy_sell_avg(Data, EndDate, Intv, Dim)

    Idx      = find(Data(:,1) <= EndDate, 1, 'last');
    DatePair = [Data(Idx-Intv+1,1) EndDate];
    ModelPct = zeros(length(Dim), length(Dim));

    for i = 1:length(Dim)

        parfor j = 1:length(Dim)

            [~, ~, ~, ~, ~, ~, ~, ModelPct(i,j)] = ...
                backtest_model(Data, DatePair, @get_ma_dual_bottom_signal, {Dim(i),Dim(j)});

        end

    end

    % Find the optimized buy/sell MA values
    [Max, Row, Col] = find_max_row_col_idx(ModelPct);
    Avg1 = Dim(Row);
    Avg2 = Dim(Col);
    Mean = mean(mean(ModelPct));

    disp(DatePair)
    disp([Max Mean Avg1 Avg2])

end
