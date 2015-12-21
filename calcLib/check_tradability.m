function [IsBuyable, IsSellable] = check_tradability(InterpPrice, Price)

    IsUpLim   = eqtol(shift(round(1.10 * InterpPrice, -2), 1), InterpPrice, 0.02);
    IsDnLim   = eqtol(shift(round(0.90 * InterpPrice, -2), 1), InterpPrice, 0.02);
%    IsDnLim   = eqtol(shift(round(0.90 * InterpPrice * 100)/100, 1), InterpPrice, 0.02);
%    IsUpLim   = eqtol(shift(round(1.10 * InterpPrice * 100)/100, 1), InterpPrice, 0.02);
    %IsUpLim   = shift(round(1.10 * InterpPrice, -2), 1) == InterpPrice;
    %IsDnLim   = shift(round(0.90 * InterpPrice, -2), 1) == InterpPrice;

    IsTrading = Price > 0;

    IsBuyable  = IsTrading & ~IsUpLim;
    IsSellable = IsTrading & ~IsDnLim;

end
