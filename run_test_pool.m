tic

clear

load('./mat/List.mat')
load('./mat/BigData.mat')
load('./mat/Compo/399006_Compo.mat')

Arg.TotalN = 20;
Arg.ExchgN = 5;
Arg.IntvN  = 20;
Arg.ShiftN = 100;
Arg.Start  = 20100820;

A = test_momentum(BigData, List, Compo, Arg);
A(end)

toc
