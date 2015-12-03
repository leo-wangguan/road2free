function update_data(Type, Code, File)

    % Load data, get new data, save data.

    disp_msg('IN', ['Updating ', lower(Type), ' ', Code, ' ...'])

    load(File)

    NewData = get_data(Type, Code, Data(end,1), yyyymmdd(datetime('today')));

    if size(NewData, 1) > 1

        Data = [Data; NewData(2:end,:)];

        save_data(Data, File)

    else

        disp_msg('WA', 'No new data to update')

    end

end
