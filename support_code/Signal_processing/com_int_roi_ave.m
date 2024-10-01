function int_roi_ave = com_int_roi_ave(mas_roi, int_row_col)
mas_roi_dou = double(mas_roi);
mas_roi_dou(~mas_roi) = nan;
int_roi_row_col = mas_roi_dou.*int_row_col;
int_roi_ave = mean(int_roi_row_col, 'all', 'omitnan');
end
