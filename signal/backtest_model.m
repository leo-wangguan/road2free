function [StartDate, EndDate, StartPrice, EndPrice, HistDelta, HistPct, ...
             ModelDelta, ModelPct, Buy, Sell, WinRate, AvgWinPct, AvgLossPct, ...
                 NewData] = ...
                     backtest_model(Data, DatePair, func_signal, Arg)

    % Ensure the output of all models can calculate the delta of each day.
    %
    % In general, one delta of a day is calculated by subtracting the close
    % price of the day before from that of the day, Close(i) - Before(i).
    %
    % If buy or sell happens at the end of a day, the price is approximately
    % equal to the close price.
    %
    % If buy or sell happens in the middle of a day, the corresponding price,
    % Close(i) or Before(i), must be updated.
    %
    % BuySignal  = [0 0 1 0 0 0 0 0 1 0 0 0 0]';
    % SellSignal = [0 0 0 0 1 0 0 0 0 0 1 0 0]';
    % HoldSignal = [0 0 1 1 1 0 0 0 1 1 1 0 0]';
    %
    % Data    = [Date Open High Low Close Before Vol Amount Factor];
    %
    % NewData = [Date Open High Low Close Before Vol Amount Factor
    %            BuySignal SellSignal HoldSignal BuyPrice SellPrice Hold];

    NewData = func_signal(Data, DatePair, Arg);

    Date       = NewData(:,1);
    Close      = NewData(:,5);
    Before     = NewData(:,6);
    BuySignal  = NewData(:,10);
    SellSignal = NewData(:,11);
    HoldSignal = NewData(:,12);
    BuyPrice   = NewData(:,13);
    SellPrice  = NewData(:,14);

    StartDate  = Date(1);
    EndDate    = Date(end);
    StartPrice = Before(1);
    EndPrice   = Close(end);
    HistDelta  = EndPrice - StartPrice;
    HistPct    = HistDelta  ./ StartPrice * 100;
    ModelDelta = sum(HoldSignal .* (SellPrice - BuyPrice));
    ModelPct   = ModelDelta ./ StartPrice * 100;
    Buy        = sum(BuySignal);
    Sell       = sum(SellSignal);
    [WinRate, AvgWinPct, AvgLossPct] = ...
        calc_win_rate(BuySignal, SellSignal, BuyPrice, SellPrice);

end
