classdef makeSignificanceBar
    %MAKESIGNIFICANCEBAR - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   MAKESIGNIFICANCEBAR constructor syntax:
    %       MAKESIGNIFICANCEBAR_OBJ = MAKESIGNIFICANCEBAR()
    %
    %   MAKESIGNIFICANCEBAR properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   MAKESIGNIFICANCEBAR methods/functions:
    %       Method 1 - description
    %       Method 2 - description
    %
    %   Examples: 
    %       Line 1 of example
    %       Line 2 of example
    %       Line 3 of example
    %
    %   Other m-files required: none
    %   MAT-files required: none
    %
    %   See also: OTHER_CLASS_NAME1,  OTHER_CLASS_NAME2

    %   Author: Aytac Kadir Mutlu
    %   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
    %   email: kadir.a.mutlu@ntnu.no
    %   Website: https://www.ntnu.edu/kavli
    %   Date: 16-Jan-2023; Last revision: 16-Jan-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function H = sig(x, y, p, y_lim_pre, offset)
            x=repmat(x,2,1);
            y=repmat(y,4,1);
            thr = 0.05;
            if p <= thr
                H(1) = plot(x(:), y, '-k', 'Tag', 'sigstar_bar');
            end
            if p <= 1E-3
                stars = '***';
            elseif p <= 1E-2
                stars = '**';
            elseif p <= 0.05
                stars = '*';
            end
            if p <= 0.05
                %offset = 0.01;
                starY = mean(y) + myRange(y_lim_pre)*offset;
                H(2) = text(mean(x(:)), starY, stars, 'Units', 'data', 'HorizontalAlignment', ...
                    'Center', 'BackGroundColor', 'none', 'Tag', 'sigstar_stars');
            else
                H = nan;
            end
        end

        function H = duo(x,y,p, fon_siz_non, off_non, y_lim_pre)
            n_dig = 2;
            x=repmat(x,2,1);
            y=repmat(y,4,1);
            thr = 1;
            if p <= thr
                H(1) = plot(x(:), y, '-k', 'Tag', 'sigstar_bar');
            end
            if p <= 1E-3
                stars = '***';
            elseif p <= 1E-2
                stars = '**';
            elseif p <= 0.05
                stars = '*';
            elseif p <= thr
                stars = string(round(p, n_dig));
            end
            if p <= 0.05
                offset = 0.01;
                starY = mean(y) + myRange(y_lim_pre)*offset;
                H(2) = text(mean(x(:)), starY, stars, 'Units', 'data', 'HorizontalAlignment', 'Right', ...
                    'BackGroundColor', 'none', 'Tag', 'sigstar_stars', 'Color', 'k');
            elseif p <= thr
                offset = off_non;
                starY = mean(y) + myRange(y_lim_pre)*offset;
                H(2) = text(mean(x(:)), starY, stars, 'Units', 'data', 'HorizontalAlignment', 'Right', ...
                    'BackGroundColor', 'none', 'Tag', 'sigstar_stars', 'FontSize', fon_siz_non, 'Color', 'k');
            else
                H = nan;
            end
        end
    
        function two(x,y,p, fon_siz_non, off_non, y_lim_pre)
            n_dig = 2;
            x=repmat(x,2,1);
            y=repmat(y,4,1);
            thr = 1;
            if p <= thr
                H(1) = plot(x(:), y, '-k', 'Tag', 'sigstar_bar');
            end
            if p <= 1E-3
                stars = '***';
            elseif p <= 1E-2
                stars = '**';
            elseif p <= 0.05
                stars = '*';
            elseif p <= thr
                stars = string(round(p, n_dig));
            end
            if p <= 0.05
                offset = 0.01;
                starY = mean(y) + myRange(y_lim_pre)*offset;
                H(2) = text(mean(x(:)), starY, stars, 'Units', 'data', 'HorizontalAlignment', 'Left', ...
                    'BackGroundColor', 'none', 'Tag', 'sigstar_stars', 'Color', 'r');
            elseif p <= thr
                offset = off_non;
                starY = mean(y) + myRange(y_lim_pre)*offset;
                H(2) = text(mean(x(:)), starY, stars, 'Units', 'data', 'HorizontalAlignment', 'Left', ...
                    'BackGroundColor', 'none', 'Tag', 'sigstar_stars', 'FontSize', fon_siz_non, 'Color', 'r');
            else
                H = nan;
            end
        end
    end

end
