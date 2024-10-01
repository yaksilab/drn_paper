function [poi_tri_lim, tri_len, tim_tri_fra, poi_bas_lim, n_poi_tri, tim_bas_fra, n_chu, poi_ind_tri, ...
    n_ipi, n_tri, poi_bas_ind_tri] = ext_poi_tri_lim(bas_win_len, sti_ons_tri, sam_rat, n_poi_ses, isi)
% not for beh vrs
% win_len: in sec
% sti_ons_tri: in sec
% n_poi: number of points in the session
% isi: in sec
n_tri = length(sti_ons_tri);
poi_tri_lim.fra = nan(n_tri, 2);
ifi = 1/sam_rat;
tri_len.int = fix(isi/ifi);

[bas_win_len, n_poi_bas, n_ipi] = ext_len(sam_rat, bas_win_len);% input rough, output exact
tim_tri_fra = (-bas_win_len:ifi:isi - bas_win_len)';
n_poi_tri = tri_len.int + 1;
tri_len.sec = ifi*tri_len.int;
poi_ind_tri = nan(n_poi_tri, n_tri);
poi_bas_ind_tri = nan(n_poi_bas, n_tri);
poi_tri = ext_poi_tri(sam_rat, sti_ons_tri);

%poi_tri = poi_tri - 3;%%%!!!!!!!!!!!!!!!!!!!!!

for tri = 1:n_tri
    poi_tri_lim.fra(tri, 1) = poi_tri(tri) - n_poi_bas;
    poi_tri_lim.fra(tri, 2) = poi_tri_lim.fra(tri, 1) + tri_len.int;
    poi_ind_tri(:, tri) = poi_tri_lim.fra(tri, 1):poi_tri_lim.fra(tri, 2);

    poi_bas_ind_tri(:, tri) = poi_tri_lim.fra(tri, 1):poi_tri(tri) - 1;
end
poi_tri_lim.sec = ifi*poi_tri_lim.fra;
n_chu = tri_len.int/n_ipi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% baseline
poi_bas_lim.fra = nan(1, 2);
tim_bas_fra = nan;
if ~isempty(sti_ons_tri)
    poi_bas_lim.fra(1) = poi_tri(1) - 2*n_ipi;
    poi_bas_lim.fra(2) = poi_bas_lim.fra(1) + n_ipi;
    %
    poi_bas_lim.sec = nan(1, 2);
    [tim_poi, ~] = cal_tim_poi(sam_rat, n_poi_ses);
    poi_bas_lim.sec(1) = tim_poi(poi_bas_lim.fra(1));
    poi_bas_lim.sec(2) = tim_poi(poi_bas_lim.fra(2));
    %%%%%%%%%%%%%%
    tim_bas_fra = tim_poi(poi_bas_lim.fra(1):poi_bas_lim.fra(2));
end
end
