clear

[StockList,StockListFull] = GetStockList_Web;
StockCodeDouble = cell2mat( StockList(:,3) );
save('StockList','StockList');

% AdjFlag 0:除权时序数据 1:前复权时序数据 2:后复权时序数据
% XRDFlag 0:不获取除权除息信息 1:获取除权除息信息
AdjFlag = 0;
XRDFlag = 0;
[SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag);