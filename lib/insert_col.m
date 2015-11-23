function A = insert_col(A, Ins)

    [Row, Col] = size(A);

    A = ifelse(Ins > Col, [A zeros(Row,Ins-Col)], ...
                          [A(:,1:Ins-1) zeros(Row,1) A(:,Ins:end)]);

end
