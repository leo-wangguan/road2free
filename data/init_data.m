function init_data(Type, Code, Start)

    % Get data, validate data, save data.

    Name = [Type, '_', Code, '_ExDiv'];

    Data = get_data(Type, Code, Start, yyyymmdd(datetime('today')));
    
    if ~isempty(Data)

        validate_data(Data);
        save(['./mat/' Name], 'Data');

    end

end
