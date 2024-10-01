function per_pro_ani = com_per_pro_ani(bea_lat_ani_tri, lat_thr)
[~, n_tri] = size(bea_lat_ani_tri);
log_bea_lat_ani_tri = bea_lat_ani_tri <= lat_thr;
n_res_ani = sum(log_bea_lat_ani_tri, 2);
per_pro_ani = 100*(n_res_ani/n_tri);
end