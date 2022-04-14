model evaporator
  extends still_superModel;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa"));
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  Modelica.Fluid.Interfaces.FluidPort_b port_in0(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {152, 422}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_out0(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {148, 224}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_out1(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {452, 382}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank evaporator_tank(redeclare package Medium = Medium, crossArea = 0.33, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 0.45, level(fixed = true, start = 0.1), level_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 3, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01)}) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump evaporating_water(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N(start = 0), N_nominal = 500, T_start = system.T_start, V = 0.001, V_flow_single(fixed = false), allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
// equations
  connect(evaporator_tank.ports[1], evaporating_water.port_a) annotation(
    Line(points = {{-40, 0}, {-40, -20}, {-20, -20}}, color = {0, 127, 255}));
  connect(evaporator_tank.ports[2], port_in0) annotation(
    Line(points = {{-40, 0}, {-40, 70}}, color = {0, 127, 255}));
  connect(evaporator_tank.ports[3], port_out0) annotation(
    Line(points = {{-40, 0}, {-40, -50}, {20, -50}}, color = {0, 127, 255}));
  connect(evaporating_water.port_b, port_out1) annotation(
    Line(points = {{0, -20}, {20, -20}}, color = {0, 127, 255}));
  annotation(
    Icon(graphics = {Text(origin = {250, 324}, lineColor = {0, 0, 255}, extent = {{-200, 84}, {0, 48}}, textString = "%name"), Polygon(origin = {250, 324}, fillColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{0, 100}, {200, 70}, {200, 50}, {200, 50}, {0, 80}, {0, 100}}), Text(origin = {250, 356}, extent = {{-195, -38}, {-5, -58}}, textString = "%level_start"), Polygon(origin = {250, 324}, fillColor = {170, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{20, 98}, {30, 74}, {52, 84}, {66, 72}, {86, 78}, {98, 66}, {118, 74}, {130, 60}, {144, 70}, {152, 60}, {168, 66}, {180, 54}, {196, 74}, {190, 76}, {180, 64}, {170, 70}, {156, 66}, {148, 76}, {132, 68}, {120, 80}, {100, 74}, {88, 88}, {70, 78}, {50, 92}, {32, 82}, {28, 100}, {20, 98}, {20, 98}}), Text(origin = {250, 324}, extent = {{-193, 30}, {-3, 10}}, textString = "level ="), Line(origin = {249.712, 321.42}, points = {{-200, 100}, {-200, -100}, {0, -100}, {0, 100}}), Rectangle(origin = {250, 376}, fillColor = {85, 170, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-200, -154}, {0, 0}})}, coordinateSystem(extent = {{40, 220}, {460, -20}})),
    Diagram(coordinateSystem(extent = {{-80, 80}, {40, -60}})),
    uses(Modelica(version = "3.2.3")),
    version = "");
end evaporator;