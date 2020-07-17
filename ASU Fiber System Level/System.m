classdef System
    %{
        This class defines the system that is being tested and contains the
        nessesary infromation and data to do so
    %}
    
    properties
        Fibers;
        Boundaries;
        FillerMediumAttinuation; % Usually water
    end
        
    methods
        function obj = System(fibers,boundaries,Attinuation)
            obj.Fibers = fibers;
            obj.Boundaries = boundaries;
            obj.FillerMediumAttinuation = Attinuation;
        end
        
        function obj = getCollisionData(obj)
            for fiber = obj.Fibers
                for light = fiber.lightVector
                    for boundary = obj.Boundaries
                        [intersects,position] = findIntersect(boundary.Equation,light.Equation);
                        if(intersects)
                            lightPosition = light.Start;
                            travel = position - lightPosition;
                            distanceTraveled = norm(travel);
                            normalizedSlopeVector = light.Equation.slopeVector/norm(light.Equation.slopeVector);
                            directionCorrection = travel ./ normalizedSlopeVector;
                            %if(directionCorrection(1)>0 && directionCorrection(2) > 0)
                                attinuatedIntensity = obj.FillerMediumAttinuation^(distanceTraveled/.05);
                                boundary = boundary.updateBinData(position,attinuatedIntensity);
                            %end
                        end
                        
                    end
                end
            end
        end
    end
end

function [intersects, position] = findIntersect(Equation1,Equation2)
    %{
        This function takes two of the linear equation objects and finds
        the point of intersection between the two
    %}
    equationMatrix = [Equation1.slopeVector; Equation2.slopeVector];
    interceptVector = [Equation1.intercept;Equation2.intercept];
    %disp(equationMatrix)
    if( det(equationMatrix) ~= 0)
        intersects = true;
        position = transpose(equationMatrix \ interceptVector);
    else
        intersects = false;
        position = [0,0];
    end
end