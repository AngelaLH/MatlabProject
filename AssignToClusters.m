function [clusters] = AssignToClusters(img,seedMeans)
% AssignToClusters takes a 3D array of an images colours and assigns each 
% pixel in img to the mean that has the smallest square distance with it.
% Inputs: seedMeans: the colour values of each point chosen as a mean 
%                   (1xkx3) 2D array
%               img: image's 3D array (NxMx3) to assign to clusters
% Output:  clusters: A 2D array (NxM) that contains the index of the mean 
%                    that each pixel respectively has the lowest square
%                    distance with 
% Author: Angela Hollings

[rows, columns, ~] = size(img); %find the number of rows and columns 

% Reshapes img into a 1x(rows*columns) array for each colour to enable  
% direct subtraction of each mean, creating a 10x(rows*columns) array,  
% with each row corresponding to a mean. Each value is then squared, and   
% then all 3 colour arrays are added together to get the square distance 
% between each pixel index and the means.
squaredDistance = (reshape(img(:,:,1),1,[]) - seedMeans(:,:,1)).^2 ...
                + (reshape(img(:,:,2),1,[]) - seedMeans(:,:,2)).^2 ...
                + (reshape(img(:,:,3),1,[]) - seedMeans(:,:,3)).^2;

% Find which of the means each pixel has the lowest squared distance with 
% by finding the index of the minimum value in each column.
[~,idx] = min(squaredDistance,[],1);

% reshape the index of the means into the size of Img to show what cluster 
% each pixel is a part of. Each mean corresponds to a cluster of pixels
clusters = reshape(idx,rows,columns);

end
    
