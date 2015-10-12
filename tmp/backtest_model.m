function [StartDate, EndDate, StartPrice, EndPrice, HistDelta, HistPct, ...
             ModelDelta, ModelPct, Buy, Sell, ...
                 BuySignal, SellSignal, BuyPrice, SellPrice, ...
                     Duration, IdxPair] = ...
                         backtest_model(Data, DatePair, func_signal, Arg)

    % Ensure the output of all models can calculate the delta of each day.
    %
    % In general, one delta of a day is calculated by subtracting the close 
    % price of the day before from that of the day, meaning Close(i) - Before(i).
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
    
    Date   = Data(:,1);
    Close  = Data(:,5);
    Before = Data(:,6);

    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = func_signal(Arg);
    [Duration, IdxPair] = find_all_duration(Date, DatePair);
    
    StartDate  = num2str(Date(IdxPair(:,1)));
    EndDate    = num2str(Date(IdxPair(:,2)));
    StartPrice = Before(IdxPair(:,1));
    EndPrice   = Close(IdxPair(:,2));
    HistDelta  = EndPrice - StartPrice;
    HistPct    = 100 * HistDelta ./ StartPrice;
    ModelDelta = Duration' * (HoldSignal .* (SellPrice - BuyPrice));
    ModelPct   = 100 * ModelDelta ./ StartPrice;
    Buy        = num2str(Duration' * BuySignal);
    Sell       = num2str(Duration' * SellSignal);

end