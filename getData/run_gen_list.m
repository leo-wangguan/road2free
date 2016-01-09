function run_gen_list()

    cd_to_top_level()

    disp_msg('IN', 'Generating list ...')

    List.File = [fullfile('./mat/Index/', cellstr(ls('./mat/Index/*Raw*'))); ...
                 fullfile('./mat/ExDiv/', cellstr(ls('./mat/ExDiv/STOCK*')))];

    List.Conv = strrep(strrep(List.File, 'Raw', 'Conv'), 'ExDiv', 'ForAdj');

    List.Type = cellfun(@(x) regexp(x, 'INDEX|STOCK', 'match'), List.File);

    List.Code = cellfun(@(x) regexp(x, '\d{6}', 'match'), List.File);

    List.Abbr = cellfun(@(x, y) [x(1), y], List.Type, List.Code, 'uni', false);

    load('./mat/Index/INDEX_000001_Raw.mat')

    List.Date = Data(:,1);

    List.Base = calc_base_line;

    List.FileLen = length(List.File);

    List.DateLen = length(List.Date);

    List.ColLen = 17;

    List.ResLen = 6;

    save('./mat/List', 'List')

end
