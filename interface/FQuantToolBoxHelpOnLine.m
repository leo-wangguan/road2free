%% FQuantToolBoxHelpOnLine
% FQuantToolBox: A Data and Backtesting Quant Tool Box based on MATLAB by faruto.
% 
% by LiYang_faruto @ <http://www.matlabsky.com MATLAB������̳> <http://faruto.matlabsky.com FQuantStudio> 
%
% Email:farutoliyang@foxmail.com 
% 
% Version: V1.4
%
% Last Modified 2015.06.01
% 
% History:
% 
% * V1.4-2015.06.01(�·����汾)
% * V1.3-2015.01.24
% * V1.2-2015.01.01
% * V1.1-2014.12.18
% * V1.0-2014.12.12
%
% <html>
% <table border="0" width="600px" id="table1">	
% <tr><td><b><font size="2">��DemoΪFQuantToolBox�ĺ������԰����ĵ�</font></b></td></tr>	
% <tr><td><span class="tip"><font size="2">FQuantToolBox���°����ص�ַ��<a target="_blank" href="http://pan.baidu.com/s/1gdIiccN"><font color="#0000FF">�ٶ�����</font></a></font></span></td></tr>
% <tr><td><span class="tip"><font size="2">FQuantToolBoxʹ�ý���������̳��<a target="_blank" href="http://www.matlabsky.com/forum-112-1.html"><font color="#0000FF">MATLAB������̳</font></a></font></span></td></tr>
% <tr><td><span class="tip"><font size="2">FQuantToolBoxʹ�ý�������QQȺ��QuantGroup1Ⱥ[MATLAB] 279908629</font></span></td></tr> 	
% <tr><td><span class="tip"><font size="2">����faruto����ϵ��ʽ��<a target="_blank" href="http://weibo.com/faruto"><font color="#0000FF">΢��-faruto</font></a>��<a target="_blank" href="http://blog.sina.com.cn/faruto"><font color="#0000FF">����</font></a>��΢�Ź��ں�-FQuantStudio(��ӭɨ���ע)</font></span></td></tr>
% <tr><td><span class="tip"><font size="2"><img src="./FQuantStudioWeChat.jpg" width="90" height="90"></font></span></td></tr>
% <tr><td><span class="tip"><font size="2">�鼮�Ƽ���</font></span></td></tr>
% </table>
% <img src="./QuMBook.jpg" width="300" height="400">
% <img src="./ANN.jpg" width="300" height="400">
% </html>
% 
%% FQuantToolBox����ʲô�õģ�
%   FQuantToolBox��λ�Ǹ����ݺͻز⹤���䣬û��ʵ�̽�����ؽӿڵ�ʵ�֣���δ�����ų�������ع��ܣ���
% 
%   ���ݷ��棬FQuantToolBox���ݻ�ȡ������ȫ����������������Դ����ҪΪ���˲ƾ����Ż��ƾ��Ƚ�����վ�����������Ի�����ʷ���ݣ�Ҳ���Խ��ж�̬���£�
% ����ʵ�ֵ����ݻ�ȡΪA���г���ȫ����Ʊ���ƺͶ�Ӧ���루���������й�Ʊ����A���г��Ĺ�Ʊ���߳�Ȩ�����Լ���Ȩ���ӡ�A���г��Ĺ�Ʊ�ĳ�Ȩ��Ϣ��Ϣ��
% A���г��Ĺ�Ʊÿ�ս�����ϸ���ݣ�Tick���ݣ���A���г��ĵĹ�Ʊ����ָ�����ݡ�A���г��Ĺ�Ʊ�����ű��ʲ���ծ���ֽ���������������ݣ�
% δ�����ݷ�������Ӹ�������ݣ������ڻ������Լ��������ڱ�ĵ����ݣ������˼�뻹����ȫ���������ȡ�͸��£���ȫ��ѡ�
% 
%   ������������ݻ�ȡ��ʵ�ַ�ʽ������̾�������������ַѰ�ҡ���> ��ַ��������> urlread+������ʽ ������ȡ�������������ݵ�ץȡ��������ʽ��һ���������ģ�
% MATLAB������Ӧ��������ʽ�������й�������ʽ�Ķ������ﲻ��չ������λ������Ҫ������Щ���Σ�FQuantToolBox�������Doc�ļ������и��������������
% ��MATALB������ʽ������𲽽̳�.doc���ĵ������԰�����ѧϰ������ʽ��صĶ�����
% 
%   �زⷽ�棬FQuantToolBox�����䵱���ṩ��һ������ι�������MATLAB�Ļز�ϵͳ����demo�������˲������������ҳ���ġ�����Ͷ�ʣ���MATLABΪ���ߡ�������½ڣ�
% δ���زⷽ����������ĸ��������Ͳ����������ʹ��MATLAB���й�Ʊ�Լ��ڻ���ز��ԵĻز⡣
% 
%   δ��FQuantToolBox������ÿ�η��������ṩ�����汾������ʷ���ݰ汾������ʷ���ݰ汾������ʷ���ݰ汾���ṩ��غ�������������Լ�����������ؽű���������ȡ��ʷ���ݣ�
% ����ʷ���ݰ汾�����ṩ��غ��������ṩ�Ѿ���ȡ�õ���ʷ���ݣ�A���г�ȫ����Ʊ��Ʊ���ƺʹ��롢�������ݡ�ÿ�ս�����ϸ���ݡ���Ȩ��Ϣ��Ϣ������ָ�����ݡ����ű����ݣ���
% ��ʡ����ȡ��ʷ���ݵ�ʱ�䣬����Ӧ�������ļ�Ҳ��Ƚϴ������Ʊÿ�ս�����ϸ���ݣ����µ����ݸ���ֻ��������Ӧ�ű������Ϳ��Խ���ȫ�г��������ݵĸ��¡�
%% ��������-ȫ�г����״���Ͷ�Ӧ���ƣ���Ʊ��ָ����

% ��ȡA���г���ȫ����Ʊ���ƺͶ�Ӧ���루���������й�Ʊ��
% �������ƣ�GetStockList_Web.m
% �������ã���ȡA���г���ȫ����Ʊ���ƺͶ�Ӧ���루���������й�Ʊ��
% ���������[StockList,StockListFull] = GetStockList_Web
% ����˵������http://quote.eastmoney.com/stocklist.htmlץȡ���µĹ�Ʊ���ƺʹ����б����ص�StockListΪ��Ʊ���ƺͶ�Ӧ�Ĵ���
% ����������
% [StockList,StockListFull] = GetStockList_Web;
% StockCodeDouble = cell2mat( StockList(:,3) );
% save('StockList','StockList');
% ���н����StockList����
%%
% 
% <<F01.png>>
% 

% ��ȡ�Ϻ�֤ȯ������������֤ȯ���������ָ������������б�
% �������ƣ�GetIndexList_Web
% �������ã���ȡ�Ϻ�֤ȯ������������֤ȯ���������ָ������������б�
% ���������[IndexList] = GetIndexList_Web
% ����˵���������������ץȡ������ݡ�
% ����������
% [IndexList] = GetIndexList_Web;
% save('IndexList','IndexList'); 
% ���н����IndexList����
%%
% 
% <<F02.png>>
% 
%% ��������-��������ָ���ɷֹɼ�Ȩ��

% ��װ��һ����ȡ��������ָ���ɷֹɼ�Ȩ�ص���
% ������fGetIndex();
% ���ԣ�Code:����ȡ�ɷֹɵ�ָ�����루Ĭ��Ϊ'000300'��; isSave:��ȡ�ɷֹɺ��Ƿ񱣴�������Excel�ļ���1-���棬0-�����棩��Ĭ��Ϊ1��
% ������[OutputData,dStr] = GetCons()
%  ���OutputDataΪָ���ĳɷֹɼ�Ȩ�أ�cell�����ݣ���dStrΪ����Դ���µ����ʱ�䣨char�����ݣ�

% ����������
% ��ȡ����300ָ���ɷֹ�
tic;
GetIndex = fGetIndex();

GetIndex.isSave = 1;
GetIndex.Code = '000300';

[OutputData,dStr] = GetIndex.GetCons();
dStr

tic;

% ���н����OutputData����
%%
% 
% <<1gc.jpg>>
% 

% ��ȡ��ҵ��ָ�ɷֹ�
tic;
GetIndex = fGetIndex();

GetIndex.isSave = 1;
GetIndex.Code = '399006';

[OutputData,dStr] = GetIndex.GetCons();
dStr

tic;

% ���н����OutputData����
%%
% 
% <<2gc.jpg>>
% 

