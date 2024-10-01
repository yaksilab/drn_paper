function [h_fig, pro_win_sax_row_col, pro_row_col_win_ani] = AO_ploting_noveltank_heatmaps_over_fish(...
    all_fish, group, name)
pro_row_col_win_ani = nan([size(all_fish{group(1), 1}.novelPDF,1), size(all_fish...
    {group(1), 1}.novelPDF,2), 2, size(group,1)]); % 2 for before and after
for fish = 1:size(group,1)  
    pro_row_col_win_ani(:,:,1,fish) = all_fish{group(fish), 1}.novelPDF(:,:,1); %early
    pro_row_col_win_ani(:,:,2,fish) = all_fish{group(fish), 1}.novelPDF(:,:,2); %late
end
% now the averages
h_fig = figure('units','centimeters','Position',[2 2 30 10]);
subplot(1,2, 1)
imagesc(nanmean(pro_row_col_win_ani(:,:,1,:),4))
title(['Avg over Fish Early ', name]) 
colormap jet %hot
caxis([0 0.05])
colorbar
%
subplot(1,2, 2)
imagesc(nanmean(pro_row_col_win_ani(:,:,2,:),4))
title(['Avg over fish Late ', name])
colormap jet % hot
caxis([0 0.05])
colorbar
% kadir
pro_win_sax_row_col = {squeeze(nanmean(pro_row_col_win_ani(:,:,1,:),4)); squeeze(nanmean(...
    pro_row_col_win_ani(:,:,2,:),4))};
end
