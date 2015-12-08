function do_run_filter(Day)
    cd_to_top_level()
    load('./mat/List.mat');
    load('./mat/BigDataS.mat');
    DayIndex = convert_day_to_index(Day, List);
    %BigDataS = turtle_filter(BigDataS, DayIndex);
    BigDataS = gushequ_filter(BigDataS, DayIndex);
    disp('Selected stocks are');
    disp(fieldnames(BigDataS));
end

function Index = convert_day_to_index(Day, List)
    if  strcmp(Day,'today') == 1
        Date = yyyymmdd(datetime('today'));
    elseif ischar(Day) == 1
        Date = str2double(Day);
    else
        Date = Day;
    end
    
    if List.Date(List.DateLen) < Date
        Index = List.DateLen;
    else  
        for i = 1:List.DateLen
            if List.Date(i) == Date
                Index = i;
                break;
            elseif (List.Date(i) < Date) && (Date < List.Date(i+1))
                Index = i;
                break;
            else
                continue;
            end
        end
    end
end