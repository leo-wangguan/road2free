clear

[StockList,StockListFull] = GetStockList_Web;
StockCodeDouble = cell2mat( StockList(:,3) );
save('StockList','StockList');

% AdjFlag 0:��Ȩʱ������ 1:ǰ��Ȩʱ������ 2:��Ȩʱ������
% XRDFlag 0:����ȡ��Ȩ��Ϣ��Ϣ 1:��ȡ��Ȩ��Ϣ��Ϣ
AdjFlag = 0;
XRDFlag = 0;
[SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag);