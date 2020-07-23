function lightRay = DefineLightRay(Intensity,Wavelength,Start,UnitDirectionVector)
    lightRay = LightRay2D;
    lightRay.Intensity = Intensity;
    lightRay.Wavelength = Wavelength;
    lightRay.Start = Start;
    lightRay.UnitDirectionVector = UnitDirectionVector;
    [slope,intersection,isVertical] = defineLine(Start,UnitDirectionVector);
    lightRay.Slope = slope;
    lightRay.Intersection = intersection;
    lightRay.IsVertical = isVertical;
end

