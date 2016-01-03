function Share = get_share(Money, BuyPrice)
    Rem = rem(Money, BuyPrice*100);
    Rem(isnan(Rem)) = 0;
    Share = (Money-Rem)./BuyPrice;
    Share(Share==Inf) = 0;
end
