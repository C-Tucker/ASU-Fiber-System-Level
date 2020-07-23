function [slope,intercept,isVertical] = defineLine(position,parallelVector)
    if(parallelVector(1) == 0)
        isVertical = true;
        slope = 0;
        intercept = position(1);
    elseif(parallelVector(2) == 0)
        isVertical = false;
        slope = 0;
        intercept = position(2);
    else
        isVertical = false;
        slope = parallelVector(2)/parallelVector(1);
        intercept = parallelVector(1) * position(1) - parallelVector(2) * position(2);
    end
end

