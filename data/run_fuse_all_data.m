% run it as a script.

function run_fuse_all_data()

    clear

    cd_to_top_level()

    [BigData, Date, FileList] = prep_for_fusing();

    disp_msg('IN', 'Fusing data ...')

    for i = 1:length(FileList)

        load(FileList{i})

        BigData(ismember(Date, Data(:,1)),:,i) = Data;

    end

    disp_msg('IN', 'Saving data ...')

    save('./mat/BigData', 'BigData')

    gen_list(FileList)

end

function [BigData, Date, FileList] = prep_for_fusing()

    load('./mat/Index/INDEX_000001_Conv.mat')

    Date = Data(:,1);

    FileList  = [fullfile('./mat/Index/',  cellstr(ls(['./mat/Index/',  '*CONV*']))); ...
                 fullfile('./mat/ForAdj/', cellstr(ls(['./mat/ForAdj/', 'STOCK*'])))];

    BigData = zeros(size(Data,1), size(Data,2), length(FileList));

end

function gen_list(FileList)

    disp_msg('IN', 'Generating list ...')

    Len = size(FileList, 1);
    BigDataList = cell(Len, 2);

    for i = 1:Len

        [~, FileName, ~] = fileparts(FileList{i});
        C = strsplit(FileName, '_');
        BigDataList{i,1} = C{1};
        BigDataList{i,2} = C{2};

    end

    save('./mat/BigDataList', 'BigDataList')

end