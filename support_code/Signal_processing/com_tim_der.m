function sig_tim_der = com_tim_der(tim, sig, ord)
n_sam = length(sig);
[sig_tim_der, ~] = b_spline_smooth(tim, sig, tim, ones(n_sam, 1), 2, ord); % cubic splines
end