function run_conv_data()

    cd_to_top_level()

    [List, CapNum] = load_data();

    disp_msg('IN', 'Converting data ...')

    parfor i = 1:List.FileLen

        conv_data(List.Type{i}, List.File{i}, List.Conv{i}, List, CapNum{i});

    end

end

function [List, CapNum] = load_data()

    load('./mat/List.mat')
    load('./mat/CapNum.mat')

end
