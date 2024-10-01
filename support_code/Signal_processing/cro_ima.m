function ima = cro_ima(ima)
imshow(ima(:, :, 1))
[fir_fra_cro, roi] = imcrop;
close
[n_row, n_col] = size(fir_fra_cro);
siz = size(ima);
n_fra = siz(3);
fra_cro = zeros(n_row, n_col, n_fra, 'uint8');
parfor i = 1:n_fra
    disp(100*(i/n_fra))
    fra_i = ima(:, :, i);
    fra_cro(:, :, i) = imcrop(fra_i, roi);
end
ima = fra_cro;
end
