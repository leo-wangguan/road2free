function cd_to_top_level()

    A = strsplit(pwd, '\');
    Len = length(A);

    for i = Len:-1:1

        if strcmp(A(i), 'road2free')

            if i == Len

                return

            else

                cd(repmat('../', 1, Len-i))

                return

            end

        end

    end

end
