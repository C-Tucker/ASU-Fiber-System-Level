function boundaries = ModelLight(Boundaries,Fibers,Attenuation)
    
    for i = Fibers
        for j = i.LightVector
            for k = Boundaries
                intersection = findIntersection(k.Slope,k.Intercept,k.IsVertical,j.Slope,j.Intersection,j.IsVertical);
                if( intersection ~= false)
                    lightRayVector = intersection - k.Start;
                    temp = lightRayVector ./ j.UnitDirectionVector;
                    if(temp(1) >= 0 && temp(2) >= 0)
                        if( k.Start(1) <= intersection(1) && k.Start(2) <= intersection(2))
                            if( k.End(1) >= intersection(1) && k.End(2) <= intersection(2))
                                tempDist = norm(intersection - k.Start);
                                binNum = fix(tempDist / k.DetectionSeperationDist);
                                lightTravelDist = norm(intersection - i.Start);
                                intensityAtIntersection = j.Intensity * Attenuation^(lightTravelDist/.05);
                                k.DetectedData(binNum) = k.DetectedData(binNum) + intensityAtIntersection;
                            end
                        end
                    end
                end
            end
        end
    end
    
    boundaries = Boundaries;
end

