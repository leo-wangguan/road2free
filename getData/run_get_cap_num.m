function run_get_cap_num()

    cd_to_top_level()

    [Type, Code, FileLen] = load_list();

    CapNum = zeros(FileLen, 3);

    disp_msg('IN', 'Retrieving capital number ...')

    parfor i = 1:FileLen

        if strcmp(Type{i}, 'STOCK')

            CapNum = get_cap_num(Code{i});

        end

    end

    save('./mat/CapNum', 'CapNum')

end

function [Type, Code, FileLen] = load_list()

    load('./mat/List.mat')

    Type = List.Type;
    Code = List.Code;
    FileLen = List.FileLen;

end
