function Signal = get_ma2_signal(Arg)
    
    Close   = Arg{1}{:,5};
    AvgBuy  = Arg{2};
    AvgSell = Arg{3};

    [~, Ma1]  = movavg(Close, 1, AvgBuy);
    [~, Ma2] = movavg(Close, 1, AvgSell);
    
    Signal = get_final(Close > Ma1, Close > Ma2);
    Signal = [0; Signal(1:end-1,:)];
    
end

function Signal = get_final(S1, S2)

    Signal = zeros(length(S1), 1);
    A = [0; S1(1:end-1)];
    B = [0; S1(2:end)];
    C = [0; S2(1:end-1)];
    D = [0; S2(2:end)];
    
    Rising1  = find(A<B);
    Falling1 = find(A>B);
    Falling2 = find(C>D);
    
    for i = 1:length(Rising1)
        Start = Rising1(1);
        Rising1(1) = [];
        Falling1(Falling1 < Start) = [];
        Falling2(Falling2 < Start) = [];
        End = min([Falling1(1) Falling2(1)]) - 1;
        Signal(Start:End) = 1;
    end

end

% to be optimized