function [Max, Row, Col] = find_max_row_col_idx(A)

    % Find the max from a matrix and the corresponding row and column indices.

    [Max, I]   = max(A(:));
    [Row, Col] = ind2sub(size(A), I);

end