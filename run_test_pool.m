tic

clear

load('./mat/List.mat')
load('./mat/BigData.mat')
load('./mat/Compo/399006.mat')

Arg.TotalN = 20;
Arg.RemaiN = 16;
Arg.IntvlN = 70;
Arg.ShiftN = 20;
Arg.CutPct = 0.8;
Arg.MinPct = 1.1;
Arg.Start  = 20100820;

A = test_momentum(BigData, List, Compo, Arg);
A(end)

toc
