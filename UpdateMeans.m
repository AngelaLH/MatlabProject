function means = UpdateMeans(img,k,clusters)
% UpdateMeans determines the mean value of all the pixels in each cluster
% Inputs: img: image's 3D array to determine means from (unit8 format)
%              (NxMx3)
%    clusters: A 2D array that contains the index of the mean that each
%              pixel respectively has the lowest square distance with
%              (NxM)
%           k: The number of points that was selected (single integer)
%Output: means: The mean value of each cluster for each colour
%Author: Angela Hollings

means = zeros(k,1,3);

%Seperate img into colour arrays
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

% Loop through each cluster
for i = k:-1:1
    % Return the indicies of every pixel for the cluster i
    match = find(clusters == i);
    
    % Change the original mean to the mean of all values in cluster i for
    % each colour
    means(i,1,1) = mean(red(match));
    means(i,1,2) = mean(green(match));
    means(i,1,3) = mean(blue(match));
    
end

end