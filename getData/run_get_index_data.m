function run_get_index_data()

    cd_to_top_level()

    CodeList = ['000001'; '399005'; '399006'; '399933'; '399300'];

    for i = 1:size(CodeList, 1)

        Code = CodeList(i,:);
        File = ['./mat/Index/INDEX_', Code, '_Raw.mat'];

        % File exist, update it.
        if exist(File, 'file') == 2

            update_data('INDEX', Code, File)

        % File does not exist, initiate it.
        else

            init_data('INDEX', Code, 19900101, File)

        end

    end

end
