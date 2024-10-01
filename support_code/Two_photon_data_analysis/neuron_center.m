function [x, y] = neuron_center(mask)
% This script finds the center of mass for the detected cells
%temp is the template

% kadir: not sure if correct

temp = single(mask);
x = zeros(max(max(temp)), 1);
y = zeros(max(max(temp)), 1);
for i = 1:max(max(temp))
    x(i)= round(mean(find(temp == i))/size(temp, 1));
    y(i)= round(mean(find(temp' == i))/size(temp, 2));
end
y=y';
end