model process_plant
inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa"));
replaceable package Medium = Modelica.Media.Water.StandardWater;
  sink sink0 annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  source source0 annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  filter_partial filter_partial1 annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source0.port_out, filter_partial1.port_in) annotation(
    Line(points = {{-80, 0}, {-12, 0}}, color = {0, 127, 255}));
  connect(filter_partial1.port_out, sink0.port_in) annotation(
    Line(points = {{8, 0}, {80, 0}}, color = {0, 127, 255}));
end process_plant;