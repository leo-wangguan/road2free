%% Main_SaveFuturesData2Local
% by LiYang_faruto
% Email:farutoliyang@foxmail.com
% 2014/12/12
%% A Little Clean Work
tic;
% clear;
% clc;
% close all;
format compact;
%% ��ȡ�ڻ��������ֲ�����-IF

DateList = [];
FutureCode = 'if';
UpdateFlag = 1;
[SaveLog,IF_DateListOut,ProbList,NewList] = SaveFuturesVolOIRankingData(FutureCode,DateList,UpdateFlag);

%% ��ȡ�ڻ��������ֲ�����-TF
DateList = [];
FutureCode = 'tf';
UpdateFlag = 1;

[SaveLog,TF_DateListOut,ProbList,NewList] = SaveFuturesVolOIRankingData(FutureCode,DateList,UpdateFlag);
%% ��ȡ�ڻ���������-IF
MarketCode = 'CFFEX';
FutureCode = 'IF';
DateList = [];
[SaveLog,ProbList,NewList] = SaveFuturesDay(MarketCode,FutureCode,DateList);

%% ��ȡ�ڻ���������-TF
MarketCode = 'CFFEX';
FutureCode = 'TF';
DateList = [];

[SaveLog,ProbList,NewList] = SaveFuturesDay(MarketCode,FutureCode,DateList);

%%











%% Record Time
toc;
displayEndOfDemoMessage(mfilename);