%% find the circles/arenas
% rgb = imread('D:\Calcium_imaging\behaviour_experiments\tests_behaviour_set_up\new_machine\Plate_captures_and_arenas\newest_24_arenas.bmp');
% gray_image = rgb2gray(rgb);
% [centers, radii] = imfindcircles(rgb,[36 37],'ObjectPolarity','bright','Sensitivity',1)
% h = viscircles(centers,radii);
% 
% circle = table((transpose(1:24)), centers(:,1), centers(:,2), radii, 'VariableNames',{'well','x','y','r'});
% writetable(circle, 'tabel_circle.dat');

%% calculate all the points on the circle for every well
function [X_fixed,Y_fixed] = eline_correction_arena_20191125_2(Xoriginal,Yoriginal)
for fish=1:size(Xoriginal,2)
    X=[];X=Xoriginal{1,fish};
    Y=[];Y=Yoriginal{1,fish};
    figure(), plot(X,Y);
    circle =table2array( readtable('tabel_circle.dat'));
    C(1:6,1:4)=circle(sort(circle(circle(:,3)<154)),:);
        C(7:12,1:4)=circle(sort(circle(find((circle(:,3)>154).*((circle(:,3)<230))))),:);
            C(13:18,1:4)=circle(sort(circle(find((circle(:,3)>230).*((circle(:,3)<310))))),:);
                C(19:24,1:4)=circle(sort(circle(find((circle(:,3)>310).*((circle(:,3)<390))))),:);
circle=[];circle=C;
    check=true;
 x=[];y=[];x=X;y=Y;
    for i = 1:size(X,1)
      
        if(~isnan(X(i)))
            d=[];
            d = sqrt((X(i)-circle(fish,2))^2 + (Y(i)-circle(fish,3))^2);
            
            if  (d > circle(fish,4) && check )
                check=false;
                counter_pointer=i ;
            else
                if (~(check) && d <= circle(fish,4))
                    check=true;
                    counter_pointer_end=i ;deltax=[];
                    deltax=((X(counter_pointer_end)-X(counter_pointer-1))/(counter_pointer_end-counter_pointer));
                    vector_point=[];   vector_point=[1:(counter_pointer_end-counter_pointer)];
                    vector_point=deltax.*vector_point;
                    sum( vector_point)
                    x(counter_pointer:(counter_pointer_end-1)) = floor(vector_point+X(counter_pointer-1)) ;
                    deltay=[];     vector_point=[];              
                    vector_point=[1:(counter_pointer_end-counter_pointer)];
                    deltay=((Y(counter_pointer_end)-Y(counter_pointer-1))./(counter_pointer_end-counter_pointer));
                    vector_point=deltay.*vector_point;
                      sum( vector_point)
                    y(counter_pointer:(counter_pointer_end-1)) = (vector_point+Y(counter_pointer-1)) ;
                end
            end
        end
 X_fixed(1,fish)={x};
 Y_fixed(1,fish)={y};
%  x=[];
%  y=[];
    end
end
