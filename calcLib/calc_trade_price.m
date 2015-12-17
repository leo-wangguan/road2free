function TradePrice = calc_trade_price(Type, Price)

    Stamp = 0.001;
    Commi = 0.0003;

    if strcmp(Type, 'BUY')

        TradePrice = Price * (1 + Commi);

    elseif strcmp(Type, 'SELL')

        TradePrice = Price * (1 - Commi - Stamp);

    end

end
