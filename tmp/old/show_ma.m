function show_ma(AllClose, Avg, DayIntv)

    Ma = get_ma(AllClose, Avg, DayIntv);
    do_show_ma(Ma, length(Avg));

end

function do_show_ma(Ma, Num)

    XMin = 0;
    XMax = length(Ma)+1;
    YMin = min(min(Ma))-200;
    YMax = max(max(Ma))+200;

    figure
    box on
    grid on
    hold on
    xlim([XMin XMax])
    ylim([YMin YMax])

    for Idx = 1:Num
        plot(Ma(:,Idx))
    end

end

