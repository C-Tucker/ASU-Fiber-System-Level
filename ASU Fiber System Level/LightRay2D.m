classdef LightRay2D < handle
    %{
        This class contains the information needed to define a light ray in
        2d
    %}
    
    properties
        Intensity;
        Wavelength;
        Start;
        UnitDirectionVector;
        Equation = linearEquation();
    end
    
    methods
        %{
        function obj = LightRay2D(Intensity,Wavelength,Start,UnitDirectionVector)
            obj.Intensity = Intensity;
            obj.Wavelength = Wavelength;
            obj.Start = Start;
            obj.UnitDirectionVector = UnitDirectionVector;
            obj.setEquation();
        end
        %}
        
        function obj = setEquation(obj)
            obj.Equation.setSlopeVector(obj.UnitDirectionVector);
            intercept = obj.Start(1) * obj.UnitDirectionVector(1) + obj.Start(2) * obj.UnitDirectionVector(2)
            obj.Equation.setIntercept(intercept);
            %obj.Equation
            %obj.Equation = linearEquation(Start,End)
        end
    end
end

