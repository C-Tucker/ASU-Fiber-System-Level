classdef linearBoundary < handle
    
    %{
        This class defines a single linear boundary that acts to collect
        the light intensity and location data that interacts with it
    %}
    
    properties
        Start;
        End;
        NumberOfDetectionPoints;
        Slope;
        Intercept;
        IsVertical;
        DetectedData;
        DetectionSeperationDist;
    end
end