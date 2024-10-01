function sav_neu_res(dat_dir, sti_ons, sti_dur, bas_dur, pos_sti_dur, sti)

col_han_pos = [0.51 0.3 0.03 0.5];
ref_dur = 30;
fon_siz = 24;
min_sec = 60;

ani = dat_dir(10:14);

addpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Two_photon_data_analysis', '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure')
load([dat_dir,'\aligned\metadata.mat'])
neu_dir = [dat_dir '\aligned\alignment_plane1\*.mat'];
mat_fil = dir(neu_dir);
mat_dir_fil = [mat_fil.folder '\' mat_fil.name];
obj = matfile(mat_dir_fil);

fra_rat = round(1/metadata.timeStep);
sti_ons = sti_ons*min_sec;
res_dur = sti_dur + pos_sti_dur;
n_fra_ref = round(fra_rat*ref_dur);
n_fra_bas = round(fra_rat*bas_dur);
n_fra_res = round(fra_rat*res_dur);
n_tri = length(sti_ons);
dff = nan(metadata.dim(1), metadata.dim(2), n_tri);
for i = 1:n_tri
    sti_ons_i = sti_ons(i);
    sti_ons_i_fra = round(fra_rat*sti_ons_i);
    fra_num_bas_i = sti_ons_i_fra - n_fra_bas:sti_ons_i_fra;
    fra_num_res_i = sti_ons_i_fra:sti_ons_i_fra + n_fra_res;
    fra_bas_i = obj.im(:, :, fra_num_bas_i);
    fra_res_i = obj.im(:, :, fra_num_res_i);
    ima_bas_i = mean(fra_bas_i, 3);
    ima_res_i = mean(fra_res_i, 3);
    
    if i == 1
        fra_num_ref = sti_ons_i_fra - n_fra_ref:sti_ons_i_fra;
        fra_ref = obj.im(:, :, fra_num_ref);
        ima_ref = mean(fra_ref, 3);
    end

    dff_i = ((ima_res_i - ima_bas_i)./ima_bas_i)*100;
    dff_i = gaussian_filt(dff_i, 5, 1);
    dff(:, :, i) = dff_i;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%% plotting
fig
ax2 = subplot(2, 2, 1); ima(ima_ref); caxis([0 5000]); colormap (ax2, bone)
for i = 1:3
    dff_i = dff(:, :, i);
    ax1 = subplot(2, 2, i + 1); ima(dff_i); caxis([-10 40]); colormap (ax1, jet)
    if i == 1
        col_han = colorbar;
    end
end
col_han.Position = col_han_pos;
colorTitleHandle = get(col_han,'Title');
titleString = '% \DeltaF/F';
set(colorTitleHandle ,'String',titleString);
tit = [ani ' ' sti ' trials 1-3'];
wri_gen_tit(tit, fon_siz)
pre_for_exp(fon_siz)
export_fig(['X:\kadiram\Data\Processed\' ani '\' metadata.name '\' ani '_' metadata.name '_13'])

fig
ax2 = subplot(2, 2, 1); ima(ima_ref); caxis([0 5000]); colormap (ax2, bone)
for i = 4:6
    dff_i = dff(:, :, i);
    ax1 = subplot(2, 2, i - 2); ima(dff_i); caxis([-10 40]); colormap (ax1, jet)
    if i == 4
        col_han = colorbar;
    end
end
col_han.Position = col_han_pos;
colorTitleHandle = get(col_han,'Title');
set(colorTitleHandle ,'String',titleString);
tit = [ani ' ' sti ' trials 4-6'];
wri_gen_tit(tit, fon_siz)
pre_for_exp(fon_siz)
export_fig(['X:\kadiram\Data\Processed\' ani '\' metadata.name '\' ani '_' metadata.name '_46'])