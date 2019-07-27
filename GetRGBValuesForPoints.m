function seedMeans = GetRGBValuesForPoints(img,points)
% GetRGBValuesForPoints returns the colours of each pixel subscript in 
% points
% Inputs:    img: image's 3D array (NxMx3) to get colours from 
%         points: 2D array (kx2) with the subscript of each pixel
% Outputs: seedMeans: the rgb colour values of each pixel from points
% (kx2x3)
% Author: Angela Hollings

rows = size(points,1); %Find the number of means

seedMeans =  zeros(rows,1,3);

% Store the colour value of each pixel that is a mean
for i = rows:-1:1
    seedMeans(i,1,:) = img(points(i,1),points(i,2),:);
end

end
