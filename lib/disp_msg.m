function disp_msg(Type, Str)

    for i = 1:size(Str, 1)

        disp_single_msg(Type, Str(i,:))

    end

end

function disp_single_msg(Type, Str)

    disp(['[' Type '] ---- ' Str ' ' repelem('-', 34 - length(Str))])

end
