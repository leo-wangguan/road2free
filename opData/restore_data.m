function Data = restore_data(D, Flag)

    % Restore data to align with others.

    Data = zeros(length(Flag), size(D, 2));
    Data(Flag,:) = D;

end
