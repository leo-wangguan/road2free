function ResData = quant_pool_signal(Data, Arg)

    % Parse arguments
    List = Arg{1};
    Hist = Arg{2};
    Now  = Arg{3};


    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
