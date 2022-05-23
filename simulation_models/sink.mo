model sink
  extends sink_superModel;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa")); annotation(
    Placement(visible = true, transformation(origin = {-70, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    annotation(
  Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Water.StandardWater;   

Modelica.Fluid.Sources.FixedBoundary sink(
    redeclare package Medium = Modelica.Media.Water.StandardWater, 
    T = Modelica.SIunits.Conversions.from_degC(20), 
    nPorts = 1, 
    p = system.p_ambient, 
    use_T = false) 
    annotation(
    Placement(visible = true, transformation(origin = {70, 90}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));

Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium = Modelica.Media.Water.StandardWater, 
    allowFlowReversal = true, 
    diameter= 0.015, 
    height_ab=-1, 
    length=1) 
    annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));

Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate(
    redeclare package Medium = Modelica.Media.Water.StandardWater 
    ) annotation(
    Placement(visible = true, transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_b port_in(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(pipe.port_b, volumeFlowRate.port_a) annotation(
    Line(points = {{0, 90}, {20, 90}}, color = {0, 127, 255}));
  connect(volumeFlowRate.port_b, sink.ports[1]) annotation(
    Line(points = {{40, 90}, {60, 90}}, color = {0, 127, 255}));
  connect(port_in, pipe.port_a) annotation(
    Line(points = {{-50, 90}, {-20, 90}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, 120}, {100, 40}})),
    version = "",
    uses(Modelica(version = "3.2.3")));
end sink;