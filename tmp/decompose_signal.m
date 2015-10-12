function [BuySignal, SellSignal] = decompose_signal(Signal)

    % Signal     = [0 0 1 1 1 0 0 0 1 1 1 0 0]';
    %
    % BuySignal  = [0 0 1 0 0 0 0 0 1 0 0 0 0]'; 
    % SellSignal = [0 0 0 0 1 0 0 0 0 0 1 0 0]';
    
    A = [0; Signal(1:end-1)];
    B = [Signal(2:end); 0];
    BuySignal  = A < Signal;
    SellSignal = B < Signal; 

end
