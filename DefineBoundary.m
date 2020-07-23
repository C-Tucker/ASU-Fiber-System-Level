function boundary = DefineBoundary(Start,End,NumberOfDetectionPoints)
    boundary = linearBoundary;
    boundary.Start = Start;
    boundary.End = End;
    boundary.NumberOfDetectionPoints = NumberOfDetectionPoints;
    
    boundary.DetectedData = zeros(NumberOfDetectionPoints,1);
    
    [slope,intercept,isVertical] = defineLine(Start,End-Start);
    boundary.Slope = slope;
    boundary.Intercept = intercept;
    boundary.IsVertical = isVertical;
    
    temp = End - Start;
    boundary.DetectionSeperationDist = norm(temp)/NumberOfDetectionPoints;
end

