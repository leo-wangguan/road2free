function update_data(Type, Code)

    % Load data, get new data, append data, validate data, save data.

    Name = [Type, '_', Code];

    load(Name)

    NewData = get_data(Type, Code, Data(end,1), yyyymmdd(datetime('today')));
    Data    = append_data(Data, NewData);

    validate_data(Data);
    save(Name, 'Data');

end
