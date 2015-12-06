function [StartIdx, EndIdx] = find_seg_bounds(A)

    Aux = diff([0; (abs(A) >= eps); 0]);
    StartIdx = find(Aux > 0);
    EndIdx   = find(Aux < 0) - 1;

end
