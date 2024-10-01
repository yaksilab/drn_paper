function [inc_ons, amp_inc_ons] = ext_inc_ons(sig, inc_onx_thr, inc_off_thr)
% PURPOSE: extract heating
%---------------------------------------------------
% USAGE: [inc_ons, amp_inc_ons] = ext_inc_ons(sig, inc_onx_thr, inc_off_thr)
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

% find points of increase
dif_sig = diff(sig);
log_inc = [dif_sig >= inc_onx_thr; false];
fra_num_on = find(log_inc);

% eliminate following points of increase
n_on = length(fra_num_on);
if n_on > 1
    zer_on = zeros(n_on, 1);
    zer_on(1) = 1;
    for i = 2:n_on
        pre_fra_num_on = fra_num_on(i - 1);
        cur_fra_num_on = fra_num_on(i);
        dif_sig_bet = dif_sig(pre_fra_num_on:cur_fra_num_on);
        log_dif = dif_sig_bet <= inc_off_thr;
        if sum(log_dif) > 0
            zer_on(i) = 1;
        end
    end
    log_hea = logical(zer_on);
    inc_ons = fra_num_on(log_hea);
else
    inc_ons = fra_num_on;
end
amp_inc_ons = sig(inc_ons);