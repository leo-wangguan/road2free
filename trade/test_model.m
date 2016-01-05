function [NewData, Summary] = test_model(BigData, List, quant_signal, Arg)

    % Ensure the output of all models are able to calculate delta of each day.
    %
    % In general, one delta of a day is calculated by subtracting the close
    % price of the day before from that of the day, Close(i) - Before(i).
    %
    % If buy or sell happens at the end of a day, the price is approximately
    % equal to the close price.
    %
    % If buy or sell happens in the middle of a day, the corresponding price,
    % Close(i) or Before(i), must be updated.
    %
    % BuySignal  = [0 0 1 0 0 0 0 0 1 0 0 0 0]';
    % SellSignal = [0 0 0 0 1 0 0 0 0 0 1 0 0]';
    % HoldSignal = [0 0 1 1 1 0 0 0 1 1 1 0 0]';
    %
    % Data    = [Date Open High Low Close Before Vol Amount Factor N];
    %
    % ResData = [BuySignal SellSignal HoldSignal BuyPrice SellPrice LongRatio];

    NewData = zeros(size(BigData, 1), List.ResLen, List.FileLen);
    Summary = cell(List.FileLen, 1);

    for i = 1:List.FileLen

        [Data, Flag] = squeeze_data(BigData(:,:,i));

        if ~isempty(Data)

            ResData = quant_signal(Data, Arg);
            Summary{i} = calc_summary(Data, ResData);
            NewData(:,:,i) = restore_data(ResData, Flag);

        end

    end

    NewData = cat(2, BigData, NewData);

end
