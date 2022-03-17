model source
  extends source_superModel;
  replaceable package Medium = Modelica.Media.Water.StandardWater;  
    
  Modelica.Fluid.Sources.FixedBoundary source(
    redeclare package Medium = Medium, 
    T = Modelica.SIunits.Conversions.from_degC(20), 
    nPorts = 1, 
    p = system.p_ambient, 
    use_T = false, use_p = true)   
    annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
  Modelica.Fluid.Machines.PrescribedPump pump(
    redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}),
    redeclare package Medium = Medium,
    N_nominal = 2500, 
    T_start = system.T_start, 
    V = 0.001, V_flow_single(fixed = false), 
    allowFlowReversal = true, 
    checkValve = true, 
    energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
    m_flow_start = 0.1, 
    massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
    nParallel = 1, 
    p_a_start = system.p_start, 
    p_b_start = system.p_start, 
    use_N_in = true)   
    annotation(
  Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate(
    redeclare package Medium = Medium
    ) annotation(
      Placement(visible = true, transformation(origin = {50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Medium,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40) 
    annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Sources.RealExpression realExpression_pump(y = realExpression_pump_simulator) annotation(
    Placement(visible = true, transformation(origin = {-30, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  
  Modelica.Blocks.Sources.RealExpression realExpression(y = realExpression_valveLinear_simulator) annotation(
    Placement(visible = true, transformation(origin = {10, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));

  Modelica.Fluid.Interfaces.FluidPort_a port_out(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 
  
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-70, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(realExpression_pump.y, pump.N_in) annotation(
    Line(points = {{-30, 109}, {-30, 99}}, color = {0, 0, 127}));
  connect(source.ports[1], pump.port_a) annotation(
    Line(points = {{-60, 90}, {-40, 90}}, color = {0, 127, 255}));
  connect(valveLinear.port_b, volumeFlowRate.port_a) annotation(
    Line(points = {{20, 90}, {40, 90}}, color = {0, 127, 255}));
  connect(realExpression.y, valveLinear.opening) annotation(
    Line(points = {{10, 109}, {10, 97}}, color = {0, 0, 127}));
  connect(volumeFlowRate.port_b, port_out) annotation(
    Line(points = {{60, 90}, {90, 90}}, color = {0, 127, 255}));
  connect(pump.port_b, valveLinear.port_a) annotation(
    Line(points = {{-20, 90}, {0, 90}}, color = {0, 127, 255}));
  connect(realExpression_pump.y, pump.N_in) annotation(
    Line(points = {{-30, 110}, {-30, 100}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-80, 140}, {100, -20}})),
    version = "");
end source;