function myImage = CreateKColourImage(clusters, means)
% CreateKColourImage creates an image with each pixel assigned to the mean
% value of each cluster
% Inputs: clusters: a 2D array (NxM) representing what cluster each pixel
%                   belongs
%            means: a 3D array (1xkx3) with the mean value of each cluster 
% Outputs:  myImage: An uint8 (NXMX3) image with the Kmeans value of each 
%                    pixel
% Author: Angela Hollings

[rows,columns]= size(clusters); % Find the number of rows and columns

% Preallocate myImage layers as uint8 type
myImage = zeros(rows,columns,3, 'uint8');
r = myImage(:,:,1);
g = myImage(:,:,2);
b = myImage(:,:,3);

% Assign each pixel to its mean colour value based on its assigned cluster
for i = 1:size(means,1)
    r(clusters == i) = means(i,1,1);
    g(clusters == i) = means(i,1,2);
    b(clusters == i) = means(i,1,3);
end

% Concatenate to create an image with 3 colour layers
myImage = cat(3,r,g,b);

end