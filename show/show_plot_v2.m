function show_plot_v2(NewData, Balance)

    Period = size(NewData,1);
    StockNums = size(NewData,3);
    for i = 1:Period
        
    NewData    = squeeze_data(NewData);
    Date       = NewData(:,1);
    Close      = NewData(:,5);
    BuySignal  = NewData(:,11);
    SellSignal = NewData(:,12);
    HoldSignal = NewData(:,13);
    BuyPrice   = NewData(:,14);
    SellPrice  = NewData(:,15);

    figure
    subplot(2, 1, 1)
    show_signal(Date, Close, BuyPrice, SellPrice, BuySignal, SellSignal, HoldSignal)
    set_signal_title(Name, Summ.HistPct, Summ.ModelPct, quant_signal, Arg)
    subplot(2, 1, 2)
    do_show_pct(Summ.StartPrice, Close, HoldSignal, BuyPrice, SellPrice)
    set_pct_title(Summ.WinRate, Summ.AvgWinPct, Summ.AvgLossPct)

end

function show_signal(Date, Close, BuyPrice, SellPrice, BuySignal, SellSignal, HoldSignal)

    UnHdIdx = find(xor(HoldSignal, ones(length(Close), 1)));
    HoldIdx = find(xor(xor(HoldSignal, BuySignal), SellSignal));
    BuyIdx  = find(BuySignal);
    SellIdx = find(SellSignal);

    box  on
    hold on
    grid on

    stem(UnHdIdx,    Close(UnHdIdx), ...
        'Marker',    'none', ...
        'LineStyle', ':', ...
        'Color',     [0.8 0.8 0.8])
    stem(HoldIdx,    Close(HoldIdx), ...
        'Marker',    'none', ...
        'LineWidth', 2, ...
        'Color',     [0.8 0.8 0.8])
    stem(BuyIdx,     BuyPrice(BuyIdx), ...
        'Marker',    'none', ...
        'LineWidth', 2, ...
        'Color',     [0.6 0.1 0.2])
    stem(SellIdx,    SellPrice(SellIdx), ...
        'Marker',    'none', ...
        'LineWidth', 2, ...
        'Color',     [0 0.5 0])
    plot(Close, 'LineWidth', 2)

    XTick = find(BuySignal+SellSignal);

    AX                    = gca;
    AX.FontSize           = 8;
    AX.XLim               = [1 inf];
    AX.XTickLabelRotation = 90;
    AX.XTick              = XTick;
    AX.XTickLabel         = num2str(Date(XTick));
    AX.YLim               = [min(Close)/2 inf];
    AX.YTick              = linspace(min(Close)/2, max(Close), 5);
    AX.YLabel.String      = 'Price';

end

function do_show_pct(StartPrice, Close, HoldSignal, BuyPrice, SellPrice)

    HistPct     = Close / StartPrice - 1;
    ModelCumPct = calc_cum_pct(StartPrice, HoldSignal, BuyPrice, SellPrice);

    box  on
    hold on
    grid on

    plot(HistPct,     'LineWidth', 2)
    plot(ModelCumPct, 'LineWidth', 2)

%     YTick = get_y_tick([HistPct; ModelCumPct]);

    AX                    = gca;
    AX.FontSize           = 8;
    AX.XLim               = [1 inf];
    AX.XAxisLocation      = 'top';
%     AX.YLim               = [min(YTick) max(YTick)];
%     AX.YTick              = YTick;
    AX.YLabel.String      = '%';

end

function set_signal_title(Name, HistPct, ModelPct, func_signal, Arg)

    Title = [func2str(func_signal), ' ', num2str(cell2mat(Arg))];

    title({[Name,  ' / ', num2str(HistPct),  '%']; ...
           [Title, ' / ', num2str(ModelPct), '%']}, ...
           'FontSize',    8,  ...
           'Interpreter', 'none')

end

function set_pct_title(WinRate, AvgWinPct, AvgLossPct)

    title({['Win rate: ', num2str(WinRate), '%']; ...
           [num2str(AvgWinPct), '% ', num2str(AvgLossPct), '%']}, ...
           'FontSize',    8,  ...
           'Interpreter', 'none')

end
