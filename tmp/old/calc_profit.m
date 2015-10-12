function Profit = calc_profit(Holding, Close, Before)

    Profit = Holding .* (Close - Before);

end

