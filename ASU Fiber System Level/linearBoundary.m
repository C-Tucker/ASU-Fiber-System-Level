classdef linearBoundary < handle
    
    %{
        This class defines a single linear boundary that acts to collect
        the light intensity and location data that interacts with it
    %}
    
    properties
        Start = [0,0];
        End = [0,0];
        slopeVector = [0,0];
        NumberOfDetectionPoints = 100;
        Equation = linearEquation();
        DetectedData;
        DetectionSeperationDist = 1;
        %DetectorBinData;
    end
    
    methods
        function obj = linearBoundary(Start,End,NumberOfDetectionPoints)
            obj.Start = Start;
            obj.End = End;
            obj.NumberOfDetectionPoints = NumberOfDetectionPoints;
            slopeVector = End - Start;
            obj.Equation.setSlopeVector(slopeVector);
            intercept = Start(1) * slopeVector(1) + Start(2) * slopeVector(2);
            obj.Equation.setIntercept(intercept);
            obj = obj.getDetectionSeperationDist();
            obj.DetectedData = zeros(obj.NumberOfDetectionPoints,1);
            %obj.DetectorBinData = 0:obj.NumberOfDetectionPoints:norm(obj.slopeVector);
            %obj = obj.getDetectorBinData();
        end
        
        function obj = getDetectionSeperationDist(obj)
            obj.slopeVector = obj.End-obj.Start;
            length = norm(obj.slopeVector);
            obj.DetectionSeperationDist = length/obj.NumberOfDetectionPoints;
        end
        
        %function obj = getDetectorBinData(obj)
            %length = norm(obj.slopeVector);
            %obj.DetectorBinData = 0:obj.NumberOfDetectionPoints:length;
        %end
        
        function obj = updateBinData(obj,Position,Intensity)
            stepVector = obj.DetectionSeperationDist .* obj.slopeVector/norm(obj.slopeVector);
            tempPosition = obj.Start;
            binBoundary = zeros(2);
            tempBinData = obj.DetectedData;
            for i = 1:obj.NumberOfDetectionPoints-1
                binBoundary(:,1) = tempPosition;
                tempPosition = tempPosition + stepVector;
                binBoundary(:,2) = tempPosition;
                sort(binBoundary,2);
                %disp(Position(1)>=binBoundary(1,1)&&Position(1)<binBoundary(1,2)&&Position(2)>=binBoundary(2,1))
                if(Position(1)>=binBoundary(1,1)&&Position(1)<binBoundary(1,2))
                    %if(Position(2)>=binBoundary(2,1)&&Position(2)<binBoundary(2,2))
                        tempBinData(i) = tempBinData(i) + Intensity;
                        break;
                    %end
                end
            end
            obj.DetectedData = tempBinData;
        end
    end
end