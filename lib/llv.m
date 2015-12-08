function Result = llv(Stock, DayIndex, N)
    if Stock.Low(DayIndex) == 0
        Result = 0;
    else
        Result = Stock.Low(DayIndex);
        n = N;
        while n > 0 
            if DayIndex > 0
                if Stock.Low(DayIndex) > 0
                    if Stock.Low(DayIndex) < Result
                        Result = Stock.Low(DayIndex);
                    end
                    n = n -1;
                end
                    DayIndex = DayIndex -1;
            else
                break;
            end
        end
    end
end
