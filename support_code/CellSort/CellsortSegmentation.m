function [ica_segments, segcentroid, seg_num_icx_num, log_icx_row_col, ica_filtersbw, ...
    ica_filters, ica_filters_use, ica_filters_fil, bin_row_col, n_roi, log_roi_row_col] = ...
    CellsortSegmentation(ica_filters, smwidth, thresh, arealims, plotting, log_row_col, mas_row_col)
% [ica_segments, segmentlabel, segcentroid] = CellsortSegmentation(ica_filters, smwidth, ...
% thresh, arealims, plotting)
%
%CellsortSegmentation
% Segment spatial filters derived by ICA
%
% Inputs:
%     ica_filters - X x Y x nIC matrix of ICA spatial filters
%     smwidth - standard deviation of Gaussian smoothing kernel (pixels)
%     thresh - threshold for spatial filters (standard deviations)
%     arealims - 2-element vector specifying the minimum and maximum area
%     (in pixels) of segments to be retained; if only one element is
%     specified, use this as the minimum area
%     plotting - [0,1] whether or not to show filters
%
% Outputs:
%     ica_segments - segmented spatial filters
%     segmentabel - indices of the ICA filters from which each segment was derived
%     segcentroid - X,Y centroid, in pixels, of each segment
%
% Eran Mukamel, Axel Nimmerjahn and Mark Schnitzer, 2009
% Email: eran@post.harvard.edu, mschnitz@stanford.edu
%
[nic,pixw,pixh] = size(ica_filters);
ica_filters_orig = ica_filters/abs(std(ica_filters(:)));
ica_filters = (ica_filters - mean(ica_filters(:)))/abs(std(ica_filters(:)));% z-score
if smwidth > 0
    % Smooth mixing filter with a Gaussian of s.d. smwidth pixels
    smrange = max(5,3*smwidth);
    [x,y] = meshgrid(-smrange:smrange);
    smy = 1; smx = 1;
    ica_filtersfilt = exp(-((x/smx).^2 + (y/smy).^2)/(2*smwidth^2));
    ica_filtersfilt = ica_filtersfilt/sum(ica_filtersfilt(:));
    ica_filtersbw = false(pixw,pixh,nic);
    for j = 1:size(ica_filters, 1)
        ica_filters_use = ica_filters(j,:,:);
        
        ica_filters_use = (ica_filters_use - mean(ica_filters_use(:)))/abs(std(ica_filters_use(:)));
        %z-score % squeezed ica_filters, ess. identical

        ica_filters_fil = imfilter(ica_filters_use, ica_filtersfilt, 'replicate', 'same');
        ica_filters_fil(mas_row_col) = 0;
        ica_filtersbw(:,:,j) = ica_filters_fil > thresh | ica_filters_fil < -thresh;
    end
else
    ica_filters_per = permute(ica_filters, [2 3 1]);
    ica_filtersbw = ica_filters_per > thresh | ica_filters_per < -thresh;
    ica_filtersfilt = 1;
end

if plotting
    clf
    set(gcf,'Color','w')
    colormap(gray)
    
    subplot(223)
    imagesc(squeeze(sum(ica_filters,1)))
    axis image off
    hold on
end
ica_segments = [];
k = 0;% cumulative n_roi
segcentroid = [];

seg_num_icx_num = cell(nic, 1);
log_icx_row_col = cell(1, nic);
for icx = 1:nic
    bin_row_col = squeeze(ica_filtersbw(:,:,icx)).*log_row_col;
    L = bwlabel(bin_row_col, 4);
    Lu = 1:max(L(:));
    % Delete small components
    Larea = struct2array(regionprops(L, 'area'));
    Lcent = regionprops(L, 'Centroid');
    
    if length(arealims)==2
        Lbig = Lu( (Larea >= arealims(1))&(Larea <= arealims(2)));
        Lsmall = Lu((Larea < arealims(1))|(Larea > arealims(2)));
    else
        Lbig = Lu(Larea >= arealims(1));
        Lsmall = Lu(Larea < arealims(1));
    end
    
    L(ismember(L,Lsmall)) = 0;
    n_roi = length(Lbig);
    for roi = 1:n_roi
        segcentroid(roi + k,:) = Lcent(Lbig(roi)).Centroid;
    end
    
    seg_num_icx_num{icx} = nan(n_roi, 1);
    ica_filters_use = squeeze(ica_filters_orig(icx,:,:));
    for roi = 1:n_roi
        ica_segments(roi + k,:,:) = ica_filters_use .* ( 0*(L==0) + (L==Lbig(roi)) );% ExcludeBackground
        seg_num_icx_num{icx}(roi) = roi + k;
    end
    k = size(ica_segments, 1);

    % segments: top to bottom stacks, nose facing left
    log_icx_row_col{icx} = logical(squeeze(sum(ica_segments(seg_num_icx_num{icx}, :, :), 1)));

    if icx == 1
        log_roi_row_col = cell(n_roi, 1);
        for roi = 1:n_roi
            log_roi_row_col{roi} = logical(squeeze(ica_segments(roi, :, :)));
        end
    end
end

end
