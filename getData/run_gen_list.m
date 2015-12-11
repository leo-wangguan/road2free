function run_gen_list()

    cd_to_top_level()

    disp_msg('IN', 'Generating list ...')

    List.File = [fullfile('./mat/Index/', cellstr(ls('./mat/Index/*Raw*'))); ...
                 fullfile('./mat/ExDiv/', cellstr(ls('./mat/ExDiv/STOCK*')))];

    List.Conv = strrep(strrep(List.File, 'Raw', 'Conv'), 'ExDiv', 'ForAdj');

    List.Type = cellfun(@(x) regexp(x, 'INDEX|STOCK', 'match'), List.File, 'uni', false);

    List.Code = cellfun(@(x) regexp(x, '\d{6}', 'match'), List.File, 'uni', false);

    List.Abbr = cellfun(@(x, y) [x{:}(1), y{:}], List.Type, List.Code, 'uni', false);

    load('./mat/Index/INDEX_000001_Raw.mat')

    List.Date = Data(:,1);

    List.FileLen = length(List.File);

    List.DateLen = length(List.Date);

    List.ColLen = 10;   % [Date Open High Low Close Before Vol Amount Factor N]

    List.ResLen = 6;    % [BuySignal SellSignal HoldSignal BuyPrice SellPrice LongRatio]

    save('./mat/List', 'List')

end
