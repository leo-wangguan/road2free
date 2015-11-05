clear

cd('.\mat')

load('StockList.mat')

Type = 'STOCK';

parfor i = 2410:length(StockList)

    Code = num2str(cell2mat(StockList(i,3)));
    init_data(Type, Code, 20090101)

end

cd('..\')
