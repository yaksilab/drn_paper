function [sam_row_col, ind_row] = sor_mat(tim_poi, sam_row_col, res_dur)
% input: _fra_cel
sam_row_col = sam_row_col';
if size(sam_row_col, 1) == 0
    ind_row = sam_row_col;
else
    tim_poi = tim_poi';
    log_dur = tim_poi > 0 & tim_poi < res_dur;
    mat_dur = sam_row_col(:, log_dur);
    mea_dur = mean(mat_dur, 2);
    [~, ind_row] = sort(mea_dur, 'descend'); %%%
    sam_row_col = sam_row_col(ind_row, :);
end
end