function [intersection] = findIntersection(slope1,intercept1,isVertical1,slope2,intercept2,isVertical2)
    intersection = zeros(2,1);
    if(~ isVertical1 && ~ isVertical2)
        slopeMatrix = [-slope1,1;-slope2,1];
        interceptMatrix = [intercept1,intercept2];
        intersection = slopeMatrix/interceptMatrix;
    elseif (isVertical1)
            intersection(1) = intercept1;
            intersection(2) = intercept1 * slope2 + intercept2;
    elseif (isVertical2)
            intersection(1) = intercept2;
            intersection(2) = intercept2 * slope1 + intercept1;
    elseif (slope1 == slope2)
            intersection(1) = false;
    end
    
    intersection = transpose(intersection);
    
    %intersection = [intercept1,intercept2];
end

