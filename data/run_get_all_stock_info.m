% run it as a script.

function run_get_all_stock_info()

    clear

    cd_to_top_level()

    % File exists.
    if exist('./mat/StockInfo.mat', 'file') == 2

        load('./mat/StockInfo.mat')

        ListOld = StockInfo(:,1:3);
        ListNew = GetStockList_Web;

        % List unchanged, do a get loop just in case.
        if isequaln(ListOld, ListNew)

            get_stock_info(StockInfo)

        % List changed, update then get info.
        else

            StockInfo = prep_on_changes(StockInfo, ListOld, ListNew);
            get_stock_info(StockInfo)

        end

    % File does not exist, get list then get info.
    else

        List = GetStockList_Web;
        StockInfo = [List cell(size(List, 1), 1)];
        get_stock_info(StockInfo)

    end

end

function get_stock_info(StockInfo)

    disp_msg('IN', 'Updating stock info ...')

    for i = 1:size(StockInfo, 1);

        % Get info only when no existing info.
        if isempty(StockInfo{i,4})

            Code = num2str(cell2mat(StockInfo(i,3)), '%06d');

            disp_msg('IN', num2str(Code))

            StockInfo{i,4} = GetStockInfo_Web(Code);

            % URL read may get error, save data right away.
            save('./mat/StockInfo.mat', 'StockInfo')

        end

    end

end

function StockInfo = prep_on_changes(StockInfo, ListOld, ListNew)

    Len = size(ListNew, 1);

    % Find indices of old codes w.r.t new list.
    CodesOld = cell2mat(ListOld(:,3));
    CodesNew = cell2mat(ListNew(:,3));
    Idx1 = ismember(CodesNew, CodesOld);

    disp_msg('IN', 'New added stocks:')

    % If codes added.
    if sum(Idx1) < Len

        disp_msg('IN', num2str(CodesNew(~Idx1), '%06d'))

        InfoNew = cell(Len,1);
        InfoNew(Idx1) = StockInfo(:,4);
        StockInfo = [ListNew InfoNew];

    end

    % Find indices of changed names w.r.t new list.
    NamesOld = ListOld(:,1);
    NamesNew = ListNew(:,1);
    Idx2 = xor(Idx1, ismember(NamesNew, NamesOld));

    disp_msg('IN', 'Name changed stocks:')

    % If names changed.
    if sum(Idx2) > 0

        disp_msg('IN', num2str(CodesNew(Idx2), '%06d'))

        StockInfo(:,1:3) = ListNew;
        StockInfo(Idx2,4) = cell(sum(Idx2),1);

    end

end
