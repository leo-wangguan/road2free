function update_data(Type, Code, File)

    % Load data, get new data, save data.

    load(File)

    NewData = get_data(Type, Code, Data(end,1), yyyymmdd(datetime('today')));

    if size(NewData, 1) > 1

        Data = [Data; NewData(2:end,:)];

        save_data(Type, Code, File, Data)

    else

        disp_msg('WA', ['No new data: ', Type, ' ', Code, ])

    end

end
