tic

clear

load('./mat/List.mat')
load('./mat/BigData.mat')
load('./mat/Compo/399006_Compo.mat')

[BigData, BigHoldSignal] = prep(BigData, List, Compo);

quant_signal = @quant_pool_signal;

Arg.HoldSignal = BigHoldSignal;

[NewData, Summ] = test_model(BigData, List, quant_signal, Arg);

toc
