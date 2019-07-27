function [points] = SelectKRandomPoints(img,k)
% SelectKRandomPoints generates a list of the subscripts of
% k randomly selected pixels from an image.
% Inputs: img: image of unit8 format to select points from (NxMx3)
%           k: The number of points to randomly select (1x1 double)
% Outputs: points: 2D array (kx2) representing k randomly selected points.
%          Each point must be unique and have an equal chance of selection
% Author: Angela Hollings

% Find the number of rows and columns of the image
[nrows,ncolumns,~] = size(img); 

% Get the indicies of a random element in img
values = randperm(nrows*ncolumns,k); 

% convert indicies to subscripts using a faster version of ind2sub. 
% Figures out how many rows the value must contain using the remainder.
% How many values more than the rows the indicies have relative to the 
% images rows can be used to work out the number of columns
% Source:http://tipstrickshowtos.blogspot.com/2011/
% 09/fast-replacement-for-ind2sub.html
rows = rem(values-1,nrows)+1;
columns = (values-rows)/nrows + 1;

% Update points array with each row representing a Pixel subscript
points = [rows.',columns.'];

end

