function [pve, pve_cel] = cal_pve(tai_ang_fra, dff_fra_cel)
%TAIL_EXPLAINED_VARIANCE Compute % of variance in dF/F explained by tail angle
%
%   [pve, pve_cel] = cal_pve(tai_ang_fra, dff_fra_cel)
%
%   Inputs:
%       tai_ang_fra   : [N x 1] column vector of tail angle per frame
%       dff_fra_cel   : [N x M] matrix of dF/F values, rows=frames,
%       cols=cells, upsample the Ca signal to the frame of the tail signal
%       (120 fps).
%
%   Output:
%       pve_cel : [1 x M] vector, % of variance in each cell's dF/F
%                       signal explained by the tail angle

    arguments
        tai_ang_fra (:,1) double
        dff_fra_cel (:,:) double
    end

    % check that frame counts match
    if size(tai_ang_fra,1) ~= size(dff_fra_cel,1)
        error('tai_ang_fra and dff_fra_cel must have the same number of rows (frames).');
    end

    N_cells = size(dff_fra_cel,2);
    pve_cel = zeros(1, N_cells);

    % center tail angle for numerical stability
    X = [ones(size(tai_ang_fra)) , tai_ang_fra - mean(tai_ang_fra)];

    for c = 1:N_cells
        y = dff_fra_cel(:,c);

        % linear regression: y = b0 + b1*x + e
        b = X \ y;               % least squares solution
        y_hat = X * b;           % predicted values
        SS_res = sum( (y - y_hat).^2 );
        SS_tot = sum( (y - mean(y)).^2 );

        R2 = 1 - SS_res/SS_tot;  % coefficient of determination
        pve_cel(c) = 100 * R2; % express as %
    end
    pve = mean(pve_cel);
end
