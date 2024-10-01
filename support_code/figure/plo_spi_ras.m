function [y_axi, n_spi] = plo_spi_ras(spi, y_axi_bas)
% PLOTSPIKERASTER Create raster plot from binary spike data or spike times
%   Efficiently creates raster plots with formatting support. Faster than
%   common implementations. Multiple plot types and parameters available!
%   Look at Parameters section below.
% 
%   Inputs:
%       M x N logical array (binary spike data):
%           where M is the number of trials and N is the number of time
%           bins with maximum of 1 spike per bin. Assumes time starts at 0.
%       M x 1 cell of spike times:
%           M is the number of trials and each cell contains a 1 x N vector
%           of spike times. Units should be in seconds.
%
%   Output:
%       xPoints - vector of x points used for the plot.
%       yPoints - vector of y points used for the plot.
%
%   Parameters:
%       PlotType - default 'horzline'. Several types of plots available:
%           1. 'horzline' -     plots spikes as gray horizontal lines.
%           2. 'vertline' -     plots spikes as vertical lines, centered
%               vertically on the trial number.
%           3. 'scatter' -      plots spikes as gray dots.
%
%           ONLY FOR BINARY SPIKE DATA:
%           4. 'imagesc' -      plots using imagesc. Flips colormap so
%               black indicates a spike. Not affected by SpikeDuration,
%               RelSpikeStartTime, and similar timing parameters.
%           5. 'horzline2' -    more efficient plotting than horzline if
%               you have many timebins, few trials, and high spike density.
%               Note: SpikeDuration parameter DOES NOT WORK IF LESS THAN 
%               TIME PER BIN.
%           6. 'vertline2' -    more efficient plotting than vertline if
%               you have few timebins, many trials, and high spike density.
%           Note: Horzline and vertline should be fine for most tasks.
% 
%       FigHandle - default gcf (get current figure).
%           Specify a specific figure or subplot to plot in. If no figure
%           is specified, plotting will occur on the current figure. If no
%           figure is available, a new figure will be created.
% 
%       LineFormat - default line is gray. Used for 'horzline' and
%           'vertline' plots only. Usage example:
%               LineFormat = struct()
%               LineFormat.Color = [0.3 0.3 0.3];
%               LineFormat.LineWidth = 0.35;
%               LineFormat.LineStyle = ':';
%               plotSpikeRaster(spikes,'LineFormat',LineFormat)
% 
%       MarkerFormat - default marker is a gray dot with size 1. Used for
%           scatter type plots only. Usage is the same as LineFormat.
% 
%       AutoLabel - default 0.
%           Automatically labels x-axis as 'Time (ms)' or 'Time (s)' and
%           y-axis as 'Trial'.
% 
%       XLimForCell - default [NaN NaN]. - mandatory!
%           Sets x-axis window limits if using cell spike time data. If
%           unchanged, the default limits will be 0.05% of the range. For
%           better performance, this parameter should be set.
%
%       TimePerBin - default 0.001 (1 millisecond).
%           Sets the duration of each timebin for binary spike train data.
% 
%       SpikeDuration - default 0.001 (1 millisecond).
%           Sets the horizontal spike length for cell spike time data.
%
%       RelSpikeStartTime - default 0 seconds.
%           Determines the starting point of the spike relative to the time
%           indicated by spike times or time bins. For example, a relative
%           spike start time of -0.0005 would center 1ms spikes for a
%           horzline plot of binary spike data.
%
%       rasterWindowOffset - default NaN
%           Exactly the same as relSpikeStartTime, but unlike
%           relSpikeStartTime, the name implies that it can be used to make
%           x-axis start at a certain time. If set, takes precedence over
%           relSpikeStartTime.
%       
%       VertSpikePosition - default 0 (centered on trial).
%           Determines where the spike position is relative to the trial. A
%           value of 0 is centered on the trial number - so a spike on
%           trial 3 would have its y-center on 3. Example: A common type of
%           spike raster plots vertical spikes from previous trial to
%           current trial. Set VertSpikePosition to -0.5 to center the
%           spike between trials.
%
%       VertSpikeHeight - default 1 (spans 1 trial).
%           Determines height of spike for 'vertline' plots. Decrease to
%           separate trials with a gap.
%
%   Examples:
%       plotSpikeRaster(spikeTimes);
%               Plots raster plot with horizontal lines.
%
%       plotSpikeRaster(spikeTimes,'PlotType','vertline');
%               Plots raster plot with vertical lines.
%
%       plotSpikeRaster(spikeTimes,'FigHandle',h,'AutoLabel',1,...
%           'XLimForCell',[0 10],'HorzSpikeLength',0.002,); 
%               Plots raster plot on figure with handle h using horizontal
%               lines of length 0.002, with a window from 0 to 10 seconds,
%               and automatic labeling.
%
%       plotSpikeRaster(spikeTimes,'PlotType','scatter',...
%           'MarkerFormat',MarkerFormat);
%               Plots raster plot using dots with a format specified by
%               MarkerFormat.


%% AUTHOR    : Jeffrey Chiou & Kadir Mutlu
%% $DATE     : 07-Feb-2014 12:15:47 $
%% $Revision : 1.2 $
%% DEVELOPED : 8.1.0.604 (R2013a)
%% FILENAME  : plotSpikeRaster.m
DISPLAY PROBLEM FOR LINE PLOTS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%% Set Defaults and Load optional arguments
vertSpikeHeight = 1;
relSpikeStartTime = 0;

    %% Cell case
    n_tri = length(spi);
    
    %
    for i = 1:n_tri
        spi{i} = spi{i}';
    end
    
        %% Vertical or horizontal line logic
        n_spi = sum(cellfun(@length, spi));
        
        % Preallocation is possible since we know how many points to
        % plot, unlike discrete case. 3 points per spike - the top pt,
        % bottom pt, and NaN.
        x_axi = NaN(n_spi*3, 1);
        y_axi = x_axi;
        
        currentInd = 1;
        %% Vertical Lines
            halfSpikeHeight = vertSpikeHeight/2;
            for trials = 1:n_tri
                nSpikes = length(spi{trials});
                nanSeparator = NaN(1, nSpikes);
                
                trialXPoints = [ spi{trials} + relSpikeStartTime; spi{trials} + relSpikeStartTime; nanSeparator ];
                trialXPoints = trialXPoints(:);
                
                trialYPoints = [ (trials-halfSpikeHeight)*ones(1,nSpikes); (trials+halfSpikeHeight)*ones(1,nSpikes); nanSeparator ];
                trialYPoints = trialYPoints(:);
                
                % Save points and update current index
                x_axi(currentInd:currentInd+nSpikes*3-1) = trialXPoints;
                y_axi(currentInd:currentInd+nSpikes*3-1) = trialYPoints;
                currentInd = currentInd + nSpikes*3;
            end
            
        % Plot everything at once! We will reverse y-axis direction later.
        y_axi = max(y_axi_bas) + y_axi - 0.5;
        
        %plot(x_axi, y_axi, 'LineWidth', 1, 'Color', 'k'); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!
        plot(x_axi, y_axi, 'LineWidth', 5, 'Color', 'k');
        
        y_axi = max(y_axi_bas) + n_tri;