% run it as a script.

function run_get_all_stock_info()

    clear

    cd_to_top_level()

    ListNew = GetStockList_Web;

    % File exists.
    if exist('./mat/StockInfo.mat', 'file') == 2

        load('./mat/StockInfo.mat')

        ListOld = StockInfo(:,1:3);

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

        StockInfo = [ListNew cell(size(ListNew, 1), 1)];

        get_stock_info(StockInfo)

    end

end

function get_stock_info(StockInfo)

    for i = 1:size(StockInfo, 1)

        % Get info only when no existing info.
        if isempty(StockInfo{i,4})

            Code = num2str06d(cell2mat(StockInfo(i,3)));

            disp_msg('IN', ['Updating stock info ', Code, ' ...'])

            StockInfo{i,4} = GetStockInfo_Web(Code);

            % URL read may get error, save data right away.
            save('./mat/StockInfo.mat', 'StockInfo')

        end

    end

end

function StockInfo = prep_on_changes(StockInfo, ListOld, ListNew)

    % Find indices of old codes w.r.t new list.
    Idx1 = ismember(cell2mat(ListNew(:,3)), cell2mat(ListOld(:,3)));

    % If codes added.
    if sum(Idx1) < size(ListNew, 1)

        disp_msg('IN', 'New added stocks:')
        disp_msg('IN', num2str06d(cell2mat(ListNew(~Idx1,3))))

        ListNew(Idx1,4) = StockInfo(:,4);
        StockInfo = ListNew;

    end

    % Find indices of changed names w.r.t new list.
    Idx2 = xor(Idx1, ismember(ListNew(:,1), ListOld(:,1)));

    % If names changed.
    if sum(Idx2) > 0

        disp_msg('IN', 'Name changed stocks:')
        disp_msg('IN', num2str06d(cell2mat(ListNew(Idx2,3))))

        StockInfo(Idx2,1) = ListNew(Idx2,1);
        StockInfo(Idx2,4) = cell(sum(Idx2),1);

    end

end
