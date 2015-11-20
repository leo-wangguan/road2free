function update_data(Type, Code)

    % Load data, get new data, append data, validate data, save data.

    Name = ['./mat/ExDiv/', Type, '_', Code, '_ExDiv.mat'];

    load(Name)

    NewData = get_data(Type, Code, Data(end,1), yyyymmdd(datetime('today')));

    if size(NewData, 1) > 1

        Data = [Data; NewData(2:end,:)];

        disp_msg('IN', 'Done updating')

        validate_data(Data)

        save(Name, 'Data')

    else

        disp_msg('WA', 'No new data to update')

    end

end
