tic

clear

load('./mat/List.mat')
load('./mat/BigData.mat')

quant_signal = @quant_solo_ma_signal;

Arg.Avg = 20;
Arg.Offset = 20;
Arg.CutPct = -0.1;
Arg.LongStep = [0.2 * ones(1, 5); linspace(1, 1.2, 5)]';

Start = 20000101;
End   = 20151231;
CutData = cut_data(BigData, List.Date, Start, End, Arg.Offset);

[NewData, Summary] = test_model(CutData, List, quant_signal, Arg);

toc