% ��ȡ������i100ָ��ָ�ɷֹ�
tic;
GetIndex = fGetIndex();

GetIndex.isSave = 1;
GetIndex.Code = '399415';

[OutputData,dStr] = GetIndex.GetCons();
dStr

tic;

% ���н����OutputData����
%%
% 
% <<3gc.jpg>>
% 

% Ĭ�ϻᱣ���ȡ��������IndexCons�ļ�����
%%
% 
% <<4gc.jpg>>
% 

%% ��ʷ����-��Ʊÿ�ս�����ϸ����

% ȡ��ֻ��Ʊĳ�ս�����ϸ����
% �������ƣ�GetStockTick_Web.m
% �������ã���ȡ��ֻ��Ʊĳ�ս�����ϸ����
% ���������[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate,SaveFlag)����˵������
% http://vip.stock.finance.sina.com.cn/quotes_service/view/vMS_tradehistory.php?symbol=sz000562&date=2014-12-05
% ץȡ��ֻ��Ʊĳ�ս�����ϸ���ݣ����ص�StockTickΪ��Ʊ������ϸ���ݣ�ÿ�еĺ���Ϊ��
% �ɽ�ʱ�� �ɽ��� �۸�䶯 �ɽ���(��) �ɽ���(Ԫ) ���ʣ����̣�1�����̣�-1�������̣�0��
% ����������
% StockCode = '000562';
% BeginDate = '20141205';
% [StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);
% ���н����StockTick����
%%
% 
% <<F03.png>>
% 

% ������ȡ��Ʊÿ�ս�����ϸ���ݲ�����������.mat����
% �������ƣ�SaveStockTick.m
% �������ã�������ȡ��Ʊÿ�ս�����ϸ���ݲ�����������.mat����
% ���������[SaveLog,ProbList,NewList] = SaveStockTick(StockList,DateList,PList,CheckFlag)
% ����˵��������GetStockTick_Web������������ȡStockList��DateListָ���Ĵ����б������б�Ľ�����ϸ���ݲ��������������µ�DataBase\Stock\Tick_mat�ļ����ڣ�
% �״λ�ȡȫ�г����еĹ�Ʊ���ݻ�ǳ���ʱ�����Ѿ�����ʷ���ݣ�����SaveStockTick����б������ݵĸ��������½��������ݡ�
% ����������
% %% ��ȡ��Ʊ�����б����
% [StockList,StockListFull] = GetStockList_Web;
% StockCodeDouble = cell2mat( StockList(:,3) );
% save('StockList','StockList');
% %% ��ȡ������ϸ����Tick-�޲��в���
% [SaveLog,ProbList,NewList] = SaveStockTick(StockList);
% ���н����
% �״����к�ͻ��ڱ���DataBase\Stock\Tick_mat����ȫ��A���г��Ľ�����ϸ���ݣ�ÿ����Ʊһ���ļ��С�
%%
% 
% <<F04.png>>
% 
%% ��ʷ����-��Ʊ���߳�Ȩ�����Լ���Ȩ����

% ��ȡ��ֻ��Ʊ����������
% �������ƣ�GetStockTSDay_Web.m
% �������ã���ȡ��ֻ��Ʊ���������ݳ�Ȩ�����Լ���Ȩ���ӣ����������й�Ʊ��
% ���������[StockDataDouble,adjfactor] = GetStockTSDay_Web(StockCode,BeginDate,EndDate)
% ����˵������
% http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_FuQuanMarketHistory/stockid/000562.phtml?year=2014&jidu=4
% ץȡ��Ӧ��Ʊ�ĺ�Ȩ���ݺ͸�Ȩ���ӣ�Ȼ����������µĳ�Ȩ�۸�
% ���ص�StockDataDoubleΪ��Ʊ��Ȩ����������ݣ���ÿ�еĺ���Ϊ��
% ���� �� �� �� �� ��(��) ��(Ԫ) ��Ȩ����
% ����������
% StockCode = '600318';
% BeginDate = '20150101';
% EndDate = datestr(today,'yyyymmdd');
% [StockDataDouble,adjfactor] = GetStockTSDay_Web(StockCode,BeginDate,EndDate);
% ���н����StockDataDouble����
%%
% 
% <<F05.png>>
% 

% ������ȡ��Ʊ��Ȩ�������ݲ�����������.mat����
% �������ƣ�SaveStockTSDay.m
% �������ã�������ȡ��Ʊ��Ȩ�������ݲ�����������.mat���ݣ����������й�Ʊ��
% ���������[SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag)
% ����˵��������GetStockTSDay_Web������������ȡStockListָ���Ĵ����б���������ݲ��������������µ�DataBase\Stock\Day_ExDividend_mat�ļ����ڣ��״λ�ȡȫ�г����еĹ�Ʊ���ݻ�ȽϷ�ʱ�����Ѿ�����ʷ���ݣ�����SaveStockTSDay����б������ݵĸ��������½��������ݡ�
% ����������
% %% ��ȡ��Ʊ�����б����
% [StockList,StockListFull] = GetStockList_Web;
% StockCodeDouble = cell2mat( StockList(:,3) );
% save('StockList','StockList');
% %% ��Ʊ���ݸ���-��Ȩ��Ϣ����-�޲��в���
% AdjFlag = 0;% AdjFlag 0:��Ȩʱ������ 1:ǰ��Ȩʱ������ 2:��Ȩʱ������
% XRDFlag = 0;
% [SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag);
% ���н����
% �״����к�ͻ��ڱ���DataBase\Stock\Day_ExDividend_mat����ȫ��A���г��ĳ�Ȩ���ݣ�
%%
% 
% <<F06.png>>
% 
%% ��ʷ����-��Ʊǰ��Ȩ�������ɣ���Ȩ������
% CalculateStockXRD.m�ɳ�Ȩ��������ǰ��Ȩ����
% 
% ����Ҫ˵������һ���Ʊ�Ļز⣬֮����Ҫ���������ǰ��Ȩ���ݣ�����Ϊ�ڹ�Ʊ�Ļز��У�����һ���ʹ��ǰ��Ȩ�����ݽ��лز⣬���ǳ�Ȩ������ݣ�
% 
% ��Ϊ��Ȩ����������ڷֺ���ɵ�Ӱ��������ȱ�ڲ�����������Ӱ����Ӧָ��ļ��㡣
% 
% ����������

% % % ��ȡ��Ʊ���ߣ���Ȩ��Ϣ�����ݲ���
% StockCode = '600690';
% BeginDate = '20100101';
% EndDate = '20130101';
% 
% [StockDataDouble,adjfactor] = GetStockTSDay_Web(StockCode,BeginDate,EndDate);
% % % ����ǰ��Ȩ��������
% StockData = StockDataDouble(:,1:end);
% XRD_Data = [];
% AdjFlag = 1;
% [StockDataXRD, factor] = CalculateStockXRD(StockData, XRD_Data, AdjFlag);
% % % ��Ȩ�۸�plot
% scrsz = get(0,'ScreenSize');
% figure('Position',[scrsz(3)*1/4 scrsz(4)*1/6 scrsz(3)*4/5 scrsz(4)]*3/4);
% 
% AX1 = subplot(211);
% OHLC = StockDataDouble(:,2:5);
% KplotNew(OHLC);
% Dates = StockDataDouble(:,1);
% LabelSet(gca, Dates, [], [], 1);
% str = [StockCode,'��Ȩ�۸�'];
% title(str,'FontWeight','Bold');
% 
% AX2 = subplot(212);
% OHLC = StockDataXRD(:,2:5);
% KplotNew(OHLC);
% Dates = StockDataDouble(:,1);
% LabelSet(gca, Dates, [], [], 1);
% ind = find( StockCodeDouble == str2double(StockCode) );
% str = [StockCode,'ǰ��Ȩ�۸�'];
% title(str,'FontWeight','Bold');
% 
% linkaxes([AX1, AX2], 'x');

% ���н����
%%
% 
% <<F07.png>>
% 

%% ��ʷ����-����Ƶ��ת��[�ز���]ͨ�ú���
%%
% <http://mp.weixin.qq.com/s?__biz=MzA5NzEzNDk4Mw==&mid=208012334&idx=1&sn=b350f584891b99c60093265422211fa5&3rd=MzA3MDU4NTYzMw==&scene=6#rd ������ϸ������������>

