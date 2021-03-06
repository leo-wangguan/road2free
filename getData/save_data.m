function save_data(Type, Code, File, Data)

    % Save data if Date(i) > Date(i-1) and no existence of NaN.

    if sum(Data(1:end-1,1) < Data(2:end,1)) ~= (size(Data, 1) - 1) || ...
       sum(sum(isnan(Data)))

        disp_msg('ER', ['Wrong validate: ', Type, ' ', Code, ])

    else

        save(File, 'Data')
 
    end

end
