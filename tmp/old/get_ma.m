function Ma = get_ma(Close, Avg)

    [~, Ma] = movavg(Close, 1, Avg);

end