function TradePrice = calc_trade_price(Type, Price)

    Stamp = 0.001;
    Commi = 0.0003;

    Rate = ifelseif(strcmp(Type, 'BUY'),  (1 + Commi), ...
                    strcmp(Type, 'SELL'), (1 - Commi - Stamp));

    TradePrice = Price * Rate;

end
