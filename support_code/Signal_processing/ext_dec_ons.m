function [dec_ons, amp_dec_ons] = ext_dec_ons(sig, dec_onx_thr, dec_off_thr)
% PURPOSE: extract inhalation signal from one pixel
%---------------------------------------------------
% USAGE: [inh_sig, inh_ons_off, inh_amp, inh_seg] = ext_inh_sig_pix(sig)
% where: varargin = vector of input variables
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

dif_onx_thr = -dec_onx_thr;
dif_off_thr = -dec_off_thr;

% find points of decrease
dif_sig = diff(sig);
log_dec = [dif_sig <= dif_onx_thr; false];
fra_num_onx = find(log_dec);

% eliminate following points of decrease
n_onx = length(fra_num_onx);
if n_onx > 1
    zer_onx = zeros(n_onx, 1);
    zer_onx(1) = 1;
    for i = 2:n_onx % comparing with the previous one
        pre_fra_num_onx = fra_num_onx(i - 1);
        cur_fra_num_onx = fra_num_onx(i);
        dif_sig_bet = dif_sig(pre_fra_num_onx:cur_fra_num_onx);
        log_dif = dif_sig_bet >= dif_off_thr;
        if sum(log_dif) > 0
            zer_onx(i) = 1;
        end
    end
    log_coo = logical(zer_onx);
    dec_ons = fra_num_onx(log_coo);
else
    dec_ons = fra_num_onx;
end
amp_dec_ons = sig(dec_ons);