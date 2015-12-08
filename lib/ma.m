function Result = ma(Stock, DayIndex, N)
    if Stock.Close(DayIndex) == 0
        Result = 0;
    else
        Acc = 0;
        n = N;
        while n > 0 
            if Stock.Close(DayIndex) > 0
                n = n -1;
                Acc = Acc + Stock.Close(DayIndex);
            end
                DayIndex = DayIndex -1;
        end
        Result = Acc/N;
    end
end


