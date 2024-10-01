function enl_num_pol(fon_siz)
% PURPOSE: To enlarge the numbers for polar plot
%---------------------------------------------------
% USAGE: enl_num_pol(fon_siz)
% where: 
% fon_siz = Font size
%---------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 20 is good.
%---------------------------------------------------

% Written by: Kadir Mutlu

th = findall(gcf,'Type','text');
for i = 1:length(th),
      set(th(i),'FontSize', fon_siz, 'FontWeight', 'Bold')
end