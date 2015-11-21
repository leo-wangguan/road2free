% run it as a script.

function run_get_index_data()

    CodeList = ['000001'; '399005'; '399006'];

    for i = 1:size(CodeList, 1)

        Code = CodeList(i,:);
        File = ['./mat/INDEX_', Code, '.mat'];

        if exist(File, 'file') ~= 2

            disp_msg('IN', 'Initiating data ...')

            init_data('INDEX', Code, '19900101', File)

        else

            disp_msg('IN', 'Updating data ...')

            update_data('INDEX', Code, File)

        end

    end

end
