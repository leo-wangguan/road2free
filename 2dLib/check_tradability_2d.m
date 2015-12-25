function [Buyable, Sellable] = check_tradability_2d(A, InterpA)

    [Buyable, Sellable] = arrayfun(@(x) check_tradability(A(:,x), ... 
                                   InterpA(:,x)), 1:size(A, 2), 'uni', false);
    Buyable  = [Buyable{:}];
    Sellable = [Sellable{:}];

end
