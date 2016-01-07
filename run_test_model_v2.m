tic

clear

load('./mat/List.mat')
load('./mat/BigData.mat')

Start = 20140101;
End   = 20150101;

quant_signal = @quant_gushequ_signal;
Arg = {120};

NewData = test_model_v2(BigData, List, Start, End, ...
                             quant_signal, Arg);
Initial = 100000;
                         
Balance = calc_balance(Initial, NewData, List);
                         
toc