% ��������Ƶ��ת��[�ز���]ͨ�ú���
% ��:DataResampleClass
% ���ͨ�ú����ҷ�װ����һ���ࣨDataResampleClass����������Ϊ�����Ĳ������ã�������������ز��������ã��������£�
% classdef DataResampleClass < handle
%   %% DataResampleClass
%    %by LiYang_faruto
%    %Email:farutoliyang@foxmail.com
%    %2015/6/1
%   %% properties
%   properties
%       % % ����������������ѡ�����
%       % 'DownSampling' 'UpSampling'
%       DownUpSampling = 'DownSampling';
%       % % ����Ƶ�����ò���
%       % 'Nmin' 'Nhour' 'Nday' 'Nsecond' 'Nmillisecond'
%       % 'Nweek' 'Nmonth' 'Nquarter' 'Nyear' ...
%       Fre = '1min';
%       % % �����г��������ò�������ͬ�г�����ʱ�䲻ͬ��
%       % 'SHSZ' 'CFFEX' ...
%       Market = 'SHSZ';
%       % % ���ڲ�������ֵ�ķ���
%       % 'OHLC2OHLC' 'OHLCVA2OHLCVA'
%       % 'OHLCVA' 'OHLC'
%       % 'first' 'last' 'median' 'max' 'min' 'sum' 'prod'
%       HowMethod = 'OHLCVA';
%       % % ����ȱʧʱ�Ĳ�ֵ�����Լ�������ʱ�Ĳ�ֵ����ѡ��
%       % 'ffill' 'bfill' 'nan'
%       FillMethod = 'ffill';
%       % % �ڽ������У���ʱ��ε���һ���Ǳպϣ�����������
%       % 'right' 'left'
%       Closed = 'right';
%       % % �ڽ������У�������ò�����ı�ǩ��
%       % ���� 9:30��9:35֮�����5���ӻᱻ���Ϊ9:30('left')��9:35('right')
%       % 'right' 'left'
%       Label = 'right';
%       % % �������ݵ�ʱ��������ݸ�ʽ
%       % Datenum: MATALB��datenum��ʽ��
%       % DateNumber = datenum(2015,5,13,9,30,33)
%       % datestr(DateNumber) = '13-May-2015 09:30:33'
%       % PureDouble: ����201505130930.33
%       % 'Datenum' 'PureDouble'
%       DateFormatInput = 'PureDouble';
%       % % �������ݵ�ʱ��������ݸ�ʽѡ��
%       % 'Datenum' 'PureDouble'
%       DateFormatOutput = 'PureDouble';
%      
%       % 1 0 Resample���Ƿ���ͼ
%       isPlot = 0;
%       % For LabelSet����
%       LabelSetStyle = 0;
%       XTRot = 55;
%   end
%   %% properties(Access = protected)
%   properties(SetAccess = private, GetAccess = public)
%      
%       DownUpSampling_ParaList = {'DownSampling';'UpSampling';};
%       Fre_ParaList = {'Nmin(s)';'Nhour(s)';'Nday(s)';'Nweek(s)';...
%           'Nmonth(s);Nquarter(s);Nyear(s);[�������ַ����벻���붼��]'};
%       Market_ParaList = {'SHSZ'};
%       HowMethod_ParaList = {'OHLC2OHLC';'OHLCVA2OHLCVA'; ...
%           'OHLCVA';'OHLC'; ...
%           'first';'last';'median';'max';'min';'sum';'prod'};
%      
%       FillMethod_ParaList = {'ffill';'bfill';'nan'};
%       Closed_ParaList = {'right';'left'};
%       Label_ParaList = {'right';'left'};
%       DateFormat_ParaList = {'Datenum';'PureDouble'};
%      
% End
% 
% �� ��
% �� ��
% 
% end


% �����������Ƶ��ת��[�ز���]ͨ�ú�������ʵ�ֵĹ������£�
% ֧��֤ȯ����������֤������֤�������ڻ����������н���������������������֣��������������Ƶ��ת����
% ֧�ֽ�������downsampling����i.e��Ƶ������ת��Ϊ��Ƶ�����ݣ�tick����ת��Ϊ�뼶�����ݣ�����ʱ����Ƭ����tick����ת��Ϊ���Ӽ������ݣ�����ʱ����Ƭ����
% tick����ת��Ϊ����������ͼ�������ݣ���������ת��Ϊ����������ͼ�������ݣ�NСʱ�ߡ�N���ߵȵȣ�����������ת��Ϊ����������ͼ�������ݣ�N���ߡ�N���ߡ�N���ߡ�N���ߵȵȣ�;
% ֧����������upsampling����i.e��Ƶ������ͨ����ֵת����Ƶ�����ݡ�
% ����������
% % Get Tick Data Using FQuantToolBox
StockCode = 'sz002269';

BeginDate = '20150504';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);
D1 = StockTick; 

BeginDate = '20150505';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);
D2 = StockTick;

BeginDate = '20150506';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);
D3 = StockTick;

BeginDate = '20150507';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);
D4 = StockTick;

BeginDate = '20150508';
[StockTick,Header,StatusStr] = GetStockTick_Web(StockCode,BeginDate);
D5 = StockTick;

D = [D1;D2;D3;D4;D5];

% load ResampleTestData.mat
% % DataResampleClass ��ʼ��
DResample = DataResampleClass();
% % ��������
        % 'DownSampling' 'UpSampling'
        DResample.DownUpSampling = 'DownSampling';
        % '1min' '5min' ...
        DResample.Fre = '1min';
        % 'SHSZ' 'CFFEX' ...
        DResample.Market = 'SHSZ';
        % 'OHLC2OHLC' 'OHLCVA2OHLCVA'
        % 'OHLCVA' 'OHLC'
        % 'first' 'last' 'median' 'max' 'min' 'sum' 'prod'
        DResample.HowMethod = 'OHLCVA';
        
        % 'ffill' 'bfill' 'nan'
        DResample.FillMethod = 'ffill';
        % 'right' 'left'
        DResample.Closed = 'right';
        % 'right' 'left'
        DResample.Label = 'right';
        % 'Datenum' 'PureDouble'
        DResample.DateFormatInput = 'PureDouble';
        % 'Datenum' 'PureDouble'
        DResample.DateFormatOutput = 'PureDouble';
        
        % 1 0 Resample���Ƿ���ͼ
        DResample.isPlot = 1;
        % For LabelSet����
        DResample.LabelSetStyle = 0;
        DResample.XTRot = 55;
% % OneDay tick2min
DResample.Fre = '1min';
DResample.HowMethod = 'OHLCVA';  

InputData1 = D1(:,[1 2 4 5]);

OutputData1 = DResample.Resample(InputData1);
% % OneDay 1minTo5min
DResample.Fre = '5min';
DResample.HowMethod = 'OHLCVA2OHLCVA';

OutputData3 = DResample.Resample(OutputData1);

% % OneDay tick2min

DResample.Fre = '5min';
DResample.HowMethod = 'OHLCVA';  

InputData1 = D1(:,[1 2 4 5]);

OutputData1 = DResample.Resample(InputData1);
% % OneDay tick2day
DResample.Fre = '1day';
DResample.HowMethod = 'OHLCVA';  

InputData1 = D1(:,[1 2 4 5]);

OutputData1 = DResample.Resample(InputData1);

% % MultiDay tick2min

DResample.Fre = '1min';
DResample.HowMethod = 'OHLCVA';  

InputData2 = D(:,[1 2 4 5]);

OutputData2 = DResample.Resample(InputData2);
% % MultiDay 1minTo5min
DResample.Fre = '5min';
DResample.HowMethod = 'OHLCVA2OHLCVA';
OutputData4 = DResample.Resample(OutputData2);
% % MultiDay tick2day
DResample.Fre = '1day';
DResample.HowMethod = 'OHLCVA';  

InputData1 = D(:,[1 2 4 5]);

OutputData1 = DResample.Resample(InputData1);
% % Get Index Data Using FQuantToolBox

StockCode = '000001';
% StockCode = '000300';

BeginDate = '20100101';

EndDate = datestr(today,'yyyy-mm-dd');

[Data] = GetIndexTSDay_Web(StockCode,BeginDate,EndDate);

DateTemp = Data(:,1)*1e4+1500*ones(length(Data),1);
InputData =[DateTemp,Data(:,2:end)]; 

% % dayToday

DResample.Fre = '3day';
DResample.HowMethod = 'OHLCVA2OHLCVA';  

OutputData1 = DResample.Resample(InputData);

% % dayToweek

DResample.Fre = '1week';
DResample.HowMethod = 'OHLCVA2OHLCVA';  

OutputData1 = DResample.Resample(InputData);
% % dayTomonth

DResample.Fre = '1month';
DResample.HowMethod = 'OHLCVA2OHLCVA';  

