function [all_fish]=aj_plot_trajectory_2groups_20200204(all_fish,nROIs,folder_path,filesep,figures_subfolder,date_exp,fish_name,timebinLong,x_lim,y_lim,allgroups) 

f50=figure();
plot_temp=1; %temporary variable to be used for plotting of all chosen fishes
for ROI=allgroups
    
    %load variables
    t = all_fish{ROI,1}.dt;
    X = all_fish{ROI,1}.x;
    Y = all_fish{ROI,1}.y;
    
    %plot trajectory
    bins_trajectory=ceil(max(t)/timebinLong);
    for i=1:ceil(max(t)/timebinLong)
        subplot(nROIs,bins_trajectory,plot_temp);
        plot(X(i*timebinLong-(timebinLong-1)<=t & t<=i*timebinLong),Y(i*timebinLong-(timebinLong-1)<=t & t<=i*timebinLong),'b');
        plot_temp=plot_temp+1;
        xlim([0 x_lim]), ylim([0 y_lim])
        axis 'off'
    end
    
end
saveas (f50, [folder_path,filesep,figures_subfolder,filesep,num2str(date_exp) '-' fish_name num2str(ROI) '_trajectory-all' '.fig']);
saveas (f50, [folder_path,filesep,figures_subfolder,filesep,num2str(date_exp) '-' fish_name num2str(ROI) '_trajectory-all' '.jpg']);