function Idx = get_idx(Type, Input)

    global List

    switch Type

        case 'DATE'

            Idx = find(List.Date == Input);

        case 'ABBR'

            Idx = find(strcmp(Input, List.Abbr));

    end

end
