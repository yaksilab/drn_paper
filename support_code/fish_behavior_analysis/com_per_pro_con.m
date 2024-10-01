function [per_pro_con, log_tri_con] = com_per_pro_con(n_con, bea_lat_tri, lat_thr)
per_pro_con = nan(n_con, 1);
n_tri = length(bea_lat_tri);
n_tri_con = n_tri/n_con;
log_tri_con = nan(n_tri_con, n_con);
for i = 1:n_con
    bea_lat_ani_tri_i = bea_lat_tri((i - 1)*n_tri_con + 1:i*n_tri_con);
    log_bea_lat_tri_i = bea_lat_ani_tri_i < lat_thr;
    log_tri_con(:, i) = log_bea_lat_tri_i;
    n_res_i = sum(log_bea_lat_tri_i);
    per_pro_con(i) = 100*(n_res_i/n_tri_con);
end
end