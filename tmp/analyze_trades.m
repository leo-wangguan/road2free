function analyze_trades(Date, Duration, StartIdx, EndIdx, ...
            Signal, BuyPrice, SellPrice, Buy, Sell)
    
    [BuyDate, SellDate, BuyPrice, SellPrice] = ...
             get_trades_info(Date, Buy, Sell, BuyPrice, SellPrice);

    table(num2str(BuyDate),num2str(SellDate),BuyPrice,SellPrice)
    
end

function [BuyDate, SellDate, BuyPrice, SellPrice] = ...
             get_trades_info(Date, Buy, Sell, BuyPrice, SellPrice)
   
    BuyDate = Date(Buy);
    SellDate = Date(Sell);
    BuyPrice = BuyPrice(Buy);
    SellPrice = SellPrice(Sell);
    
    if length(BuyDate) - length(SellDate) == 1
        
        SellDate  = [SellDate;  nan];
        SellPrice = [SellPrice; nan];
        
    end
    
end