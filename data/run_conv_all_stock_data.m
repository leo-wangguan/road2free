% run it as a script.

function run_conv_all_stock_data()

    clear

    cd_to_top_level()

    FileList = ls('./mat/STOCK_*');

    for i = 1:size(FileList, 1)

        Name = FileList(i,:);

        load(['./mat/', Name])

        Code = get_code(Name);
        Data = refine_data(Data);

        save(['./mat/STOCK_', Code, '_ForAdj'], 'Data')
 
    end

end

function Code = get_code(Name)

    C = strsplit(Name, '_');
    Code = C{2};

end
