function StockList = run_filter(Day, Data)
    StockList = turtle_filter(Day, Data, []);
    StockList = ang_filter(Day, Data, StockList);
    StockList = other_filter(Day, Data, StockList);
end

