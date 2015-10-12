clear

cd('.\mat')

StockList = {'002433'; '300003'; '300005'; '300017'; '300058'};
IndexList = {'000001'; '399005'; '399006'};

for i = 1:length(StockList)

    disp(StockList{i})
    update_data('STOCK', StockList{i});

end

for i = 1:length(IndexList)

    disp(IndexList{i})
    update_data('INDEX', IndexList{i});

end

cd('..\')
