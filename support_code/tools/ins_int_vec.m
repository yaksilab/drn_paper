function ele_ind = ins_int_vec(ele_ind, ele_ins_num, ind_ins_num)
% PURPOSE: insert into vector
%---------------------------------------------------
% USAGE: vec_ins = ins_int_vec(vec, ele, ind)
% where:
% vec = vector
% ele = element
% ind = index
%---------------------------------------------------
% RETURNS:
% vec_ins = vector inserted
% --------------------------------------------------
% SEE ALSO:
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: km

[ind_ins_num, ind_sor_num] = sort(ind_ins_num);
n_ind_ins = length(ind_ins_num);
ele_ins_num = ele_ins_num(ind_sor_num);
for i = 1:n_ind_ins
    ele_ind = ins_int_vec_sin(ele_ind, ele_ins_num(i), ind_ins_num(i));
end
end

function ele_ind = ins_int_vec_sin(ele_ind, ele, ind)
% PURPOSE: insert into vector
%---------------------------------------------------
% USAGE: vec_ins = ins_int_vec(vec, ele, ind)
% where:
% vec = vector
% ele = element
% ind = index
%---------------------------------------------------
% RETURNS:
% vec_ins = vector inserted
% --------------------------------------------------
% SEE ALSO:
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: km

ele_ind = [ele_ind(1:ind - 1); ele; ele_ind(ind:end)];
end
