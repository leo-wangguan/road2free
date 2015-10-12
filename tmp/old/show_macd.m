function show_macd(AllClose, DayIntv)

    [Dif, Dea] = get_macd(AllClose, DayIntv);
    do_show_macd(Dif, Dea);

end

function do_show_macd(Dif, Dea)

    Macd = (Dif - Dea) * 2;
    Up   = (Macd >= 0) .* Macd;
    Down = (Macd <  0) .* Macd;

    XMin = 33;
    XMax = length(Up)+1;
    YMin = min(Down)-20;
    YMax = max(Dif)+20;
    Green = [0,0.5,0];

    figure
    box on
    grid on
    hold on
    xlim([XMin XMax])
    ylim([YMin YMax])
    plot(Dif, 'k')
    plot(Dea, 'b')
    stem(Up,   'Marker', 'none', 'Color', 'r')
    stem(Down, 'Marker', 'none', 'Color', Green)
end