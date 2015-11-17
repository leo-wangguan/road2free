function validate_data(Data)

    % Validate data if Date(i) > Date(i-1).

    if sum(Data(1:end-1,1) <  Data(2:end,1)) ~= (size(Data, 1) - 1)

        disp_msg('ER', 'Validation error')

    end

end