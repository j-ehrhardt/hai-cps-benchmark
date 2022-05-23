model process_plant
inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa"));
replaceable package Medium = Modelica.Media.Water.StandardWater;
  source source0 annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  source source1 annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  mixer_partial mixer_partial0 annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  still_partial still_partial0 annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  sink sink0 annotation(
    Placement(visible = true, transformation(origin = {90, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  filter_partial filter_partial0 annotation(
    Placement(visible = true, transformation(origin = {90, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source0.port_out, mixer_partial0.port_in3) annotation(
    Line(points = {{-80, 30}, {-40, 30}, {-40, -6}}, color = {0, 127, 255}));
  connect(source1.port_out, mixer_partial0.port_in2) annotation(
    Line(points = {{-80, -10}, {-40, -10}}, color = {0, 127, 255}));
  connect(mixer_partial0.port_out, still_partial0.port_in) annotation(
    Line(points = {{-18, -10}, {20, -10}}, color = {0, 127, 255}));
  connect(still_partial0.port_out2, sink0.port_in) annotation(
    Line(points = {{40, -14}, {80, -14}}, color = {0, 127, 255}));
  connect(still_partial0.port_out1, filter_partial0.port_in) annotation(
    Line(points = {{40, -4}, {64, -4}, {64, 12}, {80, 12}}, color = {0, 127, 255}));
  connect(filter_partial0.port_out, mixer_partial0.port_in1) annotation(
    Line(points = {{100, 12}, {126, 12}, {126, -58}, {-58, -58}, {-58, -14}, {-40, -14}}, color = {0, 127, 255}));
end process_plant;