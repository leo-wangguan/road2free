function cd_to_top_level()

    A   = strsplit(pwd, '\');
    End = find(strcmp(A, 'road2free'));

    cd(strjoin(A(1:End), '\'))

end
