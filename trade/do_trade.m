function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
             do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ...
                      Offset, CutPct, LongStep)

    Len        = length(BuyPrice);
    BuySignal  = false(Len, 1);
    SellSignal = false(Len, 1);
    HoldSignal = false(Len, 1);
    LongRatio  = zeros(Len, 1);

    Start = 0;
    Step  = 0;

    for i = Offset+1:Len

        % Not holding, could buy.
        if ~HoldSignal(i)

            % Trigger buy.
            if BuyTrigger(i)

                BuySignal(i)      = true;
                HoldSignal(i:end) = true;
                BuyPrice(i)       = calc_trade_price('BUY', TradePrice(i));

                % Save starting.
                Start = i;

                % Save long ratio.
                Step = 1;
                LongRatio(i:end) = LongStep(1,1);

            end

        % Holding, could sell.
        else

            % Update long ratio.
            if Step < size(LongStep, 1) && ...
               TradePrice(i) / TradePrice(Start) > LongStep(Step+1,2)

                Step = Step + 1;
                LongRatio(i:end) = sum(LongStep(1:Step,1));

            end

            % Trigger sell or cut loss.
            if SellTrigger(i) || TradePrice(i) / TradePrice(Start) - 1 < CutPct

                SellSignal(i)       = true;
                HoldSignal(i+1:end) = false;
                SellPrice(i)        = calc_trade_price('SELL', TradePrice(i));

                LongRatio(i+1:end) = 0;

            end

        end

    end

end
