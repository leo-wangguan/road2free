tic

% clear
% 
% load('./mat/List.mat')
% load('./mat/BigData.mat')

Start = 20100101;
End   = 20151231;

quant_signal = @quant_solo_ma_signal;
Arg = {20};

CutPct = -0.05;
LongStep = [0.2 * ones(1, 5); linspace(1, 1.2, 5)]';

[NewData, Summ] = test_model(BigData, List, Start, End, ...
                             quant_signal, Arg, CutPct, LongStep);

toc
