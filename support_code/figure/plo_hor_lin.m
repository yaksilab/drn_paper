function lin = plo_hor_lin(hax, res, col, lin_wid, lin_sty)
% PURPOSE: To draw horizontal line
%---------------------------------------------------
% USAGE: lin = plo_hor_lin(res, hax, col, lin_wid, lin_sty)
% where:
% obs = observations
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS:
% fig;
% hax = axes;
% plot(cyc_num, res_rat)
% dra_ver_lin(cyc_num_las, hax)
%---------------------------------------------------

% Written by: Kadir Mutlu

lin = line(hax, get(hax, 'XLim'), [res res], 'Color', col, 'LineWidth', lin_wid, ...
    'LineStyle', lin_sty);
