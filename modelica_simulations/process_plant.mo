model process_plant
inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial);
replaceable package Medium = Modelica.Media.Water.StandardWater;
  source source0 annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  source source1 annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  source source2 annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  sink sink0 annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  mixer_partial mixer_partial1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(source0.port_out, mixer_partial1.port_in3) annotation(
    Line(points = {{-80, 30}, {-60, 30}, {-60, 14}}, color = {0, 127, 255}));
  connect(source1.port_out, mixer_partial1.port_in2) annotation(
    Line(points = {{-80, 10}, {-60, 10}}, color = {0, 127, 255}));
  connect(source2.port_out, mixer_partial1.port_in1) annotation(
    Line(points = {{-80, -10}, {-60, -10}, {-60, 6}}, color = {0, 127, 255}));
  connect(mixer_partial1.port_out, sink0.port_in) annotation(
    Line(points = {{-38, 10}, {-20, 10}}, color = {0, 127, 255}));
end process_plant;