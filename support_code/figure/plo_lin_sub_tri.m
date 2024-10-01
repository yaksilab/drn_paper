function plo_lin_sub_tri(hax, win_len)
temp = get(hax, {'color', 'xlim', 'ylim'});
pos = hax.Position;
temp{4} = pos;
set(hax, 'color', 'none')
%
axx = axes({'color', 'xlim', 'ylim', 'Position'}, temp); % make axes
axx.Visible = 'off';
%
global lin_wid gra
plo_hor_lin(axx, 0, gra, lin_wid, '--')
plo_ver_lin(axx, 0, gra, lin_wid, '--')
plo_ver_lin(axx, win_len, gra, lin_wid, '--')
end
