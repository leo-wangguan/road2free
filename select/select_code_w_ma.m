function Selected = select_code_w_ma(BigData, List, Avg, Offset)

    BigClose = BigData(end-Avg-Offset+1:end,5,:);
    Selected = zeros(List.FileLen, 2);

    for i = 1:List.FileLen

        Close = squeeze_data(BigClose(:,:,i));

        if ~isempty(Close)

            Ma = calc_ma(Close, Avg);
            Selected(i,1) = Close(end) > Ma(end);
            Selected(i,2) = length(Close);

            if Selected(i,1) && Selected(i,2) >= Avg

                disp_msg('IN', List.Abbr{i})

            end

        end

    end

end
