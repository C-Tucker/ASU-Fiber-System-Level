function fiber = DefineFiber(Start,End,Radius,NanoFillPercent,NumberOfLightRays)
    fiber = Fiber2dWithModel;
    fiber.Start = Start;
    fiber.End = End;
    fiber.Radius = Radius;
    fiber.NanoFillPercent = NanoFillPercent;
    fiber.NumberOfLightRays = NumberOfLightRays;
    [slope,intercept,isVertical] = defineLine(Start,End-Start);
    fiber.Slope = slope;
    fiber.Intercept = intercept;
    fiber.IsVertical = isVertical;
    
    tempLightVector(1,2*NumberOfLightRays) = LightRay2D;
    
    directionalVector = End - Start;
    stepVector = directionalVector / NumberOfLightRays;
    stepVectorLength = norm(stepVector);
    radiusCorrection = Radius * directionalVector * [0,-1;1,0] / norm(directionalVector);
    radiusCorrectionFlipper = [1,-1];
    wavelength = 1;
    
    for i = 1:2
        lightDirectionVector = radiusCorrection * radiusCorrectionFlipper(i);
        lightStart = Start + lightDirectionVector;
        length = 0;
        for j = 1:NumberOfLightRays
            lightPosition = lightStart + stepVector * j;
            intensity = LightIntensityFiberOutput(length);
            tempLightVector((i-1)*NumberOfLightRays + j) = DefineLightRay(intensity,wavelength,lightPosition,lightDirectionVector);
            length = length + stepVectorLength;
        end
    end
    
    
    
    fiber.LightVector = tempLightVector;
end

