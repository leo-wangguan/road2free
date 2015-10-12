function Data = refine_data(Data)

    % Insert a column represents before close price.
    %
    % Data = [Date Open High Low Before Vol Amount];
    %
    % Data = [Date Open High Low Close Before Vol Amount];

    Data(:,7:9) = Data(:,6:8);
    Data(1,6)   = Data(1,2);

    if size(Data, 1) > 1

        Data(2:end,6) = Data(1:end-1,5);

    end

end