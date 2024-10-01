function [par_cel_fra, ord] = sor_mat_asc(par_cel, par_fra_cel)
if isempty(par_fra_cel)
    par_cel_fra = [];
else
    par_cel_fra = par_fra_cel';
    [~, ord] = sort(par_cel, 'ascend');
    par_cel_fra = par_cel_fra(ord, :);
end
end
