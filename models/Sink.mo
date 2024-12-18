model sinkModule
  replaceable package Medium = Modelica.Media.Water.StandardWater;


  Modelica.Fluid.Sources.FixedBoundary continuous_sink(
    nPorts = 1,
    redeclare package Medium = Medium,
    p = 1.0e5
)  annotation(
    Placement(transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_in0(redeclare package Medium = Medium) annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));


equation
  connect(continuous_sink.ports[1], port_in0) annotation(
    Line(points = {{60, 0}, {-100, 0}}, color = {0, 127, 255}));

annotation(
    uses(Modelica(version = "4.0.0")));
end sinkModule;