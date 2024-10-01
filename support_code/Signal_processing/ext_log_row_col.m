function log_row_col = ext_log_row_col(piv_row_col, high_in, low_in)
fig; hax = axes;
piv_row_col = imadjust(piv_row_col, [low_in high_in]);
sho_ima.gra(hax, piv_row_col)
roi = drawfreehand;
log_row_col = createMask(roi);
end
