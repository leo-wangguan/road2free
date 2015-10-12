function DataInDate = get_data_intv(Data, DayIntv)

    DayIntvOk = verify_day_intv(DayIntv);
    DataInDate = flipud(Data(DayIntvOk));

end

function DayIntvOk = verify_day_intv(Date)

    Start = Date(1);
    End   = Date(2);
    
    if End == 0
        DayIntvOk = 1:Start;
    else
        DayIntvOk = End:Start;
    end

end