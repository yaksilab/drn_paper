function ave_amp_uni_win = com_ave_amp_uni_win(tim_poi, sam_poi_uni, pha_win_len)
% elapsed time
log_bas = tim_poi < 0;
log_pha = tim_poi > 0 & tim_poi < pha_win_len;% both borders not taken !!!
log_ton = tim_poi > pha_win_len;
%
ave_amp_uni_win(:, 1) = mean(sam_poi_uni(log_bas, :), 'omitnan');% tried, dimensions work
ave_amp_uni_win(:, 2) = mean(sam_poi_uni(log_pha, :), 'omitnan');
ave_amp_uni_win(:, 3) = mean(sam_poi_uni(log_ton, :), 'omitnan');
end
