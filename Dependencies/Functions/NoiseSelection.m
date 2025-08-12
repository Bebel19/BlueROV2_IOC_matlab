function [noise] = NoiseSelection()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
sysSEN = load("Dependencies\Workspaces\Sensors.mat");
simparam = load("Dependencies\Workspaces\simparam.mat");
states = struct2array(simparam.Sim_param.States);
array = struct2array([sysSEN]);
ts = [array.ts]';
delay = [array.Delay]';
variance = [array.Variance]';
drift = [array.Drift]';

for i = 1:12 
    if(states(i) == 0)
        noise(i) = struct('ts',-1,'drift',0,'delay',0,'var',0);
    else
        noise(i) = struct('ts',ts(states(i)),'drift',drift(states(i)),'delay',delay(states(i)),'var',variance(states(i)));
    end
    i = i + 1;
end
end