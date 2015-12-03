function [LongRatio, BasePrice] = ... 
             update_long_ratio(LongRatio, LongStep, ...
                               BuyPrice, BasePrice, HoldSignal, i)

    if HoldSignal(i)

        BasePrice = ifelse(BasePrice == 0, BuyPrice(i), BasePrice);
        Idx = find(BuyPrice(i) / BasePrice >= LongStep(:,2), 1, 'last');

        if ~isempty(Idx)

            LongRatio(i:end) = sum(LongStep(1:Idx,1));

        end

    else

        LongRatio(i:end) = 0;
        BasePrice = 0;
 
    end

end
