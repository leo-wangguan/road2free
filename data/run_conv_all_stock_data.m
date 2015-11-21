% run it as a script.

function run_conv_all_stock_data()

    clear

    cd_to_top_level()

    FileList = ls('./mat/ExDiv/STOCK_*');
    
    disp_msg('IN', 'Converting stock data ...')

    for i = 1:size(FileList, 1)

        File = FileList(i,:);

        load(['./mat/ExDiv/', File])

        Data = conv_data('STOCK', Data);

        save(['./mat/ForAdj/', strrep(File, 'ExDiv', 'ForAdj')], 'Data')
 
    end

end
