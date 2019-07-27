function squaredDistance = SquaredDistance(P,Q)
% Function that gives the squared distance between 2 points. This finds
% the square of the difference between the points of corresponding index,
% and sums all 3 together.
% Inputs: P & Q (points to calculate the distance between) where P and Q
% are a 1x3x1,3x1x1, or 1x1x3 array.
% Outputs: squaredDistance: a single number that is the squared distance
% between the 2 points (1x1 double)
% Author: Angela Hollings

squaredDistance = (P(1)-Q(1))^2+(P(2)-Q(2))^2 + (P(3)-Q(3))^2;

end