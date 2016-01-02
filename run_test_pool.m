tic

clear

load('./mat/List.mat')
load('./mat/BigData.mat')
load('./mat/Compo/399006.mat')

Arg.TotalN = 20;
Arg.RemaiN = 16;
Arg.IntvlN = 21;
Arg.ShiftN = 43;
Arg.CutPct = 0;
Arg.MinPct = 0;
Arg.Start  = 20100820;

[A, B] = test_momentum(BigData, List, Compo, Arg);
sum(A(end,:)+B(end))

toc
