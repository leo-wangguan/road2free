% run it as a script.

function run_conv_index_data()

    clear

    cd_to_top_level()

    CodeList = ['000001'; '399005'; '399006'];

    disp_msg('IN', 'Converting index data ...')

    for i = 1:size(CodeList, 1)

        File = ['./mat/Index/INDEX_', CodeList(i,:), '.mat'];

        load(File)

        Data = conv_data('INDEX', Data);

        save(strrep(File, '.mat', '_Conv.mat'), 'Data')
 
    end

end
