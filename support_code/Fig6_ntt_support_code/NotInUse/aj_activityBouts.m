
function aj_activityBouts

for ROI=1:nROIs
mat1=[0 2 1 2 2 2 0 0 0 1 2 2 0 0 1 0 1 2].';
   counter1=[];
   counter2=[];
   idx_start1=[];
   idx_stop1=[];

%% binarize based on   
 
   for i=2:size(mat1,1)
       if mat1(1,1)==2 && i==2 && mat1(i)==0 
            idx_start1(i-1,:)=1;
       end 
           if mat1(i-1)==1 && mat1(i)==1
                idx_start1(i,:)=0;
           else
               if mat1(i-1)==1 && mat1(i)==0
                    idx_start1(i,:)=0;
               else
                   if mat1(i-1)==1 && mat1(i)==2
                       idx_start1(i,:)=1;
                   else
                       if mat1(i-1)==0 && mat1(i)==1
                            idx_start1(i,:)=0;
                       else
                            if mat1(i-1)==0 && mat1(i)==0
                                idx_start1(i,:)=0;
                            else
                                if mat1(i-1)==0 && mat1(i)==2 && mat1(i+1)~=1
                                idx_start1(i,:)=1;
                                else
                                    if mat1(i-1)==2 && mat1(i)==2
                                    idx_start1(i,:)=0;
                                    else 
                                        if mat1(i-1)==2 && mat1(i)==0
                                            idx_start1(i,:)=0;
                                        else 
                                            if mat1(i-1)==2 && mat1(i)==1
                                            idx_start1(i,:)=0;
                                            end 
                                        end
                                    end
                                end
                            end 
                       end 
                   end 
               end
           end
   end
   
   
   for i=2:size(mat1,1)
       if mat1(i-1)==1 && mat1(i)==1
            idx_stop1(i-1,:)=0;
       else
           if mat1(i-1)==1 && mat1(i)==0
                idx_stop1(i-1,:)=0;
           else
               if mat1(i-1)==1 && mat1(i)==2
                   idx_stop1(i-1,:)=0;
               else
                   if mat1(i-1)==0 && mat1(i)==1
                        idx_stop1(i-1,:)=0;
                   else
                        if mat1(i-1)==0 && mat1(i)==0
                            idx_stop1(i-1,:)=0;
                        else
                            if mat1(i-1)==0 && mat1(i)==2
                            idx_stop1(i-1,:)=0;
                            else
                                if mat1(i-1)==2 && mat1(i)==2
                                idx_stop1(i-1,:)=0;
                                else 
                                    if mat1(i-1)==2 && mat1(i)==1
                                        idx_stop1(i-1,:)=0;
                                else 
                                    if mat1(i-1)==2 && mat1(i)==0
                                        idx_stop1(i-1,:)=1;
                                    else
                                        if mat1(end)==2
                                        idx_stop1(i-1,:)=1;
                                        end 
                                    end 
                                    end
                                end
                            end
                        end 
                   end 
               end 
           end
       end 
      if mat1(end)==2
          idx_stop1(i,:)=1;
      else 
          idx_stop1(i,:)=0;
      end
   end 
   
%% find indices of start and stop of high activity bins
   
%     idx_start1=idx_start1.';
%     idx_stop1=idx_stop1.';
for i=1:size(mat1,1)
    index_start = find([idx_start1(:,:)] == 1);
end
for i=1:size(mat1,1)
    index_stop = find([idx_stop1(:,:)] == 1);
end

%% calculate lengths of bout

for i=1:size (index_stop,1)
counter1(i)=length(index_start(i):index_stop(i));
end 

%% save data 
all_fish{ROI,1}.boutStart   =  index_start;
all_fish{ROI,1}.boutEnd     =  index_stop;
all_fish{ROI,1}.boutLength  =  counter1;

end 
















    
    
    