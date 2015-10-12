function Bool = check_if_bought(BuySignal, SellSignal)

    Bool = sum(BuySignal) ~= sum(SellSignal);

end
