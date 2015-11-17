function Data = get_data(Type, Code, Start, End)

    % Unify two GetXxxxxTSDay_Web/3 functions.

    func = ifelseif(strcmp(Type, 'STOCK'), @GetStockTSDay_Web, ...
                    strcmp(Type, 'INDEX'), @GetIndexTSDay_Web);

    disp_msg('IN', Code)

    Data = func(Code, num2str(Start), num2str(End));

end
