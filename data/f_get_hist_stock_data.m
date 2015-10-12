function StockData = f_get_hist_stock_data(Code, Start, End)

    % Get stock data with a column represents before close price.
    %
    % StockData = [Date Open High Low Close Before Vol Amount Factor];

    StockData = GetStockTSDay_Web(Code, Start, End);
    StockData = CalculateStockXRD(StockData, [], 1);
    StockData = refine_data(StockData);

end