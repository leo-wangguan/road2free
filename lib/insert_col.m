function A = insert_col(A, Ins)

    [Row, Col] = size(A);

    if Ins > Col

        A = [A zeros(Row,Ins-Col)];

    else

        A = [A(:,1:Ins-1) zeros(Row,1) A(:,Ins:end)];

    end

end
