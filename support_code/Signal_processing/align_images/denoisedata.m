clear all;


[FileName,PathName] = uigetfile('*.tif','Select expt to process','D:\data');

h1=figure

f1=fullfile(PathName,FileName);

numEig=10;
info = imfinfo(f1);
num_images = numel(info);
X=imread(f1,1);
[s1,s2]=size(X);
A=zeros([s1 s2 num_images ],'uint16');
newA=zeros([s1 s2 num_images ],'uint16');

affinematrix=[1.0000         0   0; 0    1.0000    0; 0         0    1.0000]

for i = 1:(num_images)    
    A(:,:,i)=imread(f1, i, 'Info', info);
   
end
for n=1:30
newApool(:,:,n)=sum(double(A(:,:,[1:100]+(n-1)*100)),3);
end
for n=1:30
[M, imOut] = alignImages(double(newApool(50:200,50:200,1)), double(newApool(50:200,50:200,n)), 4, 4, 'translation');
xs(n)=M(1,3);
ys(n)=M(2,3);
end
xcoeff=polyfit(1:30,xs,1);
ycoeff=polyfit(1:30,ys,1);
figure
plot(xs,ys)
drawnow;
for n=1:num_images
    affinematrix(1,3)=(n-1)*xcoeff(1)/100;
    affinematrix(2,3)=(n-1)*ycoeff(1)/100;
    A(:,:,n)=warpAffine2(double(A(:,:,n)), affinematrix)*100;
%     imwrite(A(:,:,n),strrep(f1,'.tif',strcat('test1.tif')),'TIF','WriteMode','append','Compression','none')
    
end

figure
imagesc(A(:,:,1))
drawnow;


for n=0:15
collapsed([1:226]+n*226,:)=squeeze(sum(double(A([1:16:end]+n,21:end-20,:)),1));
end
[U,S]=svd(collapsed','econ');

for x=1:s1
    for y=1:s2
        thisLine=zeros(num_images,1);
           for n=1:numEig
               thisLine=thisLine+(U(:,n)'*squeeze(double(A(x,y,:))))*U(:,n);
           end
           newA(x,y,:)=uint16(thisLine);
    end
end
for n=1:num_images
    imwrite(newA(:,:,n),strrep(f1,'.tif',strcat('eig',num2str(numEig),'.tif')),'TIF','WriteMode','append','Compression','none')
    
end

avtrace=newA(:,:,[400:850])+newA(:,:,[400:850]+868)+newA(:,:,[400:850]+1302)+newA(:,:,[400:850]+1736)+newA(:,:,[400:850]+2170);
for n=1:451
    imwrite(avtrace(:,:,n),strrep(f1,'.tif',strcat('aveig',num2str(numEig),'.tif')),'TIF','WriteMode','append','Compression','none')
    
end

