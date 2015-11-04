function [SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag)
% by LiYang_faruto
% Email:farutoliyang@foxmail.com
% 2014/12/12
% AdjFlag 0:��Ȩʱ������ 1:ǰ��Ȩʱ������ 2:��Ȩʱ������
% XRDFlag 0:����ȡ��Ȩ��Ϣ��Ϣ 1:��ȡ��Ȩ��Ϣ��Ϣ
%% �������Ԥ����
if nargin < 3 || isempty(XRDFlag)
    XRDFlag = 0;
end
if nargin < 2 || isempty(AdjFlag)
    AdjFlag = 0;
end
if nargin < 1 || isempty(StockList)
    load StockList.mat;
end

SaveLog = [];
ProbList = [];
NewList = [];

Len = size(StockList, 1);
StockCode = StockList(:,2);
StockName = StockList(:,1);

if 1 == XRDFlag
    AdjFlag = 888;
end
Date_G = '19900101';
%% ��Ȩʱ������
if 0 == AdjFlag
    FolderStr = ['C:/program/stocks/Day_ExDividend_mat'];
    if ~isdir( FolderStr )
        mkdir( FolderStr );
    end
    
    ticID = tic;
    for i = 1:Len
        disp('======')
        RunIndex = i
        Scode = StockCode{i}
        Sname = StockName{i}
        disp('============')
        
        % % DebugMode
        DebugMode_OnOff = 0;
        if 1 == DebugMode_OnOff
            if strcmpi(Scode,'sh603011')~=1
                continue;
            end
            
        end
        
        FileString = [FolderStr,'/',StockCode{i},'_D_ExDiv.mat'];
        FileExist = 0;
        if exist(FileString, 'file') == 2
            FileExist = 1;
        end
        
        % % �������ݴ��ڣ�����β���������
        if 1 == FileExist
            try
                
                MatObj = matfile(FileString,'Writable',true);
                [nrows, ncols]=size(MatObj,'StockData');
                
                OffSet = 4;
                
                if nrows-OffSet>1
                    
                    len = nrows;
                    Temp = MatObj.StockData(len-OffSet,1);
                    DateTemp = datestr( datenum(num2str(Temp),'yyyymmdd'),'yyyymmdd' );
                    
                    StockCodeInput = Scode;
                    BeginDate = DateTemp;
                    EndDate = datestr(today, 'yyyymmdd');
                    
                    StockDataDouble = GetStockTSDay_Web(StockCodeInput,BeginDate,EndDate);
                    if isempty(StockDataDouble)
                        str = [ StockCode{i},'-',StockName{i}, ' ���ݻ�ȡʧ�ܣ����飡' ];
                        disp(str);
                        LenTemp = size( ProbList,1 )+1;
                        ProbList{LenTemp,1} = Sname;
                        ProbList{LenTemp,2} = Scode;
                        continue;
                    end
                    
                    MatObj.StockData = ...
                        [MatObj.StockData(1:nrows-OffSet-1,:);StockDataDouble];
                    
                else % % �������ݴ��ڣ���Ϊ��
                    LenTemp = size( NewList,1 )+1;
                    NewList{LenTemp,1} = Sname;
                    NewList{LenTemp,2} = Scode;
                    
                    % % ��ȡ��������
                    StockCodeInput = Scode;
                    IPOdate = GetBasicInfo_Mat(StockCodeInput,[],[],'Stock','IPOdate');
                    if ~isempty(IPOdate)
                        DateTemp = IPOdate;
                    else
                        DateTemp = Date_G;
                    end
                    DateTemp = num2str(DateTemp);
                    
                    StockCodeInput = Scode;
                    BeginDate = DateTemp;
                    EndDate = datestr(today, 'yyyymmdd');
                    
                    StockDataDouble = GetStockTSDay_Web(StockCodeInput,BeginDate,EndDate);
                    if isempty(StockDataDouble)
                        str = [ StockCode{i},'-',StockName{i}, ' ���ݻ�ȡʧ�ܣ����飡' ];
                        disp(str);
                        LenTemp = size( ProbList,1 )+1;
                        ProbList{LenTemp,1} = Sname;
                        ProbList{LenTemp,2} = Scode;
                        continue;
                    end
                    
                    %                     StockData = StockDataDouble;
                    %
                    %                     save(FileString,'StockData', '-v7.3');
                    MatObj.StockData = StockDataDouble;
                    
                end
            catch
                str = [ StockCode{i},'-',StockName{i}, ' ��������ʧ�ܻ�����ԭ�����ݸ���ʧ�ܣ��������������ݣ�' ];
                disp(str);
                FileExist = 0;
            end
        end
        
        % % �������ݲ�����
        if 0 == FileExist
            LenTemp = size( NewList,1 )+1;
            NewList{LenTemp,1} = Sname;
            NewList{LenTemp,2} = Scode;
            
            % % ��ȡ��������
            StockCodeInput = Scode;
            IPOdate = GetBasicInfo_Mat(StockCodeInput,[],[],'Stock','IPOdate');
            if ~isempty(IPOdate)
                DateTemp = IPOdate;
            else
                DateTemp = Date_G;
            end
            DateTemp = num2str(DateTemp);
            
            StockCodeInput = Scode;
            BeginDate = DateTemp;
            EndDate = datestr(today, 'yyyymmdd');
            
            StockDataDouble = GetStockTSDay_Web(StockCodeInput,BeginDate,EndDate);
            if isempty(StockDataDouble)
                str = [ StockCode{i},'-',StockName{i}, ' ���ݻ�ȡʧ�ܣ����飡' ];
                disp(str);
                LenTemp = size( ProbList,1 )+1;
                ProbList{LenTemp,1} = Sname;
                ProbList{LenTemp,2} = Scode;
                continue;
            end
            
            StockData = StockDataDouble;
            
            save(FileString,'StockData', '-v7.3');
            
        end
        
        NewListLen = size(NewList,1)
        ProbListLen = size(ProbList,1)
        
        elapsedTimeTemp = toc(ticID);
        str = [ 'ѭ���Ѿ��ۼƺ�ʱ', num2str(elapsedTimeTemp), ' seconds(',num2str(elapsedTimeTemp/60), ' minutes)',...
            '(',num2str(elapsedTimeTemp/60/60), ' hours)',];
        disp(str);
        str = ['Now Time:',datestr(now,'yyyy-mm-dd HH:MM:SS')];
        disp(str);
    end
    
