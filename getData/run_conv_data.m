function run_conv_data()

    cd_to_top_level()

    load('./mat/List.mat')

    disp_msg('IN', 'Converting data ...')

    for i = 1:List.FileLen

        load(List.File{i})

        Data = conv_data(List.Type{i}, Data);

        save(List.Conv{i}, 'Data')
 
    end

end
