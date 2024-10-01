function im = gen_imx(tif_dir)
tif_fil = dir([char(tif_dir) '/*.tif']);
n_ite = length(tif_fil);
im = [];
for i = 1:n_ite
    fil_pat = [tif_fil(i).folder '\' tif_fil(i).name];
    piv_row_col_fra = uint16(tiffreadVolume(fil_pat));
    im = cat(3, im, imrotate(piv_row_col_fra, 90)); %%%!!! dif
end
end
