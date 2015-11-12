% Note:
% Use this script to initialize all data of stocks from StockInfo.
% Otherwise, it will be overwriiten.

clear

cd_to_top_level()

load('./mat/StockInfo.mat')

parfor i = 1:size(StockInfo, 1)

    Code = num2str(cell2mat(StockInfo(i,3)), '%06d');
    Date = StockInfo{i,4}.IPOdate;

    % File exists, do not overwrite it.
    if exist(['./mat/' 'STOCK_', Code, '_ExDiv.mat'], 'file') ~= 2

        % IPO date not valid, start from the very beginning.
        if length(num2str(Date)) ~= 8

            Date = 19910101;

        end

        disp([Code ' ' num2str(Date)])
        init_data('STOCK', Code, Date)

    end

end

cd_to_top_level()
