classdef Fiber2dWithModel < handle
    
    %{
        This class creates an object that defines a side emitting optical
        fiber and generates it with the premade mathmatical model of the
        side emitting light profile
    %}
    
    properties
        Start;
        End;
        Radius;
        Wavelength;
        NanoFillPercent;
        Slope;
        Intercept;
        IsVertical;
        NumberOfLightRays;
        LightVector;
    end
end