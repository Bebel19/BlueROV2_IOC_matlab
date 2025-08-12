clear
ROV = LoadRobot("BlueROV2_Heavy");
ROV_bus_info = Simulink.Bus.createObject(ROV_Struct2Bus(ROV));
ROV_bus = evalin('base', ROV_bus_info.busName);

ENV = LoadEnvironment("Lab");
ENV_bus_info = Simulink.Bus.createObject(ENV);
ENV_bus = evalin('base', ENV_bus_info.busName);


nu = Simulink.Bus;
Names = ["u";"v";"w";"p";"q";"r"];
Units = ["m/s";"m/s";"m/s";"rad/s";"rad/s";"rad/s"];

for a = 1:size(Names,1)
    elements(a) = Simulink.BusElement;
    elements(a).Name = Names(a);   
    elements(a).DataType = 'double';
    elements(a).Unit = Units(a);
end
nu.Elements = elements;
clear Names Units elements a

nu_d = Simulink.Bus;
Names = ["u_d";"v_d";"w_d";"p_d";"q_d";"r_d"];
Units = ["m/s^2";"m/s^2";"m/s^2";"rad/s^2";"rad/s^2";"rad/s^2"];

for a = 1:size(Names,1)
    elements(a) = Simulink.BusElement;
    elements(a).Name = Names(a);   
    elements(a).DataType = 'double';
    elements(a).Unit = Units(a);
end
nu_d.Elements = elements;
clear Names Units elements a

eta = Simulink.Bus;
Names = ["N";"E";"D";"phi";"theta";"psi"];
Units = ["m";"m";"m";"rad";"rad";"rad"];

for a = 1:size(Names,1)
    elements(a) = Simulink.BusElement;
    elements(a).Name = Names(a);   
    elements(a).DataType = 'double';
    elements(a).Unit = Units(a);
end
eta.Elements = elements;
clear Names Units elements a

eta_d = Simulink.Bus;
Names = ["N_d";"E_d";"D_d";"phi_d";"theta_d";"psi_d"];
Units = ["m/s";"m/s";"m/s";"rad/s";"rad/s";"rad/s"];

for a = 1:size(Names,1)
    elements(a) = Simulink.BusElement;
    elements(a).Name = Names(a);   
    elements(a).DataType = 'double';
    elements(a).Unit = Units(a);
end
eta_d.Elements = elements;
clear Names Units elements a

tau = Simulink.Bus;
Names = ["tau1";"tau2";"tau3";"tau4";"tau5";"tau6"];
Units = ["N";"N";"N";"Nm";"Nm";"Nm"];

for a = 1:size(Names,1)
    elements(a) = Simulink.BusElement;
    elements(a).Name = Names(a);   
    elements(a).DataType = 'double';
    elements(a).Unit = Units(a);
end
tau.Elements = elements;
clear Names Units elements a

V_water = Simulink.Bus;
Names = ["u";"v";"w"];
Units = ["m/s";"m/s";"m/s"];

for a = 1:size(Names,1)
    elements(a) = Simulink.BusElement;
    elements(a).Name = Names(a);   
    elements(a).DataType = 'double';
    elements(a).Unit = Units(a);
end
V_water.Elements = elements;
clear Names Units elements a

save('Simulation_busses.mat','ROV_bus','ENV_bus','nu','nu_d','eta','eta_d','tau','V_water')