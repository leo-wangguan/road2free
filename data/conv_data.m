function Data = conv_data(Type, Data)

    % Insert a column represents before close price;
    % Insert a column represents average true range;
    %
    % Data = [Date Open High Low Close Vol Amount Factor];
    %
    % Data = [Date Open High Low Close Before Vol Amount Factor N];

    if strcmp(Type, 'INDEX')

        Data(:,8) = 1;

    end

    Data(:,7:9) = Data(:,6:8);
    Data(1,6)   = Data(1,2);

    if size(Data, 1) > 1

        Data(2:end,6) = Data(1:end-1,5);

    end

    Data(:,10) = calc_n(Data(:,3), Data(:,4), Data(:,6), 20);

end
