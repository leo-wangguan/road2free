% run it as a script.

function run_conv_all_stock_data()

    clear

    cd_to_top_level()

    FileList = ls('./mat/ExDiv/STOCK_*');
    
    disp_msg('IN', 'Converting data ...')

    for i = 1:size(FileList, 1)

        Name = FileList(i,:);

        load(['./mat/ExDiv/', Name])

        Data = refine_data(Data);

        save(['./mat/ForAdj/', strrep(Name, 'ExDiv', 'ForAdj')], 'Data')
 
    end

end
