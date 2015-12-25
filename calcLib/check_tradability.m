function [Buyable, Sellable] = check_tradability(Price, InterpPrice)

    if nargin == 1

        InterpPrice = calc_interp(Price);

    end

    IsUpLim   = eqtol(shift(round(1.10 * InterpPrice, 2), 1), InterpPrice, 0.02);
    IsDnLim   = eqtol(shift(round(0.90 * InterpPrice, 2), 1), InterpPrice, 0.02);

    IsTrading = Price > 0;

    Buyable  = IsTrading & ~IsUpLim;
    Sellable = IsTrading & ~IsDnLim;

end
