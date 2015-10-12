function init_data(Type, Code, Start)

    % Get data, validate data, save data.

    Name = [Type, '_', Code];

    Data = get_data(Type, Code, Start, yyyymmdd(datetime('today')));

    validate_data(Data);

    save(Name, 'Data');

end
