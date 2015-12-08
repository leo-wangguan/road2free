function Result = turtle_filter(BigDataS, DayIndex)
    List = fieldnames(BigDataS);
    for i = 1:length(List)
        Stock = BigDataS.(List{i});
        if (exceed_20day_high(Stock, DayIndex) && initial_exceed(Stock, DayIndex)) == true
            continue;
        else
            BigDataS = rmfield(BigDataS,List(i));
            continue;
        end
    end
    Result = BigDataS;
end

function Result = exceed_20day_high(Stock, DayIndex)
        Result = true;
        for i = 1:19
            if Stock.High(DayIndex - i) > Stock.Close(DayIndex)
                Result = false;
                break;
            else
                continue;
            end
        end
end

function Result = initial_exceed(Stock, DayIndex)
    if exceed_20day_high(Stock, DayIndex -1) == false
        Result = true;
    else
        Result = false;
    end
end