end
%% ǰ��Ȩʱ������
if 1 == AdjFlag
    FolderStrD_Ex = ['C:/program/stocks/Day_ExDividend_mat'];
    FolderStr = ['C:/program/stocks/Day_ForwardAdj_mat'];
    if ~isdir( FolderStr )
        mkdir( FolderStr );
    end
    
    ticID = tic;
    for i = 1:Len
        disp('======')
        RunIndex = i
        Scode = StockCode{i}
        Sname = StockName{i}
        disp('============')
        
        FileStringD_Ex = [FolderStrD_Ex,'/',StockCode{i},'_D_ExDiv.mat'];
        FileString = [FolderStr,'/',StockCode{i},'_D_ForwardAdj.mat'];
        
        FileExist = 0;
        if exist(FileStringD_Ex, 'file') == 2
            FileExist = 1;
        end
        
        % % �������ݴ��ڣ�����β���������
        if 1 == FileExist
            try
                str = ['load ',FileStringD_Ex];
                eval(str);
                
                if ~isempty(StockData)
                    
                    XRD_Data = [];
                    
                    [StockDataXRD, factor] = CalculateStockXRD(StockData, XRD_Data, AdjFlag);
                    StockData = StockDataXRD;
                    save(FileString,'StockData', '-v7.3');
                end
            catch
                str = [ StockCode{i},'-',StockName{i}, ' ��������ʧ�ܻ�����ԭ�����ݸ���ʧ��' ];
                disp(str);
                FileExist = 0;
            end
        end
        
        NewListLen = size(NewList,1)
        ProbListLen = size(ProbList,1)
        
        elapsedTimeTemp = toc(ticID);
        str = [ 'ѭ���Ѿ��ۼƺ�ʱ', num2str(elapsedTimeTemp), ' seconds(',num2str(elapsedTimeTemp/60), ' minutes)',...
            '(',num2str(elapsedTimeTemp/60/60), ' hours)',];
        disp(str);
        str = ['Now Time:',datestr(now,'yyyy-mm-dd HH:MM:SS')];
        disp(str);
    end
