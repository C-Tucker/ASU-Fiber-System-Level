classdef linearEquation < handle
    % This class is used to define lines as a vector and a scalar to more
    % easily find intersection points between multiple lines
    
    properties
        slopeVector;
        intercept;
    end
    
    methods
        %{
        function obj = linearEquation(Start,End)
            slope = End - Start;
            obj.slopeVector = slope;
            int = Start(1) * obj.slopeVector(1) + Start(2) * obj.slopeVector(2);
            obj.intercept(int);
        end
        %}
        function obj = setSlopeVector(obj,vector)
            obj.slopeVector = vector;
        end
        
        function obj = setIntercept(obj,intercept)
            obj.intercept = intercept;
        end
        
        function v = getSlopeVector(obj)
            v = obj.slopeVector;
            return;
        end
    end
end

