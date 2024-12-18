model sourceModule
  replaceable package Medium = Modelica.Media.Water.StandardWater;

  Modelica.Fluid.Sources.FixedBoundary continuous_source(
    nPorts = 1,
    redeclare package Medium = Medium,
    p = 1.0001e5,
    T = 300
)  annotation(
    Placement(transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
  
  Modelica.Fluid.Interfaces.FluidPort_b port_out0(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));

equation
  connect(continuous_source.ports[1], port_out0) annotation(
    Line(points = {{-58, 0}, {100, 0}}, color = {0, 127, 255}));

annotation(
    uses(Modelica(version = "4.0.0")));
end sourceModule;