
function[pdf]=get_pdf_FP(X,Y,xdimmax)

x= 0 : xdimmax/50 : xdimmax; % axis x, which you want to see
y = 0 :xdimmax/50: xdimmax; % axis y, which you want to see


[Xtemp,Ytemp] = meshgrid(x,y); % important for "surf" - makes defined grid

pdf = hist3([X , Y],{x y}); % standard hist3 (calculated for yours axis)

pdf_normalize = (((pdf./ length(X)))); % normalization means devide it by length of

pdf_normalize =(pdf_normalize)';% data_x (or data_y)

pdf=pdf_normalize;

end