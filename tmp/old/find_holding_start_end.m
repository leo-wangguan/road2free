function SEPair = find_holding_start_end(Signal)

    SEPair = zeros(length(Signal), 2);
    IsStarted = false;
    PairIdx = 1;
    
    for i = 1:length(Signal)
        if Signal(i) == true && i ~=length (Signal)
            if IsStarted == false
                IsStarted = true;
                SEPair(PairIdx,1) = i + 1;
            end
        else
            if IsStarted == true
                IsStarted = false;
                SEPair(PairIdx,2) = i;
                PairIdx = PairIdx + 1;
            end
        end
    end

    % last signal is true
    if IsStarted == true
        SEPair(PairIdx,2) = length(Signal);
        SEPair = SEPair(1:PairIdx,:);
    else
        SEPair = SEPair(1:PairIdx-1,:);
    end
    
end

