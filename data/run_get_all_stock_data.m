% run it as a script.

function run_get_all_stock_data()

    clear

    cd_to_top_level()

    S1 = load('./mat/StockInfo.mat');
    S2 = load('./mat/StockInfoPatch.mat');
    StockInfo = S1.StockInfo;
    StockInfoPatch = S2.StockInfoPatch;
    
    parfor i = 1:size(StockInfo, 1)

        Code = num2str(cell2mat(StockInfo(i,3)), '%06d');
        Date = patch_date(Code, StockInfo{i,4}.IPOdate, StockInfoPatch);

        % File does not exist, initialize it.
        if exist(['./mat/' 'STOCK_', Code, '_ExDiv.mat'], 'file') ~= 2

            if ~isempty(Date)

                disp_msg('IN', 'Initiating data ...')

                init_data('STOCK', Code, Date)

            else

                disp_msg('IN', 'No IPO date:')
                disp_msg('IN', Code)

            end

        % File exist, update it.
        else

            disp_msg('IN', 'Updating data ...')

            update_data('STOCK', Code)

        end

    end

end

function Date = patch_date(Code, DateTmp, StockInfoPatch)

    [Is, Idx] = ismember(str2double(Code), cell2mat(StockInfoPatch(:,1)));

    if Is

        Date = StockInfoPatch{Idx, 2};

    else

        Date = DateTmp;

    end

end
