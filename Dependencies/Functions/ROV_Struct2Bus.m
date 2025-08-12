function bus = ROV_Struct2Bus(ROV)
    bus.m = ROV.m;
    bus.MOI = cell2mat(struct2cell(ROV.MOI));
    bus.L = cell2mat(struct2cell(ROV.L));
    bus.A = cell2mat(struct2cell(ROV.A));
    bus.Volume = ROV.Volume;
    bus.x_g = ROV.x_g;
    bus.y_g = ROV.y_g;
    bus.z_g = ROV.z_g;
    bus.x_b = ROV.x_b;
    bus.y_b = ROV.y_b;
    bus.z_b = ROV.z_b;
    bus.AddedMass = cell2mat(struct2cell(ROV.AddedMass));
    bus.LinDrag = ROV.Drag.LinVector;
    bus.NonLinDrag = ROV.Drag.NonLinVector;
    bus.I_c = ROV.I_c;
    bus.A_p = cell2mat(struct2cell(ROV.A_p));
end