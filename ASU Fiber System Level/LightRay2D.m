classdef LightRay2D
    %{
        This class contains the information needed to define a light ray in
        2d
    %}
    
    properties
        Intensity;
        Wavelength;
        Start;
        UnitDirectionVector;
        Slope;
        Intersection;
        IsVertical;
    end
end

