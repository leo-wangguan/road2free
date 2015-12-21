function disp_msg(Type, Str)

    arrayfun(@(x) disp(['[', Type, '] ---- ', Str(x,:), ' ', ...
             repelem('-', 34 - length(Str(x,:)))]), 1:size(Str, 1))

end
