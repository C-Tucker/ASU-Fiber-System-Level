clc;
clear;

Fibers = Fiber2dWithModel;
Boundaries = linearBoundary;
Attenuation = .95;


Fibers = DefineFiber([0,0],[.1,0],.01,1,10);
Boundaries = DefineBoundary([0,.1],[.1,.1],10);

Boundaries = ModelLight(Boundaries,Fibers,Attenuation);

GraphLightData(Boundaries);