%% Main_MatlabSendMailTest
% by LiYang_faruto
% Email:farutoliyang@foxmail.com
% 2015/05/01
%% A Little Clean Work
tic;
% clear;
% clc;
% close all;
format compact;
%%

SourceAddress = '�����Լ��������ַ'; %�Լ��������ַ
password = '�����Լ����������'; %�����Լ����������

subject = '����Ӣ��123Test';
content = subject;

TargetAddress = SourceAddress;

MatlabSendMailGeneral(subject, content, TargetAddress, [],SourceAddress,password);


%% Record Time
toc;
displayEndOfDemoMessage(mfilename);