function run_get_stock_info()

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

            update_stock_info(StockInfo, ListOld, ListNew);

        end

    % File does not exist, do a get loop with empty info column.
    else

        get_stock_info([ListNew cell(size(ListNew, 1), 1)])

    end

end

function get_stock_info(StockInfo)

    for i = 1:size(StockInfo, 1)

        % Get info only when no existing info.
        if isempty(StockInfo{i,4})

            StockInfo{i,4} = GetStockInfo_Web(num2str06d(StockInfo{i,3}));

            % URL read may get error, save data right away.
            save('./mat/StockInfo', 'StockInfo')

        end

    end

end

function update_stock_info(StockInfo, ListOld, ListNew)

    % Find indices of old codes w.r.t new list.
    Idx1 = ismember([ListNew{:,3}]', [ListOld{:,3}]');

    % If codes added.
    if sum(Idx1) < size(ListNew, 1)

        disp_msg('IN', 'New added stocks:')
        disp_msg('IN', num2str06d([ListNew{~Idx1,3}]'))

        ListNew(Idx1,4) = StockInfo(:,4);
        StockInfo = ListNew;

    end

    % Find indices of changed names w.r.t new list.
    Idx2 = xor(Idx1, ismember(ListNew(:,1), ListOld(:,1)));

    % If names changed.
    if sum(Idx2) > 0

        disp_msg('IN', 'Name changed stocks:')
        disp_msg('IN', num2str06d([ListNew{Idx2,3}]'))

        StockInfo(Idx2,1) = ListNew(Idx2,1);
        StockInfo(Idx2,4) = cell(sum(Idx2),1);

    end

    get_stock_info(StockInfo)

end
