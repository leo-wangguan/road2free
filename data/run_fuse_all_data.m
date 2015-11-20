% run it as a script.

function run_fuse_all_data()

    clear

    cd_to_top_level()

    load('./mat/INDEX_000001.mat')

    Date = Data(:,1);
    Len1 = length(Date);

    Len2 = 9;

    FileList = ls('./mat/ForAdj/STOCK_*');
    Len3 = size(FileList, 1);

    disp_msg('IN', 'Fusing data ...')

    BigData = zeros(Len1, Len2, Len3);

    for i = 1:Len3

        load(['./mat/ForAdj/', FileList(i,:)])

        BigData(:,:,i) = expand_data_size(Date, Data);

    end

    disp_msg('IN', 'Saving data ...')

    save('./mat/BigData', 'BigData')

end

function DataEx = expand_data_size(Date, Data)

    DataEx = zeros(length(Date), 9);
    Idx = ismember(Date, Data(:,1));

    DataEx(Idx,:) = Data;

end