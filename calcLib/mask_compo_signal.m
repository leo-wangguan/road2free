function CompoSignal = mask_compo_signal(Compo, Date)

    % Set out date of current components to the last day.
    Compo(cellfun(@isempty, Compo(:,3)), 3) = {Date(end)};

    % Mask each entry with date.
    DateMask = cellfun(@(x, y) mask_date(Date, x, y - 1), Compo(:,2), Compo(:,3), 'uni', false);

    % Get unique and repetitive indices, sorted by abbreviations.
    [~, UniIdx, RepIdx] = unique(Compo(:,1));

    % Get indices of the same stock.
    Idx = arrayfun(@(x) find(x == RepIdx), 1:length(UniIdx), 'uni', false);

    % Combine date masks of the same stock.
    CompoSignal = cellfun(@(x) sum([DateMask{x}], 2), Idx, 'uni', false);
    CompoSignal = [CompoSignal{:}];

end
