tic

clear

load('./mat/List.mat')
load('./mat/BigData.mat')
load('./mat/Compo/399006_Compo.mat')

A = test_momentum(BigData, List, Compo, 20100820, 20, 5, 20, 100, 'exchange');
A(end)

toc
