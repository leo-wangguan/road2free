% run it as a script.

function run_get_all_stock_data()

    clear

    cd_to_top_level()

    [StockInfo, StockInfoPatch] = load_stock_info();

    parfor i = 1:size(StockInfo, 1)

        Code = num2str06d(cell2mat(StockInfo(i,3)));
        File = ['./mat/ExDiv/STOCK_', Code, '_ExDiv.mat'];

        % File exist, update it.
        if exist(File, 'file') == 2

            update_data('STOCK', Code, File)

        % File does not exist.
        else

            Date = correct_date(StockInfo, StockInfoPatch, i);

            % Publicly offered, initiate it.
            if ~isempty(Date)

                init_data('STOCK', Code, Date, File)

            else

                disp_msg('ER', ['No IPO date: ', Code])

            end

        end

    end

end

function [StockInfo, StockInfoPatch] = load_stock_info()

    load('./mat/StockInfo.mat')
    load('./mat/StockInfoPatch.mat')

end

function Date = correct_date(StockInfo, StockInfoPatch, i)

    [Is, Idx] = ismember(StockInfo{i,3}, cell2mat(StockInfoPatch(:,1)));

    if Is

        Date = StockInfoPatch{Idx,2};

    else

        Date = StockInfo{i,4}.IPOdate;

    end

end
