function N = calc_n(High, Low, Before)

    TR = calc_true_range(High, Low, Before);
    N  = calc_ma(TR, 20);

end
