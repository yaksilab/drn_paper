function [tex_sam, hax] = wri_sam_rat(tit_n_sam, gap_ver_row, mar_top, axh, gap_hor_col, ...
    pos_axe, num, lef_bia)
n_sam = length(tit_n_sam);
tex_sam = cell(n_sam, 1);
hax = axes('Units', 'Normal', 'Position', [0 0 1 1],'Visible', 'off', 'tag', 'suplabel');
x_loc = pos_axe{num}(1) - gap_hor_col(num - 1)/2;
axh = axh(1);
gap_ver = gap_ver_row(1);
for i = 1:n_sam
    y_loc = 1 - mar_top - (i - 1)*(axh + gap_ver) + gap_ver/2;

    %y_loc = 1 - mar_top - (i - 1)*2*(axh + gap_ver) + gap_ver/2; % !!!!!!!!!!!!!!!!!!!

    tex_sam{i} = text(hax, x_loc - lef_bia, y_loc, tit_n_sam{i}, ...
        'Units', 'normalized', 'HorizontalAlignment', ... % n_ani_sam{i} !!!!!!!!!!
        'center');
end
end