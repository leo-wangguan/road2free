clear

List = {{'002433';'STOCK_002433.mat'};
        {'300003';'STOCK_300003.mat'};
        {'300005';'STOCK_300005.mat'};
        {'300017';'STOCK_300017.mat'}; 
        {'300058';'STOCK_300058.mat'}; 
        {'000001';'INDEX_000001.mat'}; 
        {'399005';'INDEX_399005.mat'}; 
        {'399006';'INDEX_399006.mat'}};

N = 1;

Name = List{N}{1};

load(List{N}{2})

DatePair = [20150101, 20151231];

show_line(Name, Data, DatePair, @get_ma_signal, {10});
