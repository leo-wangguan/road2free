function Data = conv_data(Type, Data)

    % Convert data with following steps:
    %
    % Align data size;
    % Insert a column represents before close price;
    % Insert a column represents average true range.
    % Insert a column represents buy-ability.
    % Insert a column represents sell-ability.
    %
    % Data = [Date Open High Low Close Vol Amount Factor];
    %
    % Data = [Date Open High Low Close Before Vol Amount Factor N
    %         Buyable Sellable];

    % Expand the number of columns to 12.
    Data(:,12) = 0;

    % Align stock data and index data size.
    if strcmp(Type, 'STOCK')

        Data(:,1:8) = CalculateStockXRD(Data(:,1:8), [], 1);

    end

    % Insert column 'Before'.
    Data(:,7:9) = Data(:,6:8);
    Data(:,6)   = shift(Data(:,5),1);
    Data(1,6)   = Data(1,2);

    % Insert column 'N'.
    if size(Data, 1) >= 20

        Data(:,10) = calc_n(Data(:,3), Data(:,4), Data(:,6), 20);

    end

    % Insert column 'Buyable' and 'Sellable', calculated with close price.
    [Data(:,11), Data(:,12)] = check_tradability(Data(:,5));

end
