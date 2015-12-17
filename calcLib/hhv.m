function Result = hhv(Stock, DayIndex, N)
    if Stock.High(DayIndex) == 0
        Result = 0;
    else
        Result = 0;
        n = N;
        while n > 0 
            if DayIndex > 0
                if Stock.High(DayIndex) > 0
                    if Stock.High(DayIndex) > Result
                        Result = Stock.High(DayIndex);
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

