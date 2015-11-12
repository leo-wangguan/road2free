function cd_to_top_level()

    A = strsplit(pwd, '\');

    if ~strcmp(A(end), 'road2free')

        cd('../')

    end

end
