function Res = calc_summary(Data, NewData)

    Date       = Data(:,1);
    Close      = Data(:,5);
    Before     = Data(:,6);
    BuySignal  = NewData(:,1);
    SellSignal = NewData(:,2);
    HoldSignal = NewData(:,3);
    BuyPrice   = NewData(:,4);
    SellPrice  = NewData(:,5);
    LongRatio  = NewData(:,6);

    Res.StartDate  = Date(1);
    Res.EndDate    = Date(end);
    Res.StartPrice = Before(1);
    Res.EndPrice   = Close(end);
    Res.HistDelta  = Res.EndPrice - Res.StartPrice;
    Res.HistPct    = Res.HistDelta  ./ Res.StartPrice * 100;
    Res.ModelDelta = sum(HoldSignal .* (SellPrice - BuyPrice) .* LongRatio);
    Res.ModelPct   = Res.ModelDelta ./ Res.StartPrice * 100;
    Res.BuyCount   = sum(BuySignal);
    Res.SellCount  = sum(SellSignal);

    [Res.WinRate, Res.AvgWinPct, Res.AvgLossPct] = ...
        calc_win_rate(BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice);

end
