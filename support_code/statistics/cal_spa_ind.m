function spa_ind = cal_spa_ind(val_row)
n=length(val_row);
oben=sum(val_row/n)^2;
unten=sum((val_row.^2)/n);
if unten == 0
   spa_ind=0;
else
zahler=1-oben/unten;
nenner=1-1/n; 
spa_ind=zahler/nenner;
end
end
