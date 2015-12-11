function TR = calc_true_range(High, Low, Before)

    A = High - Low;
    B = High - Before;
    C = Before - Low;

    TR = max([A, B, C], [], 2);

end