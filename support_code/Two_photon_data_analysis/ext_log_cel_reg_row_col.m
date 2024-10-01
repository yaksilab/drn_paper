function log_cel_reg_row_col = ext_log_cel_reg_row_col(cel_lab_tel_row_col, log_cel_reg)
global n_reg_for
log_cel_reg_row_col = cell(n_reg_for, 1);
for i = 4:n_reg_for
    cel_lab_reg_num = find(log_cel_reg(:, i));
    log_cel_reg_row_col{i} = ismember(cel_lab_tel_row_col, cel_lab_reg_num);
end
end