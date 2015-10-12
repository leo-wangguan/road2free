function NewData = downsample_data(Data, N)

    % Downsample data by squashing them with an integer rate.

    Len     = size(Data, 1);
    NewLen  = ceil(Len/N);
    NewData = Data(1:NewLen,:) * 0;

    for i = 1:NewLen

        Aux  = i * N;
        Idx1 = Aux - N + 1;
        Idx2 = ifelse(Aux < Len, Aux, Len);
        NewData(i,:) = squash_data(Data(Idx1:Idx2,:));

    end

    NewData(:,6) = [];
    NewData = refine_data(NewData);

end
