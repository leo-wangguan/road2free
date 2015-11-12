clear

cd_to_top_level()

cd('.\mat')

load('StockList.mat')


    disp(StockList{i})
    update_data('STOCK', StockList{i});


cd('..\')
