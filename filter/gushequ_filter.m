function Result = gushequ_filter(BigDataS, DayIndex)
    List = fieldnames(BigDataS);
        for i = 1:length(List)
            Stock = BigDataS.(List{i});
            if condition1(Stock,DayIndex) && ...
               condition2(Stock,DayIndex) && ...
               condition3(Stock,DayIndex) && ...
               condition4(Stock,DayIndex) && ...
               condition5(Stock,DayIndex) && ...
               condition6(Stock,DayIndex) && ...
               condition7(Stock,DayIndex) && ...
               condition8(Stock,DayIndex) && ...
               condition9(Stock,DayIndex)
                continue;
            else
                BigDataS = rmfield(BigDataS,List(i));
            continue;
            end
        end
    Result = BigDataS;
end

function Result = condition1(Stock,DayIndex)
%     Result = Stock.Vol(DayIndex-1) < Stock.Vol(DayIndex-2)*2;
    Result = get_nonzero_val(Stock.Vol,DayIndex,-1) < (get_nonzero_val(Stock.Vol,DayIndex,-2))*2;
end

function Result = condition2(Stock,DayIndex)
    Result = Stock.Open(DayIndex) > 0;
end

function Result = condition3(Stock,DayIndex)
%     Result = Stock.Vol(DayIndex) < (Stock.Vol(DayIndex-1))*2;
    Result = Stock.Vol(DayIndex) < (get_nonzero_val(Stock.Vol,DayIndex,-1))*2;
end

function Result = condition4(Stock, DayIndex)
    Result = Stock.High(DayIndex) == hhv(Stock, DayIndex, 5);
end

function Result = condition5(Stock, DayIndex)
%     Result = Stock.Low(DayIndex) < Stock.High(DayIndex-1);
    Result = Stock.Low(DayIndex) < get_nonzero_val(Stock.High,DayIndex,-1);
end

function Result = condition6(Stock, DayIndex)
%     Result = Stock.Close(DayIndex-1) > (Stock.Open(DayIndex-1))*1.02;
    Result = get_nonzero_val(Stock.Close,DayIndex,-1) > (get_nonzero_val(Stock.Open,DayIndex,-1))*1.02;
end

function Result = condition7(Stock, DayIndex)
    Result = ma(Stock, DayIndex, 10) > ma(Stock, DayIndex, 20);
end

function Result = condition8(Stock, DayIndex)
%     Result = Stock.Close(DayIndex-1) > (Stock.Close(DayIndex-2))*1.095;
    Result = get_nonzero_val(Stock.Close,DayIndex,-1) > (get_nonzero_val(Stock.Close,DayIndex,-2))*1.095;
end

function Result = condition9(Stock, DayIndex)
    Result = Stock.Close(DayIndex) < (Stock.High(DayIndex))*0.97;
end