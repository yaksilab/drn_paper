fn = char("\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Raw\esp220\2022_10_20\" + ...
    "20221020_15_46_22_21_dpf_tph_nuc_220\suite2p\plane0\cro\file000_chan0_up.tif");
flims = [];
nPCs = [];
dsamp = [];
outputdir = char("\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Raw\esp220\2022_10_20\" + ...
    "20221020_15_46_22_21_dpf_tph_nuc_220\suite2p\plane0\cro");
badframes = 1;
[mixedsig, mixedfilters, CovEvals, covtrace, movm, movtm] = CellsortPCA(fn, flims, ...
    nPCs, dsamp, outputdir, badframes);
% figure; imagesc(squeeze(mixedfilters(:, :, 1)))
%
figure
PCuse = CellsortChoosePCs(fn, mixedfilters);