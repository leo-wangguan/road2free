% run it as a script.

function run_get_index_data()

    clear

    cd_to_top_level()

    CodeList = ['000001'; '399005'; '399006'; '399933'];

    for i = 1:size(CodeList, 1)

        Code = CodeList(i,:);
        File = ['./mat/Index/INDEX_', Code, '.mat'];

        % File exist, update it.
        if exist(File, 'file') ~= 2

            init_data('INDEX', Code, 19900101, File)

        % File does not exist, initiate it.
        else

            update_data('INDEX', Code, File)

        end

    end

end
