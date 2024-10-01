function [tim, seg, n_seg, n_sam_sig, tim_vec] = seg_sig(sam_rat, sig, seg_len)
% PURPOSE: segment signal
%---------------------------------------------------
% USAGE: [tim, seg, n_seg, n_sam_sig] = seg_sig(sam_rat, sig, len_seg)
% where:
% seg_len: segment length. Should be a power of 2. If you want fft.
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS:
%---------------------------------------------------

% Written by: Kadir Mutlu

[n_sam, n_sig] = size(sig);

% n_seg per individual signal
n_seg = fix(n_sam/seg_len);

% Pre-process X
rowindex = (1:seg_len)';
colindex = 1 + (0:(n_seg - 1))*seg_len;
seg = nan(seg_len, n_seg, n_sig);

% n_sam in the new signal
n_sam_sig = seg_len*n_seg;

% colindex already takes into account the noverlap factor; Return a T
% vector whose elements are centered in the segment.
tim = ((colindex - 1) + seg_len/2)'/sam_rat;

tim_vec = cell2mat(arrayfun(@colon, colindex', (colindex + seg_len - 1)', 'Uniform', false))/sam_rat;
% 75x20

% Put x into columns of xin with the proper offset
for i = 1:n_sig
    sig_i = sig(:, i);
    % the end residues of the signal are sacrified %%%%%%%%%%%%%%%
    seg((i - 1)*n_sam_sig + 1:i*n_sam_sig) = sig_i(rowindex(:, ones(1, n_seg)) + colindex(ones(...
        seg_len, 1), :) - 1);
end
