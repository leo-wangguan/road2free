function [IsBuyable, IsSellable] = check_tradability_2d(A, InterpA)

    [IsBuyable, IsSellable] = arrayfun(@(x) check_tradability(A(:,x), InterpA(:,x)), 1:size(A, 2), 'uni', false);
    IsBuyable  = [IsBuyable{:}];
    IsSellable = [IsSellable{:}];

end
