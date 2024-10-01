function fstack=gaussian_filt(stack,n,sigma)
%3x3 filter n=9 

x = -1/2:1/(n-1):1/2;
[Y,X] = meshgrid(x,x);
f = exp( -(X.^2+Y.^2)/(2*sigma^2) );
f = f / sum(f(:));

fstack=double(zeros(size(stack)));
% fstack=uint8(zeros(size(stack)));

for i=1:size(stack,3)
    filtIM=conv2(squeeze(stack(:,:,i)),f);
    fstack(:,:,i)=filtIM(((n-1)/2)+1:end-((n-1)/2),((n-1)/2)+1:end-((n-1)/2));
end
end