OutputData1 = DResample.Resample(InputData);
% % dayToquarter

DResample.Fre = '1quarter';
DResample.HowMethod = 'OHLCVA2OHLCVA';  

OutputData1 = DResample.Resample(InputData);
% % dayToyear

DResample.Fre = '1year';
DResample.HowMethod = 'OHLCVA2OHLCVA';  

OutputData1 = DResample.Resample(InputData);
%% ��ʷ����-���������ָ����������

% �������ƣ�GetIndexTSDay_Web
% �������ã���ȡ�Ϻ�֤ȯ������������֤ȯ���������ָ����������
% ���������[Data] = GetIndexTSDay_Web(StockCode,BeginDate,EndDate )
% ����˵���������������ץȡ������ݡ�
% ����������
% %% ��ȡָ������
% StockCode = '000001';
% StockCode = '000300';
% BeginDate = '20140101';
% EndDate = datestr(today,'yyyy-mm-dd');
% 
% [Data] = GetIndexTSDay_Web(StockCode,BeginDate,EndDate);

% ���н����
% ���к󷵻ص�DataΪStockCodeָ����ָ�����������ݣ�̧ͷΪ���ڡ������ߡ��͡��ա���������£�
%%
% 
% <<sF01.png>>
% 

% ��Ӧ���������ݻ�ȡ�ͱ��溯��Ϊ
% [SaveLog,ProbList,NewList] = SaveIndexTSDay(IndexList)
% �״����к�ͻ��ڱ���DataBase\Stock\Index_Day_mat����ȫ���Ϻ�֤ȯ������������֤ȯ���������ָ���������ݣ����£�
%%
% 
% <<sF02.png>>
% 
%% ��ʷ����-��ȡ�������ݣ���ʷ��ֵ������ſ����깺��ء�ʮ������ˣ�

% ������fGetFund
% ���ԣ�
% Code ���ݴ��룬Ĭ��Ϊ'510050'
% StartDate ��ʼ����(����'20150101')���������Ϊ'All'�����ȡȫ������
% EndDatae ��ֹ����(����'20150501')���������Ϊ'All'�����ȡȫ������
% isSave �Ƿ񱣴��ȡ������������

% ������
% GetNetValue ��ȡ��λ��ֵ���ۼƾ�ֵ
% GetFundShareChg ��ȡ�깺�������
% GetFundProfile ��ȡ����ſ�
% GetFundHolder ��ȡ����ʮ�����������

% ����������
%% ��ʷ����-��ȡ��������-��ʷ��ֵ

GetFund = fGetFund();

GetFund.Code = '510050';
GetFund.StartDate = '20150101';
GetFund.EndDate = datestr(today,'yyyymmdd');
GetFund.isSave = 1;

tic;
[OutputData,Headers] = GetFund.GetNetValue();
toc;

format longG
Headers
OutputData(1:5,:)
disp('... ...');
OutputData(end-5:end,:)

%% ��ʷ����-��ȡ��������-����ſ�

GetFund = fGetFund();

GetFund.Code = '510050';
GetFund.StartDate = '20150101';
GetFund.EndDate = datestr(today,'yyyymmdd');
GetFund.isSave = 1;

tic;
[OutputData] = GetFund.GetFundProfile();
toc;

OutputData

%% ��ʷ����-��ȡ��������-�깺���

GetFund = fGetFund();

GetFund.Code = '510050';
GetFund.StartDate = 'All';
GetFund.EndDate = datestr(today,'yyyymmdd');
GetFund.isSave = 1;

tic;
[OutputData,Headers] = GetFund.GetFundShareChg();
toc;

format longG
Headers
OutputData(1:5,:)
disp('... ...');
OutputData(end-5:end,:)

%% ��ʷ����-��ȡ��������-ʮ�������

GetFund = fGetFund();

GetFund.Code = '510050';
GetFund.StartDate = 'All';
GetFund.EndDate = datestr(today,'yyyymmdd');
GetFund.isSave = 1;

tic;
[OutputData,Headers] = GetFund.GetFundHolder();
toc;

OutputData

OutputData{2,1}
tData = OutputData{2,2};
for i = 1:length(tData)
   str = [tData{i,1},' ',num2str(tData{i,2}),' ',num2str(tData{i,3})];
   disp(str);
end

%% ��ʷ����-�ڻ���Լ��������

% �������ƣ�GetFutureDay_Web
% �������ã���ȡĳ���ڻ���Լ��������
% ���������
% [DataCell,StatusOut] = GetFutureDay_Web(DateStr, MarketCode,FuturesCode)
% ����˵�����Ӹ��ڻ��������������н���
% http://www.cffex.com.cn/fzjy/mrhq/
% ��ȡĳ�����ڻ���Լ�������ݡ�
% DateStrΪ��������ڣ�����DateStr = '20141215';
% MarketCodeΪ���������룬����MarketCode = 'CFFEX';��SHFE��DCE��CZCE��
% FuturesCodeΪ�ڻ�Ʒ�ִ��룬����FuturesCode = 'IF';
% 
% DataCellΪ���ص�����
% ����������
% %% ��ȡ�ڻ�ĳ������ĳ������-�н���-IF
% DateStr = '20141216';
% MarketCode = 'CFFEX';
% FuturesCode = 'IF';
% [DataCell,StatusOut] = GetFutureDay_Web(DateStr, MarketCode,FuturesCode);
% ���н����
% DataCell���ص��յ�IF�����к�Լ�������ݣ�����
%%
% 
% <<F08.png>>
% 

% ��Ӧ���������ݻ�ȡ�ͱ��溯��Ϊ
% [SaveLog,ProbList,NewList] = SaveFuturesDay(MarketCode,FutureCode,DateList)�״����к�ͻ��ڱ���DataBase\Futures�µ���Ӧ��Լ�����µ��ļ��У�
% ����DataBase\Futures\IF\Day_mat ����һ��IF_Day.mat�ļ�������IF���������������к�Լ���������ݣ����£�
%%
% 
% <<F09.png>>
% 

% ��Ӧ�ĵ���һ����Լ���������ݣ���һ����ȡ�ٴ����ɣ�Ȼ������ٽ�������������Լ��������������Լ�����ɵ�һϵ�е��ڻ��������ݵ����ɺ���ϴ��
%% ��ʷ����-�ڻ���Լÿ�ս����Ա�ɽ��ֲ���������

% �������ƣ�GetFutureVolOIRanking_Web.m
% �������ã���ȡ�ڻ���Լÿ�ս����Ա�ɽ��ֲ���������
% ���������[DataCell,StatusOut] = GetFutureVolOIRanking_Web(DateStr, FutureCode)
% ����˵�����Ӹ��ڻ��������������н���
% http://www.cffex.com.cn/fzjy/ccpm/
% ��ȡ�ڻ���Լÿ�ս����Ա�ɽ��ֲ��������ݡ�
% ����������
% %% ��ȡ�ڻ������Ա�ɽ��ֲ���������-IF
% tic
% DateStr = '20141216';
% Futurecode = 'if';
% [DataCell,StatusOut] = GetFutureVolOIRanking_Web(DateStr, Futurecode);
% toc
% ���н����
% ���к�DataCell���ص������Ʒ�ָ�����Լ�Ľ����Ա�ɽ��ֲ����������£�
%%
% 
% <<F10.png>>
% 
%%
% 
% <<F11.png>>
% 

% ��Ӧ���������ݻ�ȡ�ͱ��溯��Ϊ
% [SaveLog,DateListOut,ProbList,NewList] 
% = SaveFuturesVolOIRankingData(FutureCode,DateList,UpdateFlag)
% �״����к�ͻ��ڱ���DataBase\Futures�µ���Ӧ��Լ�����µ��ļ��У�����DataBase\Futures\IF\VolOIRanking 
% ����һ��IF���������������к�Լ�Ľ����Ա��ÿ�ճɽ��ֲ��������ݣ����£�
%%
% 
% <<F13.png>>
% 

% ���ڲ��Կ���������ⲿ�����ݣ��ڻ���Լÿ�ս����Ա�ɽ��ֲ��������ݣ������˵һ�㣬�����ⲿ�����ݿ��������黹��ͦ��ģ��Ƚ�������ռ䡣ʹ���ⲿ�����ݣ�
% ���Թ���ĳ�������ϵ�Ͷ��������ָ�꣬һ����Թ��쿪��CTA����ԣ�IF���ԣ����������������������HS300����ʱ���ԡ�
% �����ⲿ�����ݿ�����IF���ԣ�������ͨ��ʹ�ü��������Ĳ������칹�ԣ���������CTA����ϲ��Ե��칹�ԣ�ƽ�������ʽ�����
% ��ͼ������ǰ�����Ļ����ⲿ�����ݹ�����IF���Ե�һ��Demo:
%%
% 
% <<F14.png>>
% 

