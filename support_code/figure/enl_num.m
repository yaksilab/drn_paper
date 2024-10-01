function enl_num(fon_siz)
% PURPOSE: To enlarge the numbers
%---------------------------------------------------
% USAGE: enl_num(fon_siz)
% where: 
% fon_siz = Font size
%---------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 24.
%---------------------------------------------------

% Written by: Kadir Mutlu

h = gcf;
sub = h.Children;
n_sub = length(sub);
for i = 1:n_sub
    %set(sub(i), 'FontSize', fon_siz, 'FontWeight', 'Bold')
    set(sub(i), 'FontSize', fon_siz)
end