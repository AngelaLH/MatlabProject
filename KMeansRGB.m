function [clusters, means] = KMeansRGB(img, seedMeans, max)
% KMeansRGB continuosly updates the mean values until the mean of
% each pixel is with it's closest possible mean, with k possible means
% or until it reaches the maximum number of iterations specified.
% Inputs: img: image's 3D array (NxMx3) to determine means and clusters
%              from
%         seedMeans: the colour values of each mean (kx1x3)
%         max: the maximum number of iterations to perform (1x1 double)
% Outputs: means: a 3D array (1xkx3) of the final means
%          clusters: a 2D array (NxM) representing what cluster each pixel
%          belongs to

x = 0; % variable to keep track of the number of iterations
means = seedMeans;

while x ~= max
    % Assign current mean to new variable
    prevMean = means;
    
    % Assign each pixel in img to its closest mean
    clusters = AssignToClusters(img,means);
    
    % Find the mean of each cluster
    means = UpdateMeans(img,size(seedMeans,1),clusters);
    
    x = x + 1; % Increment the number of iterations
    
    % Breaks the loop if the updated mean is equal to the previous one
    if isequal(prevMean,means)
        break
        
    end
end

% Display message if the maximum number of iterations was reached.
if x == max
    disp('Maximum number of iterations reached before convergence was achieved');
    
end