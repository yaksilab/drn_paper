function sig_dif = dif_sig(sig, ord)

n_sam = length(sig);
ind = (1:n_sam)';
[sig_dif, ~] = b_spline_smooth(ind, sig, ind, ones(n_sam, 1), 2, ord);
end