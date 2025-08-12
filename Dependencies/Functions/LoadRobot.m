function robot = LoadRobot(robotName)
    load("Robots.mat",robotName);
    robot = eval('caller',robotName);
end