end
%% ��Ȩʱ������
if 2 == AdjFlag
    FolderStrD_Ex = ['C:/program/stocks/Day_ExDividend_mat'];
    FolderStr = ['C:/program/stocks/Day_BackwardAdj_mat'];
    if ~isdir( FolderStr )
        mkdir( FolderStr );
    end
    
    ticID = tic;
    for i = 1:Len
        disp('======')
        RunIndex = i
        Scode = StockCode{i}
        Sname = StockName{i}
        disp('============')
        
        FileStringD_Ex = [FolderStrD_Ex,'/',StockCode{i},'_D_ExDiv.mat'];
        FileString = [FolderStr,'/',StockCode{i},'_D_BackwardAdj.mat'];
        
        FileExist = 0;
        if exist(FileStringD_Ex, 'file') == 2
            FileExist = 1;
        end
        
        % % �������ݴ��ڣ�����β���������
        if 1 == FileExist
            try
                str = ['load ',FileStringD_Ex];
                eval(str);
                
                if ~isempty(StockData)
                    
                    XRD_Data = [];
                    
                    [StockDataXRD, factor] = CalculateStockXRD(StockData, XRD_Data, AdjFlag);
                    StockData = StockDataXRD;
                    save(FileString,'StockData', '-v7.3');
                end
            catch
                str = [ StockCode{i},'-',StockName{i}, ' ��������ʧ�ܻ�����ԭ�����ݸ���ʧ��' ];
                disp(str);
                FileExist = 0;
            end
        end
        
        NewListLen = size(NewList,1)
        ProbListLen = size(ProbList,1)
        
        elapsedTimeTemp = toc(ticID);
        str = [ 'ѭ���Ѿ��ۼƺ�ʱ', num2str(elapsedTimeTemp), ' seconds(',num2str(elapsedTimeTemp/60), ' minutes)',...
            '(',num2str(elapsedTimeTemp/60/60), ' hours)',];
        disp(str);
        str = ['Now Time:',datestr(now,'yyyy-mm-dd HH:MM:SS')];
        disp(str);
    end
end
%% ��ȡ��Ȩ��Ϣ��Ϣ
if 1 == XRDFlag
    FolderStr = ['C:/program/stocks/XRDdata_mat'];
    if ~isdir( FolderStr )
        mkdir( FolderStr );
    end
    ticID = tic;
    for i = 1:Len
        disp('======')
        RunIndex = i
        Scode = StockCode{i}
        Sname = StockName{i}
        disp('============')
        
        FileString = [FolderStr,'/',StockCode{i},'_XRD.mat'];
        
        StockCodeInput = Scode;
        [ Web_XRD_Data , Web_XRD_Cell_1 , Web_XRD_Cell_2 ] = GetStockXRD_Web(StockCodeInput);
        
        if isempty(Web_XRD_Data)
            str = [ StockCode{i},'-',StockName{i}, ' ���ݻ�ȡʧ�ܻ�ù�Ʊ�޳�Ȩ��Ϣ��Ϣ�����飡' ];
            disp(str);
            LenTemp = size( ProbList,1 )+1;
            ProbList{LenTemp,1} = Sname;
            ProbList{LenTemp,2} = Scode;
        else
            save(FileString,'Web_XRD_Data','Web_XRD_Cell_1','Web_XRD_Cell_2', '-v7.3');
        end
        
        NewListLen = size(NewList,1)
        ProbListLen = size(ProbList,1)
        
        elapsedTimeTemp = toc(ticID);
        str = [ 'ѭ���Ѿ��ۼƺ�ʱ', num2str(elapsedTimeTemp), ' seconds(',num2str(elapsedTimeTemp/60), ' minutes)',...
            '(',num2str(elapsedTimeTemp/60/60), ' hours)',];
        disp(str);
    end
end
%% �����ʼ�֪ͨ

% str = datestr(now,'yyyy-mm-dd HH:MM:SS');
% if AdjFlag == 1
%     subject = [str,' ��Ʊ�������ݣ�ǰ��Ȩ���������'];
% else
%     subject = [str,' ��Ʊ�������ݣ�����Ȩ���������'];
% end
%
% content = [];
% content{1,1} = [str,' ��Ʊ�������ݸ������'];
%
% Temp = StockD.DataCell;
% Temp = Temp(end,1);
% if iscell(Temp)
%     Temp = Temp{1};
% end
% str = [ '��Ʊ���������Ѹ�����', num2str(Temp) ];
% content{length(content)+1,1} = str;
% if ~isempty(IndNew)
%     content{length(content)+1,1} = '�����Ӹ��ɣ�';
%     for i = 1: length(IndNew);
%         content{length(content)+1,1} = cell2mat( StockList(IndNew(i),:) );
%     end
% end
% str = [ '����ʱ', num2str(elapsedTime), ' seconds(',num2str(elapsedTime/60), ' minutes)', ...
%        '(',num2str(elapsedTime/60/60), ' hours)'];
% content{length(content)+1,1} = str;
% str = [ '��������Ϊ', num2str(length(StockList)) ];
% content{length(content)+1,1} = str;
%
% TargetAddress = 'faruto@foxmail.com'; %Ŀ�������ַ
% MatlabSentMail(subject, content, TargetAddress);
