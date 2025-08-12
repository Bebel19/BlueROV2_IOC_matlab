function params  = LoadRobotParameters(robotName)
    load("Robots.mat",robotName);
    robot = eval('caller',robotName);
    P = struct2cell(robot);
    params.m = cell2mat(P(1));
    params.MOI = cell2mat(struct2cell(P{2}));
    params.L = cell2mat(struct2cell(P{3}));
    params.A = cell2mat(struct2cell(P{4}));
    params.Volume = cell2mat(P(5));
    params.x_g = cell2mat(P(6));
    params.y_g = cell2mat(P(7));
    params.z_g = cell2mat(P(8));
    params.x_b = cell2mat(P(9));
    params.y_b = cell2mat(P(10));
    params.z_b = cell2mat(P(11));
    params.AddedMass = cell2mat(struct2cell(P{12}));
    Drag = struct2cell(P{13});
    params.LinDrag = cell2mat(struct2cell(Drag{1}));
    params.NonLinDrag = cell2mat(struct2cell(Drag{2}));
    params.I_c = cell2mat(P(14));
    params.A_p = cell2mat(struct2cell(cell2mat(P(15))));
end