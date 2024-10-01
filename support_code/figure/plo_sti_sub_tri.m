function plo_sti_sub_tri(hax, siz_win, end_poi_win, col_con)
temp = get(hax, {'color', 'xlim', 'ylim'});
pos = hax.Position;
temp{4} = pos;
set(hax, 'color', 'none')
%
axx = axes({'color', 'xlim', 'ylim', 'Position'}, temp); % make axes

axx.LineWidth = 0.5;

uistack(axx, 'bottom');
set(axx,'xtick',[],'ytick',[])
%
n_win = length(end_poi_win);

con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
c = con_fil.c;
for i = 1:n_win
    pat([end_poi_win(i) - siz_win(i) end_poi_win(i)], axx, c(col_con(i)));
end
end