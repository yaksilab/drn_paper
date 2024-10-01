classdef plo_sha
    %PLO_SHA - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   PLO_SHA constructor syntax:
    %       PLO_SHA_OBJ = PLO_SHA()
    %
    %   PLO_SHA properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   PLO_SHA methods/functions:
    %       Method 1 - description
    %       Method 2 - description
    %
    %   Examples: 
    %       Line 1 of example
    %       Line 2 of example
    %       Line 3 of example
    %
    %   Other m-files required: none
    %   MAT-files required: none
    %
    %   See also: OTHER_CLASS_NAME1,  OTHER_CLASS_NAME2

    %   Author: Aytac Kadir Mutlu
    %   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
    %   email: kadir.a.mutlu@ntnu.no
    %   Website: https://www.ntnu.edu/kavli
    %   Date: 04-Aug-2023; Last revision: 04-Aug-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function h_plo = fun(hax, tim_poi, mea_poi_con, sem_poi_con, col_con)
            h_plo = plo_sha_fun(hax, tim_poi, mea_poi_con, sem_poi_con, col_con);
        end

        function [h_plo, ind_var_pea] = raw(hax, tim_poi, var_poi_uni, col)
            col_con = {col};
            [mea_poi.raw, sem_poi.raw, ~] = cal_mea_poi(var_poi_uni);
            [~, ind_var_pea] = findpeaks(mea_poi.raw, 'NPeaks', 1);
            h_plo = plo_sha_fun(hax, tim_poi, mea_poi.raw, sem_poi.raw, col_con);
        end

        function [h_plo, ind_var_pea] = smo_tri(hax, tim_poi, var_poi_uni, col, n_fra_bas, n_fra_smo)
            col_con = {col};
            [mea_poi.raw, sem_poi.raw, ind_var_pea] = cal_mea_poi(var_poi_uni);
            mea_poi.smo = smo_sam_poi_var(mea_poi.raw, n_fra_bas, n_fra_smo);
            sem_poi.smo = smo_sam_poi_var(sem_poi.raw, n_fra_bas, n_fra_smo);
            h_plo = plo_sha_fun(hax, tim_poi, mea_poi.smo, sem_poi.smo, col_con);
        end
        
        function [h_plo, ind_var_pea] = smo_gen(hax, tim_poi, var_poi_uni, col, n_fra)
            col_con = {col};
            [mea_poi.raw, sem_poi.raw, ~] = cal_mea_poi(var_poi_uni);
            [~, ind_var_pea] = findpeaks(mea_poi.raw, 'NPeaks', 1);
            met = 'sgolay';
            mea_poi.smo = smoothdata(mea_poi.raw, met, n_fra);
            sem_poi.smo = smoothdata(sem_poi.raw, met, n_fra);
            h_plo = plo_sha_fun(hax, tim_poi, mea_poi.smo, sem_poi.smo, col_con);
        end
    end

end

function lin_con = plo_sha_fun(hax, tim_poi, mea_poi_con, sem_poi_con, col_con)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: h = plo_sha(obs, mea, sem, col);
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: inputs to obs_pat = [obs fliplr(obs)] should be row vectors.
% even if i concatenate column vectors, i get triangles.
%---------------------------------------------------
 
% Written by: Kadir Mutlu
[~, n_con] = size(mea_poi_con);
lin_con = [];
%
obs_sam = tim_poi';
mea_con_sam = mea_poi_con';
sem_con_sam = sem_poi_con';
for i = 1:n_con
 amp_sam = mea_con_sam(i, :);
 lin = plot(hax, obs_sam, amp_sam, 'color', col_con{i});
 lin_con = [lin_con lin];
 %
 if sum(~isnan(amp_sam)) > 0
 [n_seg, log_sam_seg] = com_n_seg(amp_sam');% for nan issue, corr vs dist
 sem_sam = sem_con_sam(i, :);
 for j = 1:n_seg
 log_sam = log_sam_seg(:, j)';
 sem_seg_sam = sem_sam(log_sam);
 if sum(sem_seg_sam) ~= 0
 obs_seg_sam = obs_sam(log_sam);
 obs_pat = [obs_seg_sam fliplr(obs_seg_sam)];
 amp_seg_sam = amp_sam(log_sam);
 mea_pat = [amp_seg_sam + sem_seg_sam fliplr(amp_seg_sam - sem_seg_sam)];
 hold(hax,'on')
 patch(hax, obs_pat, mea_pat, col_con{i}, 'edgecolor', 'none', 'FaceAlpha', 0.2)
 end
 end
 end
end
xlim(hax, [min(tim_poi) max(tim_poi)])
box(hax, 'off')
end
