function [IsBuyable, IsSellable] = check_tradability_2d(InterpA, A)

    [IsBuyable, IsSellable] = arrayfun(@(x) check_tradability(InterpA(:,x), A(:,x)), 1:size(A, 2), 'uni', false);
    IsBuyable  = [IsBuyable{:}];
    IsSellable = [IsSellable{:}];

end
