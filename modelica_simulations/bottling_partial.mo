model bottling_partial
  extends bottling_superModel;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Water.StandardWater;

  Modelica.Fluid.Sources.FixedBoundary sink(
    redeclare package Medium = Medium, 
    nPorts = 1, 
    p = system.p_ambient) 
    annotation(
    Placement(visible = true, transformation(origin = {10, -110}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));


  Modelica.Fluid.Vessels.OpenTank tank_B401(
    redeclare package Medium = Medium,
    crossArea = 0.33,
    energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    height = 0.45,
    level(
    fixed = true,
    start = 0.01),
    level_start = 0.01,
    massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    nPorts = 2,
    portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
    diameter = 0.1),
    Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
    diameter = 0.1)})
    annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  Modelica.Fluid.Vessels.OpenTank tank_B402(
    redeclare package Medium = Medium,
    crossArea = 0.1,
    energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    height = 0.35,
    level(
    fixed = true,
    start = 0),
    level_start = 0,
    massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    nPorts = 2,
    portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
    diameter = 0.1),
    Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
    diameter = 0.1)})
    annotation(
    Placement(visible = true, transformation(origin = {80, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));


  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium = Medium,
    allowFlowReversal = true,
    diameter = 0.015,
    height_ab = 0,
    length = 0.1)
    annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Fluid.Pipes.StaticPipe pipe1(
    redeclare package Medium = Medium,
    allowFlowReversal = true,
    diameter = 0.015,
    height_ab = 0,
    length = 0.725)
    annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Pipes.StaticPipe pipe3(
    redeclare package Medium = Medium,
    allowFlowReversal = true,
    diameter = 0.015,
    height_ab = 0,
    length = 0.4)
    annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

  Modelica.Fluid.Pipes.StaticPipe pipe4(
    redeclare package Medium = Medium,
    allowFlowReversal = true,
    diameter = 0.015,
    height_ab = 0,
    length = 0.175)
    annotation(
    Placement(visible = true, transformation(origin = {80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Fluid.Valves.ValveLinear valve_V403(
    redeclare package Medium = Medium,
    dp_nominal(
    displayUnit = "Pa")
    = 1000,
    dp_start = 0.0,
    m_flow_nominal = 40)
    annotation(
    Placement(visible = true, transformation(origin = {80, -20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));

  Modelica.Fluid.Valves.ValveLinear valve_clogging(
    redeclare package Medium = Medium,
    dp_nominal(
    displayUnit = "Pa")
    = 1000,
    dp_start = 0.0,
    m_flow_nominal = 40)
    annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));

  Modelica.Fluid.Valves.ValveLinear valve_leaking(
    redeclare package Medium = Medium,
    dp_nominal(
    displayUnit = "Pa")
    = 1000,
    dp_start = 0.0,
    m_flow_nominal = 40)
    annotation(
    Placement(visible = true, transformation(origin = {10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Fluid.Machines.PrescribedPump pump_P401(
    redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(
    V_flow_nominal = {0.9,
    1},
    head_nominal = {1,
    0.9}),
    redeclare package Medium = Medium,
    N_nominal = 500,
    T_start = system.T_start,
    V = 0.000001,
    V_flow_single(
    fixed = false),
    allowFlowReversal = true,
    checkValve = true,
    energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_start = 0.001,
    massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    nParallel = 1,
    p_a_start = system.p_start,
    p_b_start = system.p_start,
    use_N_in = true)
    annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_a port_out(
    replaceable package Medium = Medium)
    annotation(
    Placement(visible = true, transformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_b port_in(
    replaceable package Medium = Medium)
    annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression realExpression_pump_P401(
    y = pump_P401_simulator)
    annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Blocks.Sources.RealExpression realExpression_valve_clogging(
    y = valve_clogging_simulator)
    annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression realExpression_valve_leaking(
    y = valve_leaking_simulator)
    annotation(
    Placement(visible = true, transformation(origin = {30, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));


  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate(
    replaceable package Medium = Medium)
    annotation(
    Placement(visible = true, transformation(origin = {80, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {284, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Step step_bottleFilling annotation(
    Placement(visible = true, transformation(origin = {324, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transitionWithSignal_tankNotEmpty(
    enableTimer = true,
    waitTime = 10)
    annotation(
    Placement(visible = true, transformation(origin = {274, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transitionWithSignal_bottleIsFull annotation(
    Placement(visible = true, transformation(origin = {374, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Alternative alternative(
    nBranches = 2)
    annotation(
    Placement(visible = true, transformation(origin = {324, 58}, extent = {{-90, -50}, {90, 50}}, rotation = 0)));

  Modelica.Blocks.Continuous.Integrator integrator(
    use_reset = true)
    annotation(
    Placement(visible = true, transformation(origin = {118, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Step step_tank_B402Filling annotation(
    Placement(visible = true, transformation(origin = {324, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transitionWithSignal_tank_B402IsFull annotation(
    Placement(visible = true, transformation(origin = {374, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transitionWithSignal_tank_B402IsEmpty annotation(
    Placement(visible = true, transformation(origin = {274, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
// bottle filling
  transitionWithSignal_tankNotEmpty.condition = tank_B402.level * tank_B402.crossArea > tank_B402.height * tank_B402.crossArea * minVolPercentage + bottle_volume;
  transitionWithSignal_bottleIsFull.condition = if integrator.y >= bottle_volume then true else false;
  integrator.reset = transitionWithSignal_bottleIsFull.condition;
  valve_V403.opening = if step_bottleFilling.active then 1 else 0;
// tank_B402 filling
  transitionWithSignal_tank_B402IsEmpty.condition = if transitionWithSignal_tankNotEmpty.condition then false else true;
  transitionWithSignal_tank_B402IsFull.condition = tank_B402.level * tank_B402.crossArea >= tank_B402.height * tank_B402.crossArea * maxVolPercentage;
// valve_clogging.opening = if step_tank_B402Filling.active then 1 else 0;
  connect(tank_B401.ports[1], pipe.port_a) annotation(
    Line(points = {{-80, -10}, {-80, -20}}, color = {0, 127, 255}));
  connect(pipe.port_b, pump_P401.port_a) annotation(
    Line(points = {{-80, -40}, {-80, -50}, {-60, -50}}, color = {0, 127, 255}));
  connect(pump_P401.port_b, pipe1.port_a) annotation(
    Line(points = {{-40, -50}, {-20, -50}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valve_clogging.port_a) annotation(
    Line(points = {{0, -50}, {10, -50}, {10, 0}}, color = {0, 127, 255}));
  connect(valve_clogging.port_b, pipe3.port_a) annotation(
    Line(points = {{10, 20}, {10, 60}}, color = {0, 127, 255}));
  connect(pipe3.port_b, tank_B402.ports[1]) annotation(
    Line(points = {{10, 80}, {10, 100}, {80, 100}, {80, 60}}, color = {0, 127, 255}));
  connect(tank_B402.ports[2], pipe4.port_a) annotation(
    Line(points = {{80, 60}, {80, 44}}, color = {0, 127, 255}));
  connect(realExpression_pump_P401.y, pump_P401.N_in) annotation(
    Line(points = {{-50, -30}, {-50, -40}}, color = {0, 0, 127}));
  connect(tank_B401.ports[2], port_in) annotation(
    Line(points = {{-80, -10}, {-130, -10}, {-130, 30}}, color = {0, 127, 255}));
  connect(valve_V403.port_b, port_out) annotation(
    Line(points = {{80, -30}, {80, -110}}, color = {0, 127, 255}));
  connect(pipe4.port_b, volumeFlowRate.port_a) annotation(
    Line(points = {{80, 24}, {80, 16}}, color = {0, 127, 255}));
  connect(volumeFlowRate.port_b, valve_V403.port_a) annotation(
    Line(points = {{80, -4}, {80, -10}}, color = {0, 127, 255}));
  connect(step_bottleFilling.inPort[1], transitionWithSignal_tankNotEmpty.outPort) annotation(
    Line(points = {{313, 38}, {275.5, 38}}));
  connect(volumeFlowRate.V_flow, integrator.u) annotation(
    Line(points = {{92, 6}, {96, 6}, {96, -30}, {106, -30}}, color = {0, 0, 127}));
  connect(alternative.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{415.8, 58}, {327.8, 58}, {327.8, 52}, {166.8, 52}, {166.8, 84}}));
  connect(step_bottleFilling.outPort[1], transitionWithSignal_bottleIsFull.inPort) annotation(
    Line(points = {{334.5, 38}, {370.5, 38}}));
  connect(transitionWithSignal_tankNotEmpty.inPort, alternative.split[1]) annotation(
    Line(points = {{270, 38}, {261.5, 38}, {261.5, -26}, {359, -26}}));
  connect(transitionWithSignal_bottleIsFull.outPort, alternative.join[1]) annotation(
    Line(points = {{375.5, 38}, {384, 38}, {384, -26}, {500.5, -26}}));
  connect(initialStep.outPort[1], alternative.inPort) annotation(
    Line(points = {{294.5, 0}, {337, 0}, {337, -26}}));
  connect(step_tank_B402Filling.outPort[1], transitionWithSignal_tank_B402IsFull.inPort) annotation(
    Line(points = {{334.5, 78}, {370.5, 78}}));
  connect(step_tank_B402Filling.inPort[1], transitionWithSignal_tank_B402IsEmpty.outPort) annotation(
    Line(points = {{313, 78}, {275.5, 78}}));
  connect(transitionWithSignal_tank_B402IsEmpty.inPort, alternative.split[2]) annotation(
    Line(points = {{270, 78}, {359, 78}, {359, -26}}));
  connect(transitionWithSignal_tank_B402IsFull.outPort, alternative.join[2]) annotation(
    Line(points = {{375.5, 78}, {500.5, 78}, {500.5, -26}}));
  connect(pipe1.port_b, valve_leaking.port_a) annotation(
    Line(points = {{0, -50}, {10, -50}, {10, -60}}, color = {0, 127, 255}));
  connect(realExpression_valve_clogging.y, valve_clogging.opening) annotation(
    Line(points = {{19, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(realExpression_valve_leaking.y, valve_leaking.opening) annotation(
    Line(points = {{19, -70}, {18, -70}}, color = {0, 0, 127}));
  connect(valve_leaking.port_b, sink.ports[1]) annotation(
    Line(points = {{10, -80}, {10, -100}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-140, 160}, {500, -120}})),
    version = "");
end bottling_partial;