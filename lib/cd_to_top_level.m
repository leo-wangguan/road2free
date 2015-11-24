function cd_to_top_level()

    A = strsplit(pwd, '\');

    for i = length(A):-1:1

        if strcmp(A(i), 'road2free')

            cd(strjoin(A(1:i),'\'))

        end

    end

end
