function update_data(Type, Code, File)

    % Load data, get new data, validate data, save data.

    load(File)

    disp_msg('IN', ['Updating ', lower(Type), ' ', Code, ' ...'])

    NewData = get_data(Type, Code, Data(end,1), yyyymmdd(datetime('today')));

    if size(NewData, 1) > 1

        Data = [Data; NewData(2:end,:)];

        validate_data(Data)

        save(File, 'Data')

    else

        disp_msg('WA', 'No new data to update')

    end

end
