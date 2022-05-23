model source
  extends source_superModel;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa")); annotation(
    Placement(visible = true, transformation(origin = {-70, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Water.StandardWater;  
    
  Modelica.Fluid.Sources.FixedBoundary source(
    redeclare package Medium = Medium, 
    T = Modelica.SIunits.Conversions.from_degC(20), 
    nPorts = 1, 
    p = system.p_ambient, 
    use_T = false, use_p = true)   
    annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate(
    redeclare package Medium = Medium
    ) annotation(
      Placement(visible = true, transformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
   Modelica.Fluid.Pipes.StaticPipe pipe_out(
      redeclare package Medium = Medium, allowFlowReversal = true, 
      diameter = 0.015, height_ab = -5, length = 5) 
      annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_a port_out(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {14, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 
 
  
equation
 connect(pipe_out.port_a, volumeFlowRate.port_b) annotation(
    Line(points = {{-20, 90}, {-30, 90}}, color = {0, 127, 255}));
 connect(pipe_out.port_b, port_out) annotation(
    Line(points = {{0, 90}, {14, 90}}, color = {0, 127, 255}));
 connect(source.ports[1], volumeFlowRate.port_a) annotation(
    Line(points = {{-60, 90}, {-50, 90}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-80, 140}, {40, 60}})),
    version = "");
end source;