function Holding = find_holding(Signal)

    % when buy/sell signal is triggered, buy/sell on the next day
    Holding = [0; Signal(1:end-1,:)];

end

