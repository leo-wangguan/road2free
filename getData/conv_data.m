function Data = conv_data(Type, Data, CapNum)

    % Data = [Date Open High Low Close Vol Amount Factor];
    %
    % Data = [Date Open High Low Close Before Vol Amount Factor N
    %         Buyable Sellable TotalCap FloatCap TotalMaket FloatMaket];

    % Save ex-dividend close price to calculate market cap later.
    ExDivClose = Data(:,5);

    % Expand the number of columns to 16.
    Data(:,16) = 0;

    % Calculate forward adjusted price.
    if strcmp(Type, 'STOCK')

        Data(:,1:8) = CalculateStockXRD(Data(:,1:8), [], 1);

    end

    % Insert column 'Before'.
    Data(:,7:9) = Data(:,6:8);
    Data(:,6)   = shift(Data(:,5),1);
    Data(1,6)   = Data(1,2);

    % Insert column 'N'.
    Data(:,10) = calc_n(Data(:,3), Data(:,4), Data(:,6));

    % Insert column 'Buyable' and 'Sellable', calculated with close price.
    [Data(:,11), Data(:,12)] = calc_tradability(Data(:,5));

    % Insert column 'TotalCap', 'FloatCap', 'TotalMarket' and 'FloatMarket'.
    if strcmp(Type, 'STOCK')

        [Data(:,13), Data(:,14)] = mask_cap_num(Data(:,1), CapNum);
        Data(:,15) = Data(:,13) .* ExDivClose / 1e8;
        Data(:,16) = Data(:,14) .* ExDivClose / 1e8;

    end

end