% �����ⲿ�����ݿ���HS300��ʱ���Ե�ǰ������ǣ��ڻ���Լÿ�ս����Ա�ɽ��ֲ��������ݴ���ĳЩ��������δ��IF���Ƶ�ĳЩԤ����Ϣ������ĳ�̶ֳ���Ӱ��HS300��
% Ҳ����һ�����¿����ġ��ڴ˲�������չ����
%% ʵʱ����-��ȡʵʱ�ֱ�����-������ݣ���Ʊ��ָ��������ETF���ּ�����ȣ����ڻ�
% ���Ի�ȡ�����������й�Ʊ������ָ�������л��𣨰���ETF���ּ�����ȣ����ڻ����Ĵ��ڻ�������������Ʒ�ֵ�ʵʱ����
%
% ֧�ֶ�Tickerͬʱ��ȡ
%
% ������fGetRTQuotes();
%
% ���ԣ�Code:����ȡʵʱ���ݵĴ���
%
% ������DataCell_Output = GetRTQuotes()

% % % ����������
%% ʵʱ����-��Ʒ��-��Ʊʵʱ����
GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = '600036'
DataRT = GetRTQuotes.GetRTQuotes()

%% ʵʱ����-��Ʒ��-ָ��ʵʱ����
GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = 'SH000300'
DataRT = GetRTQuotes.GetRTQuotes()

GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = 'sz399415'
DataRT = GetRTQuotes.GetRTQuotes()

%% ʵʱ����-��Ʒ��-ETFʵʱ����
GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = '510050'
DataRT = GetRTQuotes.GetRTQuotes()

%% ʵʱ����-��Ʒ��-�ּ�����ʵʱ����
GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = '150197'
DataRT = GetRTQuotes.GetRTQuotes()

%% ʵʱ����-��Ʒ��-�ڻ�Ʒ��ʵʱ����
GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = 'M0'
DataRT = GetRTQuotes.GetRTQuotes()

GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = 'RB1510'
DataRT = GetRTQuotes.GetRTQuotes()

GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = 'IF1506'
DataRT = GetRTQuotes.GetRTQuotes()

%% ʵʱ����-��Ʒ��-ʵʱ����
GetRTQuotes = fGetRTQuotes();
GetRTQuotes.Code = {'600036';'M0';'IF1506';'150197';'TA0';'RB0';'510050'}
DataRT = GetRTQuotes.GetRTQuotes()


%% ����������-��Ʊ���ɹ�˾������Ϣ��֤�����ࡢ�����������

% �������ƣ�GetStockInfo_Web
% �������ã���ȡA���г���ȫ����Ʊ���ɹ�˾������Ϣ��֤�����ࡢ����������ࣨ���������й�Ʊ��
% ���������[StockInfo] = GetStockInfo_Web(StockCode)
% ����˵������
% ��˾��飺http://vip.stock.finance.sina.com.cn/corp/go.php/vCI_CorpInfo/stockid/600588.phtml
% �����Ϣ��
% http://vip.stock.finance.sina.com.cn/corp/go.php/vCI_CorpOtherInfo/stockid/600588/menu_num/2.phtml
% ץȡ���ɹ�˾������Ϣ��֤�����ࡢ����������࣬���ص�StockInfoΪһ���ṹ�壬�洢�����Ϣ��
% ����������
% %% GetStockInfo_Web
% % ��ȡ��Ʊ������Ϣ�Լ�������ҵ��飨֤�����ҵ���ࣩ�����������飨���˲ƾ����壩
% StockCode = '600588';
% [StockInfo] = GetStockInfo_Web(StockCode);
% ���н����
% ���к󷵻ص�StockInfoΪһ���ṹ�壬������Ϣ���£�
%%
% 
% <<F15.png>>
% 

% ����StockInfo.CompanyIntro�д��ڹ�˾�Ļ������ܣ����£�
%%
% 
% <<F16.png>>
% 

% StockInfo.IPOdate��StockInfo.IPOprice����ȡ�������������ںͷ��м۸���Ϣ����Ҳ���԰����Լ�����Ҫ��StockInfo.CompanyIntro������ȡ��
% StockInfo.IndustrySector��StockInfo.ConceptSector_Sina��������֤������ҵ����͸��������ĸ�����ࡣ
% ���£�
% >> StockInfo.IPOdate
% ans =
%     20010518
% >> StockInfo.IPOprice
% ans =
%    36.6800
% >> StockInfo.IndustrySector
% ans =
% �����Ӧ�÷���ҵ
% >> StockInfo.ConceptSector_Sina
% ans = 
%     '�����ز�'
%     '������ȯ'
%     'QFII�ز�'
%     '��Ȩ����'
%     '�Ƽ���'
%     '�������'

% ��Ӧ���������ݻ�ȡ�ͱ��溯��Ϊ
% [SaveLog,ProbList,NewList] = SaveStockInfo(StockList)
% �״����к�ͻ��ڱ���DataBase\Stock\StockInfo_mat����ȫ��A�ɵĹ�˾��Ϣ��֤�����ࡢ������࣬���£�
%%
% 
% <<F17.png>>
% 

%% ����������-��Ʊ�ֺ������Ϣ����

% �������ƣ�GetStockXRD_Web.m
% �������ã���ȡ��Ʊ�ֺ������Ϣ����
% ���������
% [ Web_XRD_Data , Web_XRD_Cell_1 , Web_XRD_Cell_2 ] = GetStockXRD_Web(StockCode)
% ����˵������
% http://vip.stock.finance.sina.com.cn/corp/go.php/vISSUE_ShareBonus/stockid/000562.phtml
% ץȡ���µĹ�Ʊ���ƺʹ����б����ص�Web_XRD_Data , Web_XRD_Cell_1 , Web_XRD_Cell_2Ϊ��Ʊ�ķֺ������Ϣ���ݡ�
% �˺�������Chandeman��MATALB������̳ID: fosu_cdm��������д����һ�����������޸Ķ��ɡ�
% ����������

% %% ��������
% StockCode_G = '000562'
% 
% str = ['ȫ�ֲ���������ϣ�'];
% disp(str);
% %% ��ȡ��Ʊ��Ȩ��Ϣ����
% StockCodeInput = StockCode_G;
% 
% [ Web_XRD_Data , Web_XRD_Cell_1 , Web_XRD_Cell_2 ] = GetStockXRD_Web(StockCodeInput);
% Web_XRD_Cell_1;
% Web_XRD_Cell_2;

% ���н����
%%
% 
% <<F18.png>>
% 
%%
% 
% <<F19.png>>
% 

% ��Ӧ���������ݻ�ȡ�ͱ��溯��Ϊ
% [SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag)
% ��ʱ����XRDFlag = 1����������ȡ��ȡ��Ȩ��Ϣ��Ϣ��
% �״����к�ͻ��ڱ���DataBase\Stock\XRDdata_mat����ȫ��A�ɵĳ�Ȩ��Ϣ��Ϣ���ݣ�
%%
% 
% <<F20.png>>
% 

%% ����������-�������ݺ����ű����ݻ�ȡ

% GetStockFinIndicators_Web.m������GetStock3Sheet_Web.m�������Ի�ȡ��ֻ��Ʊ�Ĳ������ݺ����ű�����
% [FIndCell,YearList] = GetStockFinIndicators_Web(StockCode,Year)
% [BalanceSheet,ProfitSheet,CashFlowSheet,YearList] = GetStock3Sheet_Web(StockCode,Year)
% ���ݻ�ȡ����cell�����װ
%%
% 
% <<F21.png>>
% 
%%
% 
% <<F22.png>>
% 

% ��Ӧ���������ݻ�ȡ����Ϊ
% [SaveLog,ProbList,NewList] = SaveStockFD(StockList,Opt)
% % Opt 0:��ȡ����ָ�� 1:��ȡ3�ű�
% �������ݴ���λ�ã�
% FQuantToolBox\DataBase\Stock\FinancialIndicators_mat
%%
% 
% <<F23.png>>
% 

% ���ű����ݴ���λ�ã�
% FQuantToolBox\DataBase\Stock\Sheet3_mat
%%
% 
% <<F24.png>>
% 
%% �����ı�����-���й�˾�����ļ�����

