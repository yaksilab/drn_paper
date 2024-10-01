function ima = ali_ima(ima)
fra_cro = ima;
%
first_lsm = single(fra_cro(:,:,1));   %the first raw image will be the control one
LSMs = horzcat(fra_cro);
LSMs= single(LSMs(:,:,1:size(fra_cro,3)));
control_map = first_lsm;

%init_variable
im_raw_vector_corr(size(LSMs,3)).im = first_lsm; %to initialize the struct
im_raw_vector_corr(1,1).im = first_lsm;
min_y = 1;
max_y = size(fra_cro,1);
min_x = 1;
max_x = size(fra_cro,2);
im_aux = first_lsm;

for i = 2:size(LSMs,3)
    disp (['Images left ', num2str(size(LSMs,3) - i)])
    stack = LSMs(:,:,i);
    [~, imOut] = alignImages(control_map,stack,16,2,'translation',1);% PROB. USES LAETITIA CODE
    x = find(isnan(imOut(ceil(max_y/2),:)));
    y = find(isnan(imOut(:,ceil(max_x/2))));
    min_x = max([x(x<ceil(max_x/2))+1, min_x]);
    max_x = min([x(x>floor(max_x/2))-1, max_x]);
    min_y = max([y(y<ceil(max_y/2))+1; min_y]);
    max_y = min([y(y>floor(max_y/2))-1; max_y]);
    imOut(isnan(imOut)) = 0;
    imOut(isinf(imOut)) = 0;
    im_aux(:,:,i) = imOut;
end

%After obtaining the min and max of x and y we can reshape the matrix
for i = 1:size(LSMs,3)
    im_raw_vector_corr(1,i).im = im_aux(min_y:max_y,min_x:max_x,i);
end


% Put the matrix in the required format
out=im_raw_vector_corr;
fra_cro_ali = zeros(size(out(1).im,1),size(out(1).im,2),length(out), 'uint8'); % allocation for speed

for i=1:length(out)
   fra_cro_ali(:,:,i)=horzcat(out(i).im);
end  

ima = fra_cro_ali;
end