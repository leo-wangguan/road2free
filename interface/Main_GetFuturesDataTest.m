%% Main_GetFuturesDataTest
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
tic

DateStr = '20150518';
Futurecode = 'tf';
Futurecode = 'if';

[DataCell,StatusOut] = GetFutureVolOIRanking_Web(DateStr, Futurecode);

toc
%% ��ȡ�ڻ��������ֲ�����-TF
tic

DateStr = '20141215';
Futurecode = 'tf';

[DataCell,StatusOut] = GetFutureVolOIRanking_Web(DateStr, Futurecode);

toc 
%% ��ȡ�ڻ�ĳ������ĳ������-�н���-IF
DateStr = '20141216';
MarketCode = 'CFFEX';
FuturesCode = 'IF';
[DataCell,StatusOut] = GetFutureDay_Web(DateStr, MarketCode,FuturesCode);
%% ��ȡ�ڻ�ĳ������ĳ������-�н���-TF
DateStr = '20141216';
MarketCode = 'CFFEX';
FuturesCode = 'TF';
[DataCell,StatusOut] = GetFutureDay_Web(DateStr, MarketCode,FuturesCode);

%%











%% Record Time
toc;
displayEndOfDemoMessage(mfilename);