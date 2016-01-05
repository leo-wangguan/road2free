function run_fuse_data()

    cd_to_top_level()

    load('./mat/List.mat')

    BigData = zeros(List.DateLen, List.ColLen, List.FileLen);

    disp_msg('IN', 'Fusing data ...')

    for i = 1:List.FileLen

        load(List.Conv{i})

        BigData(ismember(List.Date, Data(:,1)),:,i) = Data;

        BigDataS.(List.Abbr{i}) = mat2struct(BigData(:,:,i));

    end

    disp_msg('IN', 'Saving data ...')

    save('./mat/BigData', 'BigData', '-v7.3')

    save('./mat/BigDataS', 'BigDataS')

end

function S = mat2struct(Data)

    S.Date   = Data(:,1);
    S.Open   = Data(:,2);
    S.High   = Data(:,3);
    S.Low    = Data(:,4);
    S.Close  = Data(:,5);
    S.Before = Data(:,6);
    S.Vol    = Data(:,7);
    S.Amount = Data(:,8);
    S.Factor = Data(:,9);
    S.N      = Data(:,10);

end
