%% Main_SaveStockData2LocalTest
% by LiYang_faruto
% Email:farutoliyang@foxmail.com
% 2014/12/12
%% A Little Clean Work
tic;
% clear;
% clc;
% close all;
format compact;
%% ��־�ļ�

fid = fopen('Dlog.txt','at+');
str = ['����ʱ�䣺',datestr(now),' ������¼��־by����faruto '];
fprintf(fid,'%s\n',str);
%% ��ȡ��Ʊ�����б�
run = 0;
if 1 == run
    try
        [StockList,StockListFull] = GetStockList_Web;
        save('StockList','StockList');
        
        str = ['����ʱ�䣺',datestr(now),' ���¹�Ʊ�����б�'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ���¹�Ʊ�����б�ʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
else
    load StockList;
end

%% ��ȡָ�������б�
run = 1;
if 1 == run
    [IndexList] = GetIndexList_Web;
    IndexCodeDouble = cell2mat( IndexList(:,3) );
    save('IndexList','IndexList');
else
    load IndexList;
end
%% SaveStockInfo ��ȡ��Ʊ������Ϣ�Լ�������ҵ��飨֤�����ҵ���ࣩ�����������飨���˲ƾ����壩
run = 0;
if 1 == run
    [SaveLog,ProbList,NewList] = SaveStockInfo(StockList);
end
%% SaveStockNotice ��ȡ���ɹ�˾������Ϣ���������ļ�������
run = 0;
if 1 == run
    [NoticeFileListCell,SaveLog,ProbList,NewList] = SaveStockNotice(StockList);
end
%% SaveStockInvestorRelationsInfo ��ȡ����Ͷ���߹�ϵ��Ϣ���������ļ�������
run = 0;
if 1 == run
    [IRInfoFileListCell,SaveLog,ProbList,NewList] = SaveStockInvestorRelationsInfo(StockList);
end
%% SaveIndexTSDay ����ָ������
run = 1;
if 1 == run
    [SaveLog,ProbList,NewList] = SaveIndexTSDay(IndexList);
end
%% ��Ʊ���ݸ���-��Ȩ��Ϣ����-�޲��в���
run = 1;
if 1 == run
    try
        AdjFlag = 0;
        XRDFlag = 0;
        [SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag);
        if ~isempty(ProbList)
            [SaveLog,ProbList,NewList] = SaveStockTSDay(ProbList,AdjFlag,XRDFlag);
        end
        str = ['����ʱ�䣺',datestr(now),' ��Ʊ���ݸ���-��Ȩ��Ϣ����'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ��Ʊ���ݸ���-��Ȩ��Ϣ����ʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
end
%% ��Ʊ���ݸ���-��Ȩ��Ϣ����-���в��� spmd Test
run = 0;
if 1 == run
    WorkNum = 3;
    if isempty(gcp('nocreate'))
        Pobj = parpool( WorkNum );
        Pobj.NumWorkers
    end
    Pobj = gcp('nocreate');
    Pobj.NumWorkers
    % delete(Pobj);
    
    % % 30
    Sind = 1;
    StockList = StockList(Sind:end,:);
    
    SList = cell(WorkNum, 1);
    Num = floor( size(StockList,1)/WorkNum );
    for i = 1:WorkNum
        if i == WorkNum
            Lind = 1+Num*(i-1);
            SList{i} = StockList(Lind:end,:);
        else
            Lind = 1+Num*(i-1);
            Rind = Lind+Num-1;
            SList{i} = StockList(Lind:Rind,:);
        end
    end
    spmd
        AdjFlag = 0;
        XRDFlag = 0;
        [SaveLog,ProbList,NewList] = SaveStockTSDay(SList{labindex},AdjFlag,XRDFlag);
        
        str = ['����ʱ�䣺',datestr(now),' ��Ʊ���ݸ���-��Ȩ��Ϣ����-���в���'];
        fprintf(fid,'%s\n',str);
        
    end
end
%% ��ȡ������ϸ����Tick-�޲��в���
run = 0;
if 1 == run
    try
        [SaveLog,ProbList,NewList] = SaveStockTick(StockList);
        if ~isempty(ProbList)
            PList = ProbList;
            CheckFlag = 1;
            [SaveLog,ProbList,NewList] = SaveStockTick(StockList,[],PList,CheckFlag);
        end
        str = ['����ʱ�䣺',datestr(now),' ��ȡ��Ʊ������ϸ���ݽ���'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ��ȡ��Ʊ������ϸ����ʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
end
%% ��ȡ������ϸ����Tick-���в��� spmd Test
run = 0;
if 1 == run
    WorkNum = 3;
    if isempty(gcp('nocreate'))
        Pobj = parpool( WorkNum );
        Pobj.NumWorkers
    end
    Pobj = gcp('nocreate');
    Pobj.NumWorkers
    % delete(Pobj);
    
    % % 30
    Sind = 1;
    StockList = StockList(Sind:end,:);
    
    SList = cell(WorkNum, 1);
    Num = floor( size(StockList,1)/WorkNum );
    for i = 1:WorkNum
        if i == WorkNum
            Lind = 1+Num*(i-1);
            SList{i} = StockList(Lind:end,:);
        else
            Lind = 1+Num*(i-1);
            Rind = Lind+Num-1;
            SList{i} = StockList(Lind:Rind,:);
        end
    end
    spmd
        
        [SaveLog,ProbList,NewList] = SaveStockTick(SList{labindex});
        
        str = ['����ʱ�䣺',datestr(now),' ��ȡ��Ʊ������ϸ���ݽ���'];
        fprintf(fid,'%s\n',str);
        
    end
end
%% ��Ʊ���ݸ���-ǰ��Ȩ
run = 0;
if 1 == run
    try
        AdjFlag = 1;
        XRDFlag = 0;
        [SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag);
        str = ['����ʱ�䣺',datestr(now),' ��Ʊ���ݸ���-ǰ��Ȩ'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ��Ʊ���ݸ���-ǰ��Ȩʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
end
%% ��Ʊ���ݸ���-��Ȩ
run = 0;
if 1 == run
    try
        AdjFlag = 2;
        XRDFlag = 0;
        [SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag);
        str = ['����ʱ�䣺',datestr(now),' ��Ʊ���ݸ���-��Ȩ'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ��Ʊ���ݸ���-��Ȩʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
end
%% ��Ȩ��Ϣ��Ϣ
run = 0;
if 1 == run
    try
        AdjFlag = 0;
        XRDFlag = 1;
        [SaveLog,ProbList,NewList] = SaveStockTSDay(StockList,AdjFlag,XRDFlag);
        if ~isempty(ProbList)
            [SaveLog,ProbList,NewList] = SaveStockTSDay(ProbList,AdjFlag,XRDFlag);
        end
        str = ['����ʱ�䣺',datestr(now),' ���³�Ȩ��Ϣ��Ϣ'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ���³�Ȩ��Ϣ��Ϣʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
end
%% ����ָ��
run = 0;
if 1 == run
    try
        Opt = 0;
        [SaveLog,ProbList,NewList] = SaveStockFD(StockList,Opt);
        if ~isempty(ProbList)
            [SaveLog,ProbList,NewList] = SaveStockFD(ProbList,Opt);
        end
        str = ['����ʱ�䣺',datestr(now),' ���²���ָ��'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ���²���ָ��ʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
end
%% 3�ű�
run = 0;
if 1 == run
    try
        Opt = 1;
        [SaveLog,ProbList,NewList] = SaveStockFD(StockList,Opt);
        if ~isempty(ProbList)
            [SaveLog,ProbList,NewList] = SaveStockFD(ProbList,Opt);
        end
        str = ['����ʱ�䣺',datestr(now),' ����3�ű�'];
        fprintf(fid,'%s\n',str);
    catch err
        str = ['����ʱ�䣺',datestr(now),' ����3�ű�ʧ�ܣ�',err.message];
        fprintf(fid,'%s\n',str);
        for i = 1:size(err.stack,1)
            str = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
            fprintf(fid,'%s\n',str);
        end
        subject = [];
        content = [];
        TargetAddress = '516667408@qq.com';
        Attachments = 'Dlog.txt';
        MatlabSentMail(subject, content, TargetAddress, Attachments);
    end
end
%% �رմ򿪵��ļ�

fclose('all');

%% Exist
% exist;

%% Record Time
toc;
displayEndOfDemoMessage(mfilename);