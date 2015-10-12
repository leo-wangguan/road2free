function NewData = squash_data(Data)

    % Squash data with multiple rows to a single row.

    NewData    = Data(1,:);
    NewData(3) = max(Data(:,3));
    NewData(4) = min(Data(:,4));
    NewData(5) = Data(end,5);
    NewData(6) = 0;
    NewData(7) = sum(Data(:,7));
    NewData(8) = sum(Data(:,8));
    NewData(9) = 1;

end