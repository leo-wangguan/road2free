%% Main_GetStockDataTest
% by LiYang_faruto
% Email:farutoliyang@foxmail.com
% 2015/05/01
%% A Little Clean Work
tic;
% clear;
% clc;
% close all;
format compact;
%% ��ȡ��Ʊ�����б����

[StockList,StockListFull] = GetStockList_Web;
StockCodeDouble = cell2mat( StockList(:,3) );
save('StockList','StockList');

%% StockList SaveData2File
tic;
Data = StockList;

FileName = 'StockList.csv';
ColNamesCell = {'��Ʊ����','��Ʊ����','��Ʊ���루�����֣�'};
[Status, Message] = SaveData2File(Data, FileName, ColNamesCell);

Data = StockList;

FileName = 'StockList.txt';
ColNamesCell = {'��Ʊ����','��Ʊ����','��Ʊ���루�����֣�'};

[Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
toc;
%% StockList SaveData2File xlsx
tic;
Data = StockList;

FileName = 'StockList.xlsx';
ColNamesCell = {'��Ʊ����','��Ʊ����','��Ʊ���루�����֣�'};
SheetName = '��Ʊ����';
[Status, Message] = SaveData2File(Data, FileName, ColNamesCell,'Sheet',SheetName);

Data = StockList;

FileName = 'StockList.xlsx';
ColNamesCell = {'��Ʊ����','��Ʊ����','��Ʊ���루�����֣�'};
SheetName = '��Ʊ����Test+';
[Status, Message] = SaveData2File(Data, FileName, ColNamesCell,'Sheet',SheetName);
toc;

%% ��ȡָ�������б�

[IndexList] = GetIndexList_Web;

save('IndexList','IndexList');

%% IndexList SaveData2File
tic;
Data = IndexList;

FileName = 'IndexList.csv';
ColNamesCell = {'����','����','���루�����֣�'};

[Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
toc;
%% ָ����������

IndexCode_G = '000001'

str = ['ȫ��ָ������������ϣ�'];
disp(str);
%% ��Ʊ��������
StockCode_G = '000562'

str = ['ȫ�ֹ�Ʊ����������ϣ�'];
disp(str);
%% ��ȡ�б��б� ժҪ GetStockReport_Web
tic;

StockCode = '600588';

BeginDate = '20141001';
EndDate = datestr(today,'yyyymmdd');

[ReportList] = GetStockReport_Web(StockCode, 'BeginDate',BeginDate,'EndDate',EndDate);

toc;
%% ��ȡָ������

StockCode = '000001';
% StockCode = '000300';
% StockCode = '399005';

BeginDate = '20050101';

EndDate = datestr(today,'yyyy-mm-dd');

[Data] = GetIndexTSDay_Web(StockCode,BeginDate,EndDate);
%% GetStockInfo_Web
% ��ȡ��Ʊ������Ϣ�Լ�������ҵ��飨֤�����ҵ���ࣩ�����������飨���˲ƾ����壩

StockCode = '600588';
StockCode = '600000';
StockCode = 'sh600012';
StockCode = 'sz000981';

[StockInfo] = GetStockInfo_Web(StockCode);
%% BaiduSearchAdvancedNews
StockCode = '600588';

BeginDate = '20150101';

EndDate = datestr(today,'yyyy-mm-dd');

StringIncludeAny = [];
[NewsDataCell] = BaiduSearchAdvancedNews(StockCode,StringIncludeAny,BeginDate,EndDate);
%% BaiduSearchAdvancedNews Word Test
StringIncludeAll = 'ϰ��ƽ';

BeginDate = '20141226';

EndDate = datestr(today,'yyyy-mm-dd');

StringIncludeAny = [];
[NewsDataCell] = BaiduSearchAdvancedNews(StringIncludeAll,StringIncludeAny,BeginDate,EndDate);
%% SinaSearchAdvanced
StringIncludeAll = '600588';

BeginDate = '20141201';

EndDate = datestr(today,'yyyy-mm-dd');

[NewsDataCell] = SinaSearchAdvanced(StringIncludeAll,BeginDate,EndDate);
%% GetStockNotice_Web
tic;
StockCode = '600588';

BeginDate = '20141001';

EndDate = datestr(today,'yyyy-mm-dd');

BeginDate = '20141001';
EndDate = '20141231';

[NoticeDataCell] = GetStockNotice_Web(StockCode,BeginDate,EndDate);
toc;
%% GetStockInvestRInfo_Web
tic;

StockCode = '000001';

BeginDate = '20101001';

EndDate = datestr(today,'yyyy-mm-dd');

[IRDataCell] = GetStockInvestRInfo_Web(StockCode,BeginDate,EndDate);
toc;
%% ��ȡ��Ʊĳ�ս�����ϸ

StockCode = 'sh600000';
StockCode = 'sh600588';
StockCode = StockCode_G;

BeginDate = '20141205';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);


StockCode = 'sz002302';
BeginDate = '20150323';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);
%%

