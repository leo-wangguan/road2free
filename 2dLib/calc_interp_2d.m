function P = calc_interp_2d(A)

    P = arrayfun(@(x) calc_interp(A(:,x)), 1:size(A, 2), 'uni', false);
    P = [P{:}];

end
