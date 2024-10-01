function [x_pix, y_pix, z_pix, dis_pix_pix] = ext_xyz_mic(x_pla_pix, y_pla_pix, z_pla_pix, dow_fac)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fun_pla = con_fil.fun_pla;
x_pix = [];
y_pix = [];
z_pix = [];
for pla_num = fun_pla.raw
    x_pix_tem = downsample(x_pla_pix{pla_num}, dow_fac);
    x_pix = [x_pix; x_pix_tem];
    y_pix_tem = downsample(y_pla_pix{pla_num}, dow_fac);
    y_pix = [y_pix; y_pix_tem];
    z_pix_tem = downsample(z_pla_pix{pla_num}, dow_fac);
    z_pix = [z_pix; z_pix_tem];
end
dis_pix_pix = squareform(pdist([x_pix y_pix z_pix]));
end
