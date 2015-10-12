function IndexData = f_get_hist_index_data(Code, Start, End)

    % Get index data with a column represents before close price.
    %
    % IndexData = [Date Open High Low Close Before Vol Amount Factor];

    IndexData = GetIndexTSDay_Web(Code, Start, End);
    IndexData(:,8) = 1;
    IndexData = refine_data(IndexData);

end