function Data = pick_data(BigData, Item)

    switch Item

        case 'CLOSE'

            Data = reshape(BigData(:, 5,:), [], size(BigData, 3));

        case 'BUYABLE'

            Data = reshape(BigData(:,11,:), [], size(BigData, 3));

        case 'SELLABLE'

            Data = reshape(BigData(:,12,:), [], size(BigData, 3));

    end

end
