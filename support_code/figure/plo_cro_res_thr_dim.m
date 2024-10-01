function plo_cro_res_thr_dim(res_typ_cel_sti, tit, fon_siz, siz)
x_axi = 3;
y_axi = 2;
z_axi = 1;
%siz = 15;
sti = {'Light (\Delta(\DeltaF/F))', 'Shock (\Delta(\DeltaF/F))', 'Tap (\Delta(\DeltaF/F))'};
col = ["blue"; "brown (traditional)"; "black"; "magenta"];
c = @cmu.colors;
n_typ_tot = 7;
tra = 0.4;
for i = 1:n_typ_tot
    if i < 4
        scatter3(res_typ_cel_sti{i}(:, x_axi), res_typ_cel_sti{i}(:, y_axi), res_typ_cel_sti{i}(:, z_axi), siz, c(col(i)), 'filled', 'MarkerFaceAlpha', tra)
    else
        scatter3(res_typ_cel_sti{i}(:, x_axi), res_typ_cel_sti{i}(:, y_axi), res_typ_cel_sti{i}(:, z_axi), siz, c(col(4)), 'filled', 'MarkerFaceAlpha', tra)
    end
    hold on
end
% xlabel(sti{x_axi}, 'FontSize', fon_siz)
% ylabel(sti{y_axi}, 'FontSize', fon_siz)
% zlabel(sti{z_axi}, 'FontSize', fon_siz)
% title(tit)
end