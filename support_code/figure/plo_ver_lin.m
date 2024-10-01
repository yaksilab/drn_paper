function h = plo_ver_lin(hax, obs_poi, col, lin_wid, lin_sty)
% PURPOSE: To draw vertical line
%---------------------------------------------------
% USAGE: h = plo_ver_lin(obs_poi, hax, col, lin_wid)
% where:
% obs = observations
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS:
% fig
% hax = axes;
% plot(cyc_num, res_rat)
% dra_ver_lin(cyc_num_las, hax)
%---------------------------------------------------

% Written by: Kadir Mutlu
n_obs = length(obs_poi);
y_lim = get(hax, 'YLim')';
y = repmat(y_lim, 1, n_obs);
x = [obs_poi'; obs_poi'];
h = line(hax, x, y, 'Color', col, 'LineWidth', lin_wid, 'LineStyle', lin_sty);
ylim(y_lim)
end
