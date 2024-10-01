function [eve_fra_cel, dff_dow_fra_cel] = ext_eve(fra_rat_cal, dff_fra_cel)
% Detect events taking into consideration all cells
global par
freqRatio = par.fps/fra_rat_cal;
[p, q] = rat(freqRatio); % final fps / original fps
dff_fra_cel = dff_fra_cel(~isnan(dff_fra_cel(:, 1)), :);
dff_dow_cel_fra = resample(dff_fra_cel, p, q)';
% QuickFix if needed
eve_fra_cel = identifySignifEvents_LL(dff_dow_cel_fra, par);
eve_fra_cel = rasterQuickFix(eve_fra_cel, par.rasterQuickFixMergingFrames, ...
    par.rasterQuickFixDeletingFrames);
dff_dow_fra_cel = dff_dow_cel_fra';
end