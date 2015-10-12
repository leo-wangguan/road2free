function Signal = delay_signal(Signal, Int)
    
    % Signal = [0 0 1 1 0 0 1 1 1 0 0 1]';
    % Int    = 2;
    %
    % Signal = [0 0 0 0 1 1 0 0 1 1 1 0]';
    
    Signal = [zeros(Int, 1); Signal(1:end-Int,:)];
    
end