clear

DataList = ls('./mat');

for i = 3:size(DataList, 1)

    Name = DataList(i,:);
    load(Name)

    Date  = Data(:,1);
    High  = Data(:,3);
    Close = Data(:,5);
    Max   = extremum(@max, High, 20);

    if Close(end) > Max(end-1)
        
        disp(Name)
        disp(Date(end))
        disp(Close(end))

    end
    
end

