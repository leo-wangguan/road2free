function show_surface(Name, Data, DatePair, func_signal)

    Dim = 50;

    ModelPct = zeros(Dim, Dim);

    parfor i = 2:Dim

        for j = 2:Dim

            [~, ~, ~, ~, ~, ~, ~, ModelPct(i,j)] = ...
                backtest_model(Data, DatePair, func_signal, {i,j});
        end

    end

    figure
    box on
    title(Name)
    surface(ModelPct')
    colorbar
    xlabel('Buy')
    ylabel('Sell')

end

