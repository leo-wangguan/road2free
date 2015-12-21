tic

% clear
% 
% load('./mat/List.mat')
% load('./mat/BigData.mat')
% load('./mat/Compo/399006_Compo.mat')

A = test_momentum(BigData, List, Compo, 20150920, 4, 2, 5, 5, 'exchange');
A(end)

toc
