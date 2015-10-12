function validate_data(Data)

    % Validate data if Date(i) > Date(i-1) and Before(i) == Close(i-1).
    %
    % Display error message when not valid.

    Len = size(Data, 1) - 1;

    if ((sum(Data(1:end-1,1) <  Data(2:end,1))) ~= Len) && ...
       ((sum(Data(1:end-1,5) == Data(2:end,6))) ~= Len)

        disp('[ER] ---------- Wrong Data -------------')

    end

end