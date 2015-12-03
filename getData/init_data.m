function init_data(Type, Code, Start, File)

    % Get data, save data.

    disp_msg('IN', ['Initiating ', lower(Type), ' ', Code, ' ...'])

    Data = get_data(Type, Code, Start, yyyymmdd(datetime('today')));

    if ~isempty(Data)

        save_data(Data, File)

    else

        disp_msg('ER', 'Initiating wrong')

    end

end
