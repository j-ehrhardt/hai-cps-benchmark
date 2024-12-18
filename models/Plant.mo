model processPlant
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    Modelica.Fluid.System system_plant(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient = 1e5, T_ambient = 293.15, m_flow_start = 0.0005, p_start = 1e5, T_start(displayUnit = "K") = 300, dp_small = 100, m_flow_small = 0.01) annotation(Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}})));
    bottlingModule bottling0(redeclare package Medium = Medium);
    sourceModule source0(redeclare package Medium = Medium);
    sinkModule sink0(redeclare package Medium = Medium);
equation
    connect(source0.port_out0,bottling0.port_in0);
    connect(bottling0.port_out0,sink0.port_in0);
  annotation(uses(Modelica(version = "4.0.0")), experiment(StartTime = 0, StopTime = 1000, NumberOfIntervals = 500, Tolerance = 1e-6, Interval = 0.1),  Icon(graphics = {Text(origin = {2, -5}, textColor = {26, 95, 180}, extent = {{44, -51}, {-44, 51}}, textString = "P")}));
end processPlant;