% �������ƣ�GetStockNotice_Web
% �������ã���ȡ���й�˾�����ļ��б�
% ���������[NoticeDataCell] = GetStockNotice_Web(StockCode,BeginDate,EndDate)
% ����˵���������������ץȡ������ݡ�
% ����������

% StockCode = '600588';
% BeginDate = '20141001';
% EndDate = datestr(today,'yyyy-mm-dd');
% 
% [NoticeDataCell] = GetStockNotice_Web(StockCode,BeginDate,EndDate);

% ���н����
% ���к󷵻ص�NoticeDataCellΪStockCodeָ���Ĺ�Ʊ�Ĺ�˾�����ļ��б����£�
% ���������̧ͷΪ��Ʊ���롢����ʱ�䡢�ļ����֡��������͡��ļ�URL���ļ���С
%%
% 
% <<F25.png>>
%

% ��Ӧ���������ݻ�ȡ�ͱ��溯��Ϊ
% [FileListCell,SaveLog,ProbList,NewList] = SaveStockNotice(StockList)
% �״����к�ͻ��ڱ���DataBase\Stock\StockNotice_file\�ļ����ڱ���ȫ��A�ɵĹ�˾�����ļ���ÿ����Ʊ����һ���ļ��У����£�
%%
% 
% <<F26.png>>
%
%%
% 
% <<F27.png>>
%

% �����˵һ�㣬�������й�˾�������ݣ������Ķ�����������ģ���Ҫ���������¼���������ԣ�������������棺һ������ݹ���Ĵ��Է���ͷ������ڣ�
% ���м򵥵��¼���������Կ�����ĳֻ��Ʊ����ĳ�ֶ����µġ���Ҫ���桱��ͳ���N�죬ÿT�������ϵ���������һ���棬�����Ҫ���ø�ϸ�£�
% �����Ѿ����������й�˾�����ȫ�ģ�����Խ������й�˾����ȫ�ĵ��ı��ھ򣬽��н�����ķ������ϸ�»��֣����Թ�����зִʴ���
% ����������ϸ���Ļ������й�˾������¼���������ԡ�
%% �����ı�����-���й�˾Ͷ���߹�ϵ��Ϣ��Investor Relations Info������

% �������ƣ�GetStockInvestRInfo_Web
% �������ã���ȡ���й�˾Ͷ���߹�ϵ��Ϣ��Investor Relations Info���б�
% ���������[IRDataCell] = GetStockInvestRInfo_Web(StockCode,BeginDate,EndDate)
% ����˵���������������ץȡ������ݡ�
% ����������

% StockCode = '000001';
% BeginDate = '20101001';
% EndDate = datestr(today,'yyyy-mm-dd');
% 
% [IRDataCell] = GetStockInvestRInfo_Web(StockCode,BeginDate,EndDate);

% ���н����
% ���к󷵻ص�IRDataCellΪStockCodeָ���Ĺ�Ʊ�Ĺ�˾Ͷ���߹�ϵ��Ϣ��Investor Relations Info���б����£�
% ���������̧ͷΪ��Ʊ���롢����ʱ�䡢�ļ����֡��������͡��ļ�URL���ļ���С
%%
% 
% <<F28.png>>
%

% ��Ӧ���������ݻ�ȡ�ͱ��溯��Ϊ
% [IRInfoFileListCell,SaveLog,ProbList,NewList] = SaveStockInvestorRelationsInfo(StockList)
% �״����к�ͻ��ڱ���DataBase\Stock\ StockInvestorRelationsInfo_file\�ļ����ڱ������й�˾Ͷ���߹�ϵ��Ϣ��Investor Relations Info���ļ���
% ÿ����Ʊ����һ���ļ��У����£�
%%
% 
% <<F29.png>>
%
%%
% 
% <<F30.png>>
%

% ͬ���ģ��������й�˾Ͷ���߹�ϵ��Ϣ��Investor Relations Info�����ݣ������й�˾��������һ�������������з��¼���������ԣ������֡�����ϸ��

%% �����ı�����-�ٶȸ߼������������

% �������ƣ�BaiduSearchAdvancedNews
% �������ã���ȡ�ٶȸ߼�����������ݣ���������ָ��������عؼ��ʣ���ȡ����֮�����ش�����ʱ�䡢��Դ��URL���ӵ����ݣ��ҿ���ָ������ʱ��Ρ�
% ���������
% [NewsDataCell] 
% = BaiduSearchAdvancedNews(StringIncludeAll,StringIncludeAny,BeginDate,EndDate)
% ����˵���������������ץȡ������ݡ�
% ����������

% StockCode = '600588';
% BeginDate = '20141226';
% EndDate = datestr(today,'yyyy-mm-dd');
% 
% StringIncludeAny = [];
% [NewsDataCell] = BaiduSearchAdvancedNews(StockCode,StringIncludeAny,BeginDate,EndDate);

% ���н����
% ���к󷵻ص�NewsDataCellΪStockCodeָ���Ĺ�Ʊ�İٶ�ȫ�������������������£�
% ���������̧ͷΪ����ʱ�䡢Title����Դ��URL 
%%
% 
% <<F31.png>>
%

% �����ⲿ�����ݣ��Ϳ��Կ�����������ԣ����Դ����������֣�
% һ���棬���Ի���ĳһʱ��ε���������������������ͳ�ƣ��ҵ���Ӧ�����ź����Źɣ�������Ӧ���ԵĹ�����
% ��һ���棬���������ϸ��һЩ�����ڱ����˴�����URL������ͨ��������URL��ȡ�������ݵ�ȫ�����ݣ�Ȼ����зִʴ�������������Ĵ�֣��������Ӿ�ϸ����������ԡ�
% 
% ��ʵ��BaiduSearchAdvancedNews����������������Ĺؼ��ʽ�������������һ���ǹ�Ʊ���룬���磬������ϰ�����ص����ݣ�
% ����������
% %% BaiduSearchAdvancedNews Word Test
% StringIncludeAll = 'ϰ��ƽ';
% BeginDate = '20141226';
% EndDate = datestr(today,'yyyy-mm-dd');
% 
% StringIncludeAny = [];
% [NewsDataCell] = BaiduSearchAdvancedNews(StringIncludeAll,StringIncludeAny,BeginDate,EndDate); 

% ���н����
%%
% 
% <<F32.png>>
%
%% �����ı�����-���˸߼������������

% �������ƣ�SinaSearchAdvanced
% �������ã���ȡ���˸߼�����������ݣ���������ָ��������عؼ��ʣ���ȡ����֮�����ش�����ʱ�䡢��Դ��URL���ӵ����ݣ��ҿ���ָ������ʱ��Ρ�
% ���������
% [NewsDataCell] 
% = SinaSearchAdvanced(StringIncludeAll,BeginDate,EndDate)
% ����˵���������������ץȡ������ݡ�
% ����������

% StringIncludeAll = '600588';
% BeginDate = '20141201';
% EndDate = datestr(today,'yyyy-mm-dd');
% 
% [NewsDataCell] = SinaSearchAdvanced(StringIncludeAll,BeginDate,EndDate); 

% ���н����
% ���к󷵻ص�NewsDataCellΪStockCodeָ���Ĺ�Ʊ�İٶ�ȫ�������������������£�
% ���������̧ͷΪ����ʱ�䡢Title����Դ��URL 
%%
% 
% <<F33.png>>
%
%% �����ı�����-��Ʊ�б��б�ժҪ����
% ��ȡ��Ʊ�б��������

% ����������
% StockCode = '600588';
% BeginDate = '20141001';
% EndDate = datestr(today,'yyyymmdd');
% 
% [ReportList] = GetStockReport_Web(StockCode, 'BeginDate',BeginDate,'EndDate',EndDate);
% ���н����
%%
% 
% <<F34.png>>
%
%% ���������͹���-MATLAB���ݱ����������ʽ�ļ�(.csv .xlsx .txt��)ͨ�ú���
% [Status, Message] = SaveData2File(Data, FileName, ColNamesCell,varargin)
%%
% <http://mp.weixin.qq.com/s?__biz=MzA5NzEzNDk4Mw==&mid=205637598&idx=2&sn=2ef11f011c250f8bd864d36d70df12ea&3rd=MzA3MDU4NTYzMw==&scene=6#rd ������ϸ������������>

