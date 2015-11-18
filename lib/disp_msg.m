function disp_msg(Type, Str)

    Len = size(Str, 1);

    for i = 1:Len

        disp_single_msg(Type, Str(i,:))

    end

end

function disp_single_msg(Type, Str)

    disp(['[' Type '] ---- ' Str ' ' repelem('-', 29 - length(Str))])

end
