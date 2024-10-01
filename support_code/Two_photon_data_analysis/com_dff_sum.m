function roi_t = com_dff_sum(fra_rat, roi_t)
% sumbre
% basline computation laetitia
% compute F0
traces = roi_t.traces;
% Sumbre way
cfg = [];
cfg.fps = fra_rat;
cfg.F0method = 'sumbre'; % 'sumbre' or 'trad' (in small letters)
cfg.tauDecay = 2; % seconds, for GCamp6s
F0 = computationF0_LL(traces, cfg);
roi_t.sumbreF0 = F0;
roi_t.F0method = cfg.F0method;
% compute DFF
DFF = ((traces - F0)./F0)*100;
roi_t.DFF = DFF;
end