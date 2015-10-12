function Duration = find_date_duration(Start, End, Date)

    Idx1 = find(Date >= Start, 1);
    Idx2 = find(Date <= End, 1, 'last');
    Duration = [zeros(Idx1-1, 1); ones(Idx2-Idx1+1, 1); zeros(length(Date)-Idx2, 1)];
    
end
