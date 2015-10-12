function [Signal, BuyPrice, SellPrice] = get_ma_signal(Arg)
    
    % Close price higher/lower than MA
    % Buy/Sell at the end of the day
    % Signal change at the same day
    
    Close   = Arg{1}(:,5);
    Before  = Arg{1}(:,6);
    BuyAvg  = Arg{2};
    SellAvg = Arg{3};
    Filter  = Arg{4};
    
    [Signal, BuyPrice, SellPrice] = ...
        do_get_ma_signal(Close, Before, BuyAvg, SellAvg);
    Signal = filter_signal(Signal, Close, Filter);

end

function [Signal, Before, Close] = ...
             do_get_ma_signal(Close, Before, BuyAvg, SellAvg)

    Len = length(Close);
    Signal = zeros(Len, 1);
    [~, MaBuy]  = movavg(Close, 1, BuyAvg);
    [~, MaSell] = movavg(Close, 1, SellAvg);
    
    for i = 2:Len
        
        if Close(i) > MaBuy(i) && Close(i) > MaSell(i)
            
            Signal(i:end) = true;
            
            if Signal(i-1) == false
            
                Before(i) = Close(i);
                
            end
            
        elseif Close(i) < MaBuy(i) && Close(i) < MaSell(i)
            
            Signal(i+1:end) = false;
            
        elseif Close(i) > MaBuy(i) && Close(i) < MaSell(i)
            
            Signal(i:end) = true;

            if Signal(i-1) == false
            
                Before(i) = Close(i);
                
            end
            
        elseif Close(i) < MaBuy(i) && Close(i) > MaSell(i)
            
            Signal(i:end) = true;

            if Signal(i-1) == false
            
                Before(i) = Close(i);
                
            end
            
        end
        
    end

end

function Signal = filter_signal(Signal, Close, Filter)
   
    if ~isempty(Filter)
        
        for i = Filter
            
            [~, MaFil] = movavg(Close, 1, i);
            Signal = Signal .* (Close > MaFil);
            
        end
        
    end
    
end