% FQuantToolBox��������Щ���ѷ�Ӧ�ܷ񽫻�ȡ�Ĺ�Ʊ��������ݱ���������ļ���ʽ������FQuantToolBoxĬ�ϵı����ʽ��.mat�ļ���
% �����е�������Ҫ���������ʽ(.csv .xlsx .txt��)���ļ����е��ã��ʱ�д��SaveData2File.m������һ������Խ��FQuantToolBoxʹ�ã�
% ����ȡ�Ĺ�Ʊ���ڻ����ݱ��������Ҫ�ĸ�ʽ����һ����ú���Ҳ���Ե���ʹ�ã����Խ��κ�MATLAB���ݣ�double�� cell�ͣ�
% ���ٵı����������ʽ�ļ�����֧�ֱ����{'.txt','.dat','.csv','.xls','.xlsb','.xlsx','.xlsm'}����չ�����ļ�����

% % % ��ȡ��Ʊ�����б����
% [StockList,StockListFull] = GetStockList_Web;
% StockCodeDouble = cell2mat( StockList(:,3) );
% save('StockList','StockList');
% 
% % % StockList SaveData2File
% tic;
% Data = StockList;
% 
% FileName = 'StockList.csv';
% ColNamesCell = {'��Ʊ����','��Ʊ����','��Ʊ���루�����֣�'};
% 
% [Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
% 
% Data = StockList;
% 
% FileName = 'StockList.txt';
% ColNamesCell = {'��Ʊ����','��Ʊ����','��Ʊ���루�����֣�'};
% 
% [Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
% toc;
% % % ��ȡָ�������б�
% 
% [IndexList] = GetIndexList_Web;
% 
% save('IndexList','IndexList');
% 
% % % IndexList SaveData2File
% tic;
% Data = IndexList;
% 
% FileName = 'IndexList.csv';
% ColNamesCell = {'����','����','���루�����֣�'};
% 
% [Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
% toc;
% % % ��ȡ��Ʊ���ߣ���Ȩ��Ϣ�����ݲ���
% 
% StockCode = 'sh600030';
% 
% BeginDate = '20130101';
% EndDate = '20150101';
% 
% [StockDataDouble,adjfactor] = GetStockTSDay_Web(StockCode,BeginDate,EndDate);
% 
% % % StockDataDouble SaveData2File
% tic;
% Data = StockDataDouble;
% FileName = 'StockDataTest.csv';
% % FileName = [];
% 
% ColNamesCell = {'����','��','��','��','��','��','��','��Ȩ����'};
% % ColNamesCell = [];
% 
% [Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
% toc;
% 
% % % ��ȡ��Ʊ����ָ�����
% 
% StockCodeInput = '600588';
% StockCodeInput = StockCode_G;
% 
% Year = '2014';
% [FIndCell,YearList] = GetStockFinIndicators_Web(StockCodeInput,Year);
% FIndCell
% % % FIndCell SaveData2File
% tic;
% Data = FIndCell;
% 
% FileName = '����ָ��Test.csv';
% ColNamesCell = [];
% 
% [Status, Message] = SaveData2File(Data, FileName, ColNamesCell);
% toc;

% ���н��
% ������������ʽ���ļ�
%%
% 
% <<F35.png>>
%

%% ���������͹���-MATLAB�����ʼ�ͨ�ú���
% MatlabSendMailGeneral(subject, content, TargetAddress, Attachments,SourceAddress,password)

%%
% <http://mp.weixin.qq.com/s?__biz=MzA5NzEzNDk4Mw==&mid=205637598&idx=1&sn=a8ff13498211d3268621ab7dbfb33c62&3rd=MzA3MDU4NTYzMw==&scene=6#rd ������ϸ������������>

% ��ʱ�����ǻ���MATLAB�Զ���ʱ����(�鿴���ں���ʷ��Ϣ����ʱ����MATLAB��������Ľ������), �ú��Զ������ʼ������ͳ������е�����������Ƿ����гɹ������к�ʱ�ȵȡ�
% 
% ������һ��MATLAB�����ʼ�ͨ�ú���������ʹ��������MATLAB�����ʼ���֧��ָ����������ͽ������䣬��΢��д���ű���������֧��Ⱥ���ʼ���

% ����ʹ������Ľű������ԣ�

% SourceAddress = '�����Լ��������ַ'; %�Լ��������ַ
% password = '�����Լ����������'; %�����Լ����������
% 
% subject = '����Ӣ��123Test';
% content = subject;
% 
% TargetAddress = SourceAddress;
% 
% MatlabSendMailGeneral(subject, content, TargetAddress, [],SourceAddress,password);

%% ���������͹���-����K�ߺ���������ʱ�����趨����

% ����K�ߺ�����KplotNew(OHLC) 
% ����OHLC�����ߵ��� ���K��ͼ��

% ����ʱ�����趨������LabelSet(Ghandle, Dates, TickStep, TickNum, Style,XTRot)
% ����
% Ghandle�������ƺ����ͼ�ξ����һ������Ϊgca����
% Dates������ʱ���ǩ��double�����ݣ����������ڸ�ʽΪdouble�͵ģ�����20150525
% TickStep�������ǩ������ã�����Ϊ�ռ��ɣ����н���Ĭ�ϵ���
% TickNum�������ǩ���ݣ�����Ϊ�ռ��ɣ����н���Ĭ�ϵ���
% Style��չʾ���ѡ�
    % 0 Ĭ����ʽ
    % 1 ��������-�±�ǩ
    % 2 ��������-���ǩ
    % 3 ����������-�ձ�ǩ
    % 4 ����������-�±�ǩ
    % 5 ����������-���ǩ
    % 
    % 8 ����Ӧ����
% XTRot�������ǩ��ת��������������Ϊ�����뼴�ɣ����н���Ĭ�ϵ���

% % ����������
% ��ȡ����
StockCode = '000869';
BeginDate = '20150101';
EndDate = datestr(today,'yyyymmdd');

[StockDataDouble,adjfactor] = GetStockTSDay_Web(StockCode,BeginDate,EndDate);
% ����K��
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)*1/4 scrsz(4)*1/6 scrsz(3)*4/5 scrsz(4)]*3/4);

OHLC = StockDataDouble(:,2:5);
KplotNew(OHLC);
% ����ʱ�����趨
Dates = StockDataDouble(:,1);
Style = 0;
XTRot = [];
LabelSet(gca, Dates, [], [], Style,XTRot);
str = [StockCode,'-K��ͼ'];
title(str,'FontWeight','Bold');


%% ��ι�������MATLAB�Ļز�ϵͳ
% FQuantToolBox�еġ���ι�������MATLAB�Ļز�ϵͳ���ļ�����ṩ��һ������ι�������MATLAB�Ļز�ϵͳ����demo�������ṩ��һ�����߻ز�������һ���ز�ģ�壬
% �˲����������ԡ�����Ͷ�ʣ���MATLABΪ���ߡ�������½ڡ�����ɲο�������Ͷ�ʣ���MATLABΪ���ߡ�����½ڡ�

%% ����˵��
% FQuantToolBox������ĸ������ڣ�����������ȷʱ���δ�����µĴ��·���������������ڱ�ĵ�������ݻ�ȡ��ʽ���������Ļز⸨��������������

% FQuantToolBox���������湲���ĸ�MATLAB�ű��ļ���ʲô�ǽű��ļ�������MATLAB�ű��ļ��ͺ����ļ�������������Ҫ����Щ���Σ��ٶ�������N����ѧ��MATLAB������
% Main_GetStockDataTest.m
% Main_GetFuturesDataTest.m
% Main_SaveStockData2LocalTest.m
% Main_SaveFuturesData2Local.m
% ���У�
% Main_GetStockDataTest.m����������FQuantToolBox����������������Get��ͷ�ĺ͹�Ʊ��صĺ�����ÿ��������Main_GetStockDataTest.m��һ��cell���棬
% ���������鿴��غ�����������������磺
%%
% 
% <<S01.png>>
% 

% Main_GetFuturesDataTest.m����������FQuantToolBox����������������Get��ͷ�ĺ��ڻ���صĺ�����ÿ��������Main_GetFuturesDataTest.m��һ��cell���棬
% ���������鿴��غ�����������������磺
%%
% 
% <<S02.png>>
% 

% Main_SaveStockData2LocalTest.m����������FQuantToolBox����������������Save��ͷ�ĺ͹�Ʊ��صĺ�������������������ص����ݴ��������أ�
% ÿ��������Main_SaveStockData2LocalTest.m��һ��cell���棬���������鿴��غ������������������ȫ�����л�ܺ�ʱ������ÿ��cell������һ��run������
% ��ֻ���run����Ϊ1����cellģ��������У�run=0ʱ����Ӧcellģ�鲻�����С�
%%
% 
% <<S03.png>>
% 

% ��������Main_SaveStockData2LocalTest.m�ڻῴ��һЩspmd���в���ģ�飬�������MATLAB�������˽⣬��ô���Բ�����������������ݣ�����Ļ��������Ըò��ִ��뼴�ɡ�
% 
% Main_SaveFuturesData2Local.m��Main_SaveStockData2LocalTest.m�������ƣ�ֻ����Main_SaveFuturesData2Local.m
% ����������FQuantToolBox����������������Save��ͷ�ĺ��ڻ���صĺ�������������������ص����ݴ��������ء�

%% ����FQuantToolBox�Ĳ�������:һ�ּ򻯵Ľ��涯����ϲ���
% ���к���SimpleMomentumPortfolioTest.m���в���

%%
% <http://mp.weixin.qq.com/s?__biz=MzA5NzEzNDk4Mw==&mid=204989303&idx=1&sn=8438eb4cd073159db4be7814878c320d&3rd=MzA3MDU4NTYzMw==&scene=6#rd ������ϸ�����������һ�ּ򻯵Ľ��涯����ϲ���>

% ���Լ�飺
% ���ԱȽϼ򵥣�ʹ��Nֻ��Ʊ����Ͷ����ϣ�����ÿֻ��Ʊ�Ĺ�ȥLookBack���������յĶ�����������׼��������Ϊ��ƱȨ�أ�����Holding���������գ�
% ����Ȩ������Ϊ���������������չ�Ʊ����Ҫ˵������������ȥ����ǿ�ƵĹ�Ʊ�����չ�ȥ�������ƵĹ�Ʊ��
% 
% ��Ȼ���ԱȽϼ򵥣�������Ĳ������̺Ϳ�ܺ����������������Ʋ��ԵĻز�ʵ�־��вο����壬��������̿��Ϊ��
% 
% ���ݻ�ȡ�����ڸ��ѻ�����ѵ�����Դ��������
% ���ݵ�ʱ��������Լ�ȱʧ������䡪����
% �Ӻ�����д���ض��ع��ڵĶ������㲢����׼��������
% �Ӻ�����д�������ع��ںͳ����ڣ���ϵ����ձ������㡪����
% ���㲻ͬ�ع��ںͳ���������ϵ����ձ���ֵ������
% ���в��Բ����ֲ�ͼ��չʾ

% ���к���SimpleMomentumPortfolioTest.m
%%
% 
% <<D1-01.png>>
% 
%%
% 
% <<D1-02.png>>
% 

%% ����FQuantToolBox�Ĳ�������:һ��򵥵�Ⱥ����Ϊ��ʱģ�Ϳ�ܼ�ʵ�ֲ���
% 
%%
% <http://mp.weixin.qq.com/s?__biz=MzA5NzEzNDk4Mw==&mid=208480402&idx=1&sn=46a21a3a454cb5d639750b845aed33b1&3rd=MzA3MDU4NTYzMw==&scene=6#rd ������ϸ������������>

% ���Լ�飺
% ָ������ʱģ�Ϳ���ͨ������ɷֹɵ���Ϊ��������֣������ͨ��ĳ�ַ�ʽ���ϵ�һ���ۺϴ�֣���������
% �Լ򵥵ľ���Ϊ������Ȼ���ߺܼ򵥣����򵥵Ķ��������������������������Ч�������г�������֪�����ߵ�ģ�Ͷ������ͺ��ԣ�
% ���ǿ���ʹ�ó�����20�վ���������ָ���Ͻ�����ʱ������Ч������������һ�����ͺ��ԣ���û�а취����Ϊ������ʥ����
% ����ƪҪ���۵���һ�����������Ⱥ����Ϊ��ʱ��ܵľ�������ʱģ�͡�
% �ص������ģ�Ϳ�ܣ�
% TM(Index) = sf(sTM(Stock_1,Stock_2,��,Stock_N))
% ������ʱģ��TM_demo�����ڵ�ֻ���ɶ���
% sTM(Stock_i)={���������1�����λ���������������������2�����λ����������}��sfΪĳ�ּ�Ȩƽ�������Ի�����ԣ���

% ���²��Ի���MATLAB��������ԴΪFQuantToolBox��Wind�����Ա��Ϊ����300ָ����000300.SH��,ʹ��T��֮ǰ��T-1�ա�T-2�գ��� �����������������ź�ָ��T�ս��ף�
% ������ʱģ��TM_demo���ɵ���ʱ�ź����£�
%%
% 
% <<1.jpg>>
% 
% ���Կ����������������������Ⱥ����Ϊ��ʱģ��TM_demo��ĳЩʱ�������ǰ��������������źţ���Ҳ�������κ�ʱ�򶼰ٷ�֮��׼ȷ����Ϊ������ʥ����
% �����ŵ�����2015����ڵ��źţ�
%%
% 
% <<4.jpg>>
% 
% ���Կ���ģ�͵ġ����������Ƚϲ���
%  
% �����������ʱ�źţ���������ϵͳ�ز�һ�£�ʹ��T��֮ǰ��T-1�ա�T-2�գ��� �����������������ź�ָ��T�ս��ף���������źţ���T�տ���������Ա�ģ�
% ���������ź���ղֹ���������������յĲ��ԣ������Խ�����£�
%%
% 
% <<2.jpg>>
% 
%%
% 
% <<3.jpg>>
% 
% ���������գ����Խ�����£�
%%
% 
% <<5.jpg>>
% 
%%
% 
% <<6.jpg>>
% 

%% ������Ͷ�ʣ���MATLABΪ���ߡ��鼮����
% ������Ͷ�ʣ���MATLABΪ���ߡ���Ϊ����ƪ�͸߼�ƪ���󲿷֡�����ƪ����ͨ��Q&A�ķ�ʽ������MATLAB����Ҫ���ܡ�����������ݴ�������ݣ�ʹ���߶�MATLAB�л������˽⡣
% �߼�ƪ���ַ�Ϊ14�£�����MATLAB�����Ż���������ݽ��������ƽ���ͼ�Ρ�������������ͽ���ģ�͵����ݣ�ͨ���ḻʵ����ͼ�ΰ���������������MATLAB��Ϊ����Ͷ�ʵĹ��ߡ�
% ������Ͷ�ʣ���MATLABΪ���ߡ�����ɫ���ڲ�������������ѧϰ����Ҫ�����������߱�ѧ�����������ۺ�ʵ�����ء�
% 
% ������Ͷ�ʣ���MATLABΪ���ߡ��ʺϽ��ڻ������о���Ա�ʹ�ҵ��Ա����������Ͷ�ʵĽ���Ա������ͳ�Ʊ����Ŀ��й����ߡ��ߵ�ԺУ���רҵ�Ľ�ʦ��ѧ���Լ�������Ͷ�ʺ�
% MATLAB����Ȥ����ʿ�Ķ��� 

%% ������Ϣ
% <html>
% <table border="0" width="600px" id="table1">	
% <tr><td><b><font size="2">����ΪһЩ���߲���demo�����߰����ĵ���ȫ����MATLAB�Զ�publish����</font></b></td></tr>	
% <tr><td><span class="tip"><font size="2">FQuantToolBox���°����ص�ַ��<a target="_blank" href="http://pan.baidu.com/s/1gdIiccN"><font color="#0000FF">�ٶ�����</font></a></font></span></td></tr>
% <tr><td><span class="tip"><font size="2">FQuantToolBoxʹ�ý���������̳��<a target="_blank" href="http://www.matlabsky.com/forum-112-1.html"><font color="#0000FF">MATLAB������̳</font></a></font></span></td></tr>
% <tr><td><span class="tip"><font size="2">FQuantToolBoxʹ�ý�������QQȺ��QuantGroup1Ⱥ[MATLAB] 279908629</font></span></td></tr> 	
% <tr><td><span class="tip"><font size="2">����faruto����ϵ��ʽ������-farutoliyang@foxmail.com <a target="_blank" href="http://weibo.com/faruto"><font color="#0000FF">΢��-faruto</font></a>  ΢�Ź��ں�-FQuantStudio(��ӭɨ���ע)</font></span></td></tr>
% <tr><td><span class="tip"><font size="2"><img src="./FQuantStudioWeChat.jpg" width="90" height="90"></font></span></td></tr>
% <tr><td><span class="tip"><font size="2">�鼮�Ƽ���</font></span></td></tr>
% </table>
% <img src="./QuMBook.jpg" width="300" height="400">
% <img src="./ANN.jpg" width="300" height="400">
% <br><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1255207519'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1255207519' type='text/javascript'%3E%3C/script%3E"));</script>
% </html>
% 
