function N = calc_n(High, Low, Before, Avg)

    TR = calc_true_range(High, Low, Before);
    N  = calc_ma(TR, Avg);

end
