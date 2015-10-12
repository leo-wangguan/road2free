function show_line(Name, Data, DatePair, func_signal, Arg)

    Dim = 100;
    
    ModelPct = zeros(Dim, 1);
    
    for i = 2:Dim
        
        [~, ~, ~, ~, ~, ~, ~, ModelPct(i)] = ...
            backtest_model(Data, DatePair, func_signal, {Arg{1},i,Arg{2}});
    end
    
    figure
    title(Name)
    plot(1:Dim, ModelPct)
    
end
