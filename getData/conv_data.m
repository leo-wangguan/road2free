function Data = conv_data(Type, Data)

    % Convert data with following steps:
    %
    % Align data size;
    % Insert a column represents before close price;
    % Insert a column represents average true range.
    %
    % Data = [Date Open High Low Close Vol Amount Factor];
    %
    % Data = [Date Open High Low Close Before Vol Amount Factor N];

    % Align stock data and index data size.
    if strcmp(Type, 'STOCK')

        Data = CalculateStockXRD(Data, [], 1);

    elseif strcmp(Type, 'INDEX')

        Data = insert_col(Data, 8);

    end

    % Insert column 'Before'.
    Data = insert_col(Data, 6);
    Data(1,6) = Data(1,2);

    if size(Data, 1) > 1

        Data(2:end,6) = Data(1:end-1,5);

    end

    % Insert column 'N'.
    Data(:,10) = calc_n(Data(:,3), Data(:,4), Data(:,6), 20);

end
