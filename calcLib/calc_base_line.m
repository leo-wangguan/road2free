function Base = calc_base_line()

    load('./mat/Index/INDEX_000001_Raw.mat')

    Base1 = Data(:,5) > calc_ma(Data(:,5), 20);
    Idx1  = find(Data(:,1) < 20130101, 1, 'last');

    load('./mat/Index/INDEX_399006_Raw.mat')

    Base2 = Data(:,5) > calc_ma(Data(:,5), 20);
    Idx2  = find(Data(:,1) >= 20130101, 1);

    Base = [Base1(1:Idx1); Base2(Idx2:end)];

end
