function Data = append_data(Data, NewData)

    % Append data if new data is actually newer.
    %
    % Display infomation when new data is appended.

    if size(NewData, 1) > 1

        Data = [Data; NewData(2:end,:)];

        disp('[IN] ---------- Done update ------------')

    end

end
