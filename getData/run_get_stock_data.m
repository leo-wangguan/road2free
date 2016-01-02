function run_get_stock_data()

    cd_to_top_level()

    [StockInfo, IpoDate] = load_stock_info();

    parfor i = 1:size(StockInfo, 1)

        Code = num2str06d(StockInfo{i,3});
        File = ['./mat/ExDiv/STOCK_', Code, '_ExDiv.mat'];

        % File exist, update it.
        if exist(File, 'file') == 2

            update_data('STOCK', Code, File)

        % File does not exist.
        else

            % Publicly offered, initiate it.
            if ~isempty(IpoDate{i})

                init_data('STOCK', Code, IpoDate{i}, File)

            else

                disp_msg('ER', ['No IPO date: ', Code])

            end

        end

    end

end

function [StockInfo, IpoDate] = load_stock_info()

    load('./mat/StockInfo.mat')
    load('./mat/StockInfoPatch.mat')

    IpoDate = cellfun(@(x) x.IPOdate, StockInfo(:,4), 'uni', false);
    IpoDate(ismember([StockInfo{:,3}], [StockInfoPatch{:,1}])) = StockInfoPatch(:,2);

end
