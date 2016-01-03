function Names = get_stock_name_from_index(Index, List)
    Len = length(Index);
    Names = cell(1,Len);
    for i = 1:Len
        Names{i} = List.Abbr{Index(i)};
    end
end

