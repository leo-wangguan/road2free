function Balance = calc_balance(Initial, Data, List)
NumDay = size(Data,1);
Len = size(Data,3);
% Balace =
%          Cash1  Close1 ShareList1  Totoal1  StockList1  Date1
%          Cash2  Close2 ShareList2  Totoal2  StockList2  Date2
%           ...     ...      ...
Balance = cell(NumDay,6);

for i = 1:NumDay
    BuyPrice = Data(i,11,:) .* Data(i,13,:);
    BuyPrice = permute(BuyPrice, [3,2,1]); % convert from 3 dimention to 2 dimention
    SellPrice = Data(i,12,:) .* Data(i,14,:);
    SellPrice = permute(SellPrice, [3,2,1]); % convert from 3 dimention to 2 dimention
    NumBuy = length(BuyPrice(BuyPrice>0));
    NumSell = length(SellPrice(SellPrice>0));
    Close = Data(i,5,:);
    Close = permute(Close, [3,2,1]);% convert from 3 dimention to 2 dimention
    
    if i==1
        Balance{i,1} = Initial;
        Balance{i,3} = zeros(Len,1);
    else
        Balance{i,1} = Balance{i-1,1};
        Balance{i,3} = Balance{i-1,3};
    end
    Balance{i,2} = Close;
        
    % Buy
    if (NumBuy~=0) % && (isempty(Balance{i,3}(Balance{i,3}>0)))
        Each = ones(Len,1) * (Balance{i,1}/NumBuy);
        ShareList = get_share(Each, BuyPrice*(1+0.0003));
        Cost = sum(BuyPrice*(1+0.0003) .* ShareList);
        Balance{i,1} = Balance{i,1} - Cost;
        Balance{i,3} = Balance{i,3}+ ShareList;
    end
 
    % Sell
    if (NumSell ~= 0) && (i ~=1)
        Earn = sum(Balance{i-1,3} .* SellPrice)*(1-0.0003-0.001);
        Balance{i,1} = Balance{i,1} + Earn;
        Balance{i,3} = Balance{i,3} - Balance{i-1,3} .* logical(SellPrice);
    end
 
    Balance{i,4} = Balance{i,1} + sum(Balance{i,2} .* Balance{i,3});
    Balance{i,5} = get_stock_name_from_index(find(Balance{i,3}>0),List);
    Balance{i,6} = Data(i,1,1);
end

end
