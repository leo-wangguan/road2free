function init_data(Type, Code, Start, File)

    % Get data, save data.

    Data = get_data(Type, Code, Start, yyyymmdd(datetime('today')));

    if ~isempty(Data)

        save_data(Type, Code, File, Data)

    else

        disp_msg('ER', ['Wrong initialize: ', Type, ' ', Code, ])

    end

end
