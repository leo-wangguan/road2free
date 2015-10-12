function show_candle(Name, Data, DatePair)

    TrunData  = truncate_data(Data, DatePair, 0);
    Date      = TrunData(:,1);
    Open      = TrunData(:,2);
    High      = TrunData(:,3);
    Low       = TrunData(:,4);
    Close     = TrunData(:,5);

    figure
    subplot(2, 1, 1)
    do_show_candle(Date, Open, High, Low, Close);
    set_title(Name, DatePair)
    subplot(2, 1, 2)

end

function do_show_candle(Date, Open, High, Low, Close)

    Even = (Close == Open);
    Up   = (Close >  Open);
    Down = (Close <  Open);

    box on
    grid on
    hold on

    candle(High.*Even, Low.*Even, Close.*Even, Open.*Even, 'k')
    candle(High.*Up,   Low.*Up,   Close.*Up,   Open.*Up,   [0.6 0.1 0.2])
    candle(High.*Down, Low.*Down, Close.*Down, Open.*Down, [0 0.5 0])

    AX                    = gca;
    AX.FontSize           = 8;
    AX.XLim               = [1 inf];
    AX.XTickLabelRotation = 90;
    AX.XTick              = 1:length(Date);
    AX.XTickLabel         = num2str(Date);
    AX.YLim               = [min(Close)/2 inf];
    AX.YTick              = linspace(min(Close)/2, max(Close), 5);
    AX.YLabel.String      = 'Price';

end

function set_title(Name, DatePair)

    title({[Name]; ...
           [num2str(DatePair(1)), ' - ', num2str(DatePair(2))]}, ...
           'FontSize',    8,  ...
           'Interpreter', 'none')

end