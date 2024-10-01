function [hax_sub, pos_axe, hei, las_pix, rat_wid] = tight_subplot_sca(n_row, n_col, gap_ver, ...
    gap_hor_col, mar_pol, mar_sid, asp_rat_axe, fig_wid, fig_hei, sca_axe, n_pix_ext)

% tight_subplot creates "subplot" axes with adjustable gaps and margins
%
% [ha, pos] = tight_subplot(Nh, Nw, gap, marg_h, marg_w)
%
%   in:  Nh      number of axes in hight (vertical direction)
%        Nw      number of axes in width (horizontaldirection)
%        gap     gaps between the axes in normalized units (0...1)
%                   or [gap_h gap_w] for different gaps in height and width
%        marg_h  margins in height in normalized units (0...1)
%                   or [lower upper] for different lower and upper margins 
%        marg_w  margins in width in normalized units (0...1)
%                   or [left right] for different left and right margins 
%
%  out:  ha     array of handles of the axes objects
%                   starting from upper left corner, going row-wise as in
%                   subplot
%        pos    positions of the axes objects; cell array
%
%  Example: ha = tight_subplot(3,2,[.01 .03],[.1 .01],[.01 .01])
%           for ii = 1:6; axes(ha(ii)); plot(randn(10,ii)); end
%           set(ha(1:4),'XTickLabel',''); set(ha,'YTickLabel','')

% Pekka Kumpulainen 21.5.2012   @tut.fi
% Tampere University of Technology / Automation Science and Engineering

hei = (1 - sum(mar_pol) - (n_row - 1)*gap_ver)/n_row;
hei_axe = hei*sca_axe;
dis_asp_rat = fig_wid/fig_hei;
wid_axe = (hei_axe.*asp_rat_axe)/dis_asp_rat; % width based on height.

mar_top = mar_pol(2);
y_pos = 1 - mar_top - hei;%%%%%%%%%% work here

ii = 0;
for ih = 1:n_row
    px = mar_sid(1);
    for ix = 1:n_col
        ii = ii+1;
        hax_sub(ii) = axes('Units', 'normalized', 'Position', [px y_pos wid_axe(ii) hei_axe(ii)], ...
            'XTickLabel', '', 'YTickLabel', '');
        px = px + wid_axe(ii) + gap_hor_col(ix);
    end
    y_pos = y_pos-hei-gap_ver;
end
if nargout > 1
    pos_axe = get(hax_sub, 'Position');
end
hax_sub = hax_sub(:);
[las_pix, rat_wid] = ext_las_pix(pos_axe, fig_wid, n_pix_ext);
