function [Buyable, Sellable] = check_tradability(Price)

    Buyable  = ~eqtol(shift(round(1.10 * Price, 2), 1), Price, 0.02);
    Sellable = ~eqtol(shift(round(0.90 * Price, 2), 1), Price, 0.02);

end
