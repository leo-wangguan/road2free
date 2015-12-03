function [Data, Flag] = squeeze_data(Data)

    % Remove empty rows in data.

    Flag = logical(Data(:,1));
    Data = Data(Flag,:);

end
