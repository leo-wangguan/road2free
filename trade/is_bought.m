function Bool = is_bought(BuySignal, SellSignal)

    Bool = sum(BuySignal) ~= sum(SellSignal);

end
