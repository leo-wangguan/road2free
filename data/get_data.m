function Data = get_data(Type, Code, Start, End)

    % Unify two f_get_hist_xxxxx_data/3 functions.

    func = ifelseif(strcmp(Type, 'STOCK'), @f_get_hist_stock_data, ...
                    strcmp(Type, 'INDEX'), @f_get_hist_index_data);

    Data = func(Code, num2str(Start), num2str(End));

end
