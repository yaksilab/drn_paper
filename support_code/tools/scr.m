load(exp_fil)
tim_lvx = locs/sam_rat;
dif_tim_lvx = diff(tim_lvx);
dif_eve_tim = diff(eve_tim);
[dif_tim_lvx(1:406) dif_eve_tim]
dif_tim_lvx(1:406) - dif_eve_tim

for i = 1:n_tri
    res_per_max = max(diff(tri(i).inh_ons_raw))
end

ses = '171128_KM003';
exp_fil = ['Exp_' ses];
load(exp_fil, 'n_tri', 'hab_seq_ind')
n_trials = n_tri - length(hab_seq_ind);
save(exp_fil, 'n_trials', '-append')

exp_dir_fil = 'Exp_171216_KM004';
cel_num = 7;

[inh_ons_raw_i inh_ons_i]

[~, spi_cel_abs] = processDataFromscGUI_NLX_kad(fullfile(clu_dir), 'N2T-A1x32-poly2s-5mm-50-177', 4500, {'vta'}, {14}, 20.0); %*****  tsv! _kad 

del = inh_ons_raw_tri{1}(1) - inh_ons_tri{1}(1)

n_tri = length(cat_tri);
n_cel = length(spi_tra_cel_tri);
n_cat = max(cat_tri);
n_odo = max(odo_ind_tri);

log_tri_cat_j = cat_tri == j;
log_tri_odo_j = odo_ind_tri == j;

spi_tra_cel_cat_tri{}{}{}

save(exp_dir_fil, 'spi_tra_cel_tri', 'spi_tra_cel_cat_tri', 'spi_tra_cel_odo_tri', '-append')

spi_cel_i_j_adj = spi_cel_i_j(spi_cel_i_j > -sti_ons_min & spi_cel_i_j < max_pos_sti_per); % i-cell, j-trial.adjustment for display, onden arkadan kirpma



t = linspace(10,34);
y = [20+5*sin(2*pi*3*t/24)+2*randn(1,100);  60+5*cos(2*pi*3*t/24)+2*randn(1,100)];
fig;
plot(t, y)
hold on
plot([12; 12], [-40; -20], '-k',  [12; 22], [-40; -40], '-k', 'LineWidth', 2)
hold off
axis([[10  34]    -60  140]) % positioning of the scale bar
text(11.8,-30, '10 mA', 'HorizontalAlignment','right')
text(17,-45, '10 ms', 'HorizontalAlignment','center')
set(gca, 'Visible', 'off')

sum(odo_ind_tri == 5)

[cou_bas_cel cou_sti_cel]


odo_pie(end).Position = [0.176762037665567 1.18690993004537 0];

odo_pie(end).Position = [0.3 1.07 0];