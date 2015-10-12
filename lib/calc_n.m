function N = calc_n(High, Low, Before, Avg)

    TR = calc_true_range(High, Low, Before);

    [~, N] = movavg(TR, 1, Avg);

end
