function init_data(Type, Code, Start)

    % Get data, validate data, save data.

    Data = get_data(Type, Code, Start, yyyymmdd(datetime('today')));
    
    if ~isempty(Data)

        disp_msg('IN', 'Done initiating')

        validate_data(Data)
        save(['./mat/', Type, '_', Code, '_ExDiv'], 'Data')

    else

        disp_msg('ER', 'Initiating wrong')

    end

end