StockCode = 'sh510050';
BeginDate = '20150420';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);

%% ��ȡ��Ʊ���ߣ���Ȩ��Ϣ�����ݲ���

StockCode = 'sh600030';
StockCode = 'sh600000';
% StockCode = StockCode_G;

BeginDate = '20050101';
EndDate = '20150101';

[StockDataDouble,adjfactor] = GetStockTSDay_Web(StockCode,BeginDate,EndDate);

%% StockDataDouble SaveData2File
tic;
Data = StockDataDouble;
FileName = 'StockDataTest.csv';
% FileName = [];

ColNamesCell = {'����','��','��','��','��','��','��','��Ȩ����'};
% ColNamesCell = [];

[Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
toc;
%% ��Ʊ���ߣ���Ȩ��Ϣ�� plot
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)*1/4 scrsz(4)*1/6 scrsz(3)*4/5 scrsz(4)]*3/4);

AX1 = subplot(3,1,1:2);
OHLC = StockDataDouble(:,2:5);
KplotNew(OHLC);
Dates = StockDataDouble(:,1);
LabelSet(gca, Dates, [], [], 2);

if StockCode(1,1) == 's'
    StockCode = StockCode(3:end);
end
ind = find( StockCodeDouble == str2double(StockCode) );
str = [StockList{ind,1},'-',StockList{ind,2},'��Ȩ�۸�'];
title(str,'FontWeight','Bold');

AX2 = subplot(3,1,3);
V = StockDataDouble(:,6);
bar(V);
xlim([0,length(V)]);
LabelSet(gca, Dates, [], [], 2);

linkaxes([AX1, AX2], 'x');
%% ��ȡ��Ʊ��Ȩ��Ϣ����
StockCodeInput = '600537';
StockCodeInput = '600001';

StockCodeInput = StockCode_G;

[ Web_XRD_Data , Web_XRD_Cell_1 , Web_XRD_Cell_2 ] = GetStockXRD_Web(StockCodeInput);
Web_XRD_Cell_1;
Web_XRD_Cell_2;

%% ����ǰ��Ȩ��������

StockData = StockDataDouble(:,1:end);
XRD_Data = [];
AdjFlag = 1;
[StockDataXRD, factor] = CalculateStockXRD(StockData, XRD_Data, AdjFlag);

%% ��Ȩ�۸�plot
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)*1/4 scrsz(4)*1/6 scrsz(3)*4/5 scrsz(4)]*3/4);

AX1 = subplot(211);
OHLC = StockDataDouble(:,2:5);
KplotNew(OHLC);
Dates = StockDataDouble(:,1);
LabelSet(gca, Dates, [], [], 1);
ind = find( StockCodeDouble == str2double(StockCode) );
str = [StockList{ind,1},'-',StockList{ind,2},'��Ȩ�۸�'];
title(str,'FontWeight','Bold');

AX2 = subplot(212);
OHLC = StockDataXRD(:,2:5);
KplotNew(OHLC);
Dates = StockDataDouble(:,1);
LabelSet(gca, Dates, [], [], 1);
ind = find( StockCodeDouble == str2double(StockCode) );
str = [StockList{ind,1},'-',StockList{ind,2},'ǰ��Ȩ�۸�'];
title(str,'FontWeight','Bold');

linkaxes([AX1, AX2], 'x');
%% ��ȡ��Ʊ����ָ�����

StockCodeInput = '600588';
StockCodeInput = StockCode_G;

Year = '2014';
[FIndCell,YearList] = GetStockFinIndicators_Web(StockCodeInput,Year);
FIndCell
%% FIndCell SaveData2File
tic;
Data = FIndCell;

FileName = '����ָ��Test.csv';
ColNamesCell = [];

[Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
toc;
%% ��ȡ���ű�

StockCodeInput = '600588';
StockCodeInput = StockCode_G;

Year = '2014';
[BalanceSheet,ProfitSheet,CashFlowSheet,YearList] = GetStock3Sheet_Web(StockCodeInput,Year);
BalanceSheet
ProfitSheet
CashFlowSheet

%% Record Time
toc;
displayEndOfDemoMessage(mfilename);
