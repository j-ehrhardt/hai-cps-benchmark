model filter_partial
  extends filter_superModel;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa")) annotation(
    Placement(visible = true, transformation(origin = {-170, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Medium, nPorts = 1, p = 100000) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Fluid.Vessels.OpenTank tank_B101(redeclare package Medium = Medium, crossArea = 0.33, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 0.45, level(fixed = true, start = 0.2), level_start = 0.2, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank_B102(redeclare package Medium = Medium, crossArea = 0.33, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 0.45, level(fixed = true, start = 0.43), level_start = 0.43, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = 0, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-120, -42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.015, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-60, -56}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.015, height_ab = -0.5, length = 1) annotation(
    Placement(visible = true, transformation(origin = {60, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = 0, length = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = 1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));  
  Modelica.Fluid.Pipes.StaticPipe pipe10(replaceable package Medium = Medium, allowFlowReversal = false, diameter = 0.015, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Machines.PrescribedPump pump_P101(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 500, T_start = system.T_start, V = 0.001, V_flow_single(fixed = false, start = 1), allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear filter_F101(redeclare package Medium = Medium, allowFlowReversal = true, dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveLinear valve_V103(redeclare package Medium = Medium, allowFlowReversal = true, dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valve_clogging(redeclare package Medium = Medium, allowFlowReversal = true, dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {-60, -26}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valve_leaking(redeclare package Medium = Medium, allowFlowReversal = true, dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {-30, -56}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.Fluid.Interfaces.FluidPort_a port_out(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {120, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_in(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression_valve_V103(y = valve_V103_simulator) annotation(
    Placement(visible = true, transformation(origin = {80, 22}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression_valve_clogging(y = valve_clogging_simulator) annotation(
    Placement(visible = true, transformation(origin = {-76, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression_pump_P101(y = pump_P101_simulator) annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression const1(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 96}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {22, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {-10, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pollution_coefficient(y = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-70, 66}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression const2(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 82}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-42, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = filter_F101.port_a.m_flow) annotation(
    Placement(visible = true, transformation(origin = {-102, 44}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = tank_B102.level) annotation(
    Placement(visible = true, transformation(origin = {144, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = 0.2) annotation(
    Placement(visible = true, transformation(origin = {144, -66}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {120, -76}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete_port_in(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {294, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition annotation(
    Placement(visible = true, transformation(origin = {324, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step filtering annotation(
    Placement(visible = true, transformation(origin = {354, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal tank_B102_isFull annotation(
    Placement(visible = true, transformation(origin = {424, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step emptying annotation(
    Placement(visible = true, transformation(origin = {454, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal tank_B102_isEmpty annotation(
    Placement(visible = true, transformation(origin = {484, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step filling annotation(
    Placement(visible = true, transformation(origin = {454, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal tank_B101_isFull annotation(
    Placement(visible = true, transformation(origin = {484, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Alternative alternative annotation(
    Placement(visible = true, transformation(origin = {454, 54}, extent = {{-70, -50}, {70, 50}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = valve_leaking_simulator) annotation(
    Placement(visible = true, transformation(origin = {-10, -56}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.StateGraph.TransitionWithSignal tank_B101_isEmpty annotation(
    Placement(visible = true, transformation(origin = {424, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation 
  // conditions 
  tank_B101_isEmpty.condition = if tank_B101.level <= 0.4 * tank_B101.height then true else false;
  tank_B102_isEmpty.condition = if tank_B102.level <= 0.2 * tank_B102.height then true else false;
  tank_B101_isFull.condition = if tank_B101.level >= 0.8 * tank_B101.height then true else false;
  tank_B102_isFull.condition = if tank_B102.level >= 0.8 * tank_B102.height then true else false;
  // states
  valveDiscrete_port_in.open = if time < 2 then true elseif filling.active then true else false;
  valveDiscrete.open = if time < 2 then true elseif emptying.active then true else false;
  valve_V103.opening = if time < 2 then 1 elseif filtering.active then 1 else 0; 
  // equations 
  connect(realExpression_pump_P101.y, pump_P101.N_in) annotation(
    Line(points = {{-90, -89}, {-90, -81}}, color = {0, 0, 127}));
  connect(tank_B101.ports[1], pipe.port_a) annotation(
    Line(points = {{-120, -20}, {-120, -32}}, color = {0, 127, 255}));
  connect(pipe.port_b, pump_P101.port_a) annotation(
    Line(points = {{-120, -52}, {-120, -70}, {-100, -70}}, color = {0, 127, 255}));
  connect(pump_P101.port_b, pipe1.port_a) annotation(
    Line(points = {{-80, -70}, {-60, -70}, {-60, -66}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valve_clogging.port_a) annotation(
    Line(points = {{-60, -46}, {-60, -36}}, color = {0, 127, 255}));
  connect(realExpression_valve_clogging.y, valve_clogging.opening) annotation(
    Line(points = {{-76, -21}, {-76, -27}, {-68, -27}}, color = {0, 0, 127}));
  connect(valve_V103.port_b, pipe5.port_a) annotation(
    Line(points = {{60, 50}, {60, 58}}));
  connect(pipe5.port_b, tank_B102.ports[1]) annotation(
    Line(points = {{60, 78}, {60, 100}, {120, 100}, {120, -20}}, color = {0, 127, 255}));
  connect(pipe7.port_b, filter_F101.port_a) annotation(
    Line(points = {{-20, 0}, {-10, 0}}, color = {0, 127, 255}));
  connect(filter_F101.port_b, pipe6.port_a) annotation(
    Line(points = {{10, 0}, {20, 0}}, color = {0, 127, 255}));
  connect(valve_clogging.port_b, pipe7.port_a) annotation(
    Line(points = {{-60, -16}, {-60, 0}, {-40, 0}}, color = {0, 127, 255}));
  connect(pipe6.port_b, valve_V103.port_a) annotation(
    Line(points = {{40, 0}, {60, 0}, {60, 30}}, color = {0, 127, 255}));
  connect(product.y, add.u2) annotation(
    Line(points = {{-31, 60}, {-22, 60}}, color = {0, 0, 127}));
  connect(const1.y, division.u1) annotation(
    Line(points = {{-59, 96}, {5, 96}, {5, 88}, {10, 88}}, color = {0, 0, 127}));
  connect(integrator.y, product.u2) annotation(
    Line(points = {{-59, 44}, {-56.5, 44}, {-56.5, 54}, {-54, 54}}, color = {0, 0, 127}));
  connect(pollution_coefficient.y, product.u1) annotation(
    Line(points = {{-59, 66}, {-54, 66}}, color = {0, 0, 127}));
  connect(const2.y, add.u1) annotation(
    Line(points = {{-59, 82}, {-27, 82}, {-27, 72}, {-22, 72}}, color = {0, 0, 127}));
  connect(add.y, division.u2) annotation(
    Line(points = {{1, 66}, {5, 66}, {5, 76}, {10, 76}}, color = {0, 0, 127}));
  connect(realExpression.y, integrator.u) annotation(
    Line(points = {{-91, 44}, {-82, 44}}, color = {0, 0, 127}));
  connect(tank_B102.ports[2], pipe10.port_a) annotation(
    Line(points = {{120, -20}, {120, -30}}, color = {0, 127, 255}));
  connect(realExpression1.y, greaterThreshold.u) annotation(
    Line(points = {{144, -51}, {144, -62}}, color = {0, 0, 127}));
  connect(pipe10.port_b, valveDiscrete.port_a) annotation(
    Line(points = {{120, -50}, {120, -66}}, color = {0, 127, 255}));
  connect(valveDiscrete.port_b, port_out) annotation(
    Line(points = {{120, -86}, {120, -110}}, color = {0, 127, 255}));
  connect(valveDiscrete_port_in.port_b, tank_B101.ports[2]) annotation(
    Line(points = {{-170, 0}, {-170.5, 0}, {-170.5, -20}, {-120, -20}}, color = {0, 127, 255}));
  connect(division.y, filter_F101.opening) annotation(
    Line(points = {{34, 82}, {36, 82}, {36, 26}, {0, 26}, {0, 8}}, color = {0, 0, 127}));
  connect(tank_B102_isFull.outPort, emptying.inPort[1]) annotation(
    Line(points = {{425.5, 72}, {443.5, 72}}));
  connect(emptying.outPort[1], tank_B102_isEmpty.inPort) annotation(
    Line(points = {{464.5, 72}, {480.5, 72}}));
  connect(filling.outPort[1], tank_B101_isFull.inPort) annotation(
    Line(points = {{464.5, 34}, {480.5, 34}}));
  connect(initialStep.outPort[1], transition.inPort) annotation(
    Line(points = {{304.5, 54}, {320.5, 54}}));
  connect(alternative.split[1], tank_B102_isFull.inPort) annotation(
    Line(points = {{398.7, 54}, {420.7, 54}, {420.7, 72}}));
  connect(alternative.join[1], tank_B102_isEmpty.outPort) annotation(
    Line(points = {{509.3, 54}, {485.3, 54}, {485.3, 72}}));
  connect(alternative.join[2], tank_B101_isFull.outPort) annotation(
    Line(points = {{509.3, 54}, {485.3, 54}, {485.3, 34}}));
  connect(alternative.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{525.4, 54}, {533.4, 54}, {533.4, -38}, {273.4, -38}, {273.4, 54}, {283, 54}}));
  connect(realExpression2.y, valve_leaking.opening) annotation(
    Line(points = {{-21, -56}, {-22, -56}}, color = {0, 0, 127}));
  connect(pipe1.port_b, valve_leaking.port_a) annotation(
    Line(points = {{-60, -46}, {-60, -36}, {-30, -36}, {-30, -46}}, color = {0, 127, 255}));
  connect(valveDiscrete_port_in.port_a, port_in) annotation(
    Line(points = {{-170, 20}, {-170, 50}}, color = {0, 127, 255}));
  connect(filling.inPort[1], tank_B101_isEmpty.outPort) annotation(
    Line(points = {{443, 34}, {425, 34}}));
  connect(alternative.split[2], tank_B101_isEmpty.inPort) annotation(
    Line(points = {{398.7, 54}, {420.7, 54}, {420.7, 34}}));
  connect(filtering.outPort[1], alternative.inPort) annotation(
    Line(points = {{364.5, 54}, {382.5, 54}}));
  connect(transition.outPort, filtering.inPort[1]) annotation(
    Line(points = {{325.5, 54}, {343.5, 54}}));
  connect(valve_leaking.port_b, sink.ports[1]) annotation(
    Line(points = {{-30, -66}, {-30, -80}}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-180, 120}, {540, -120}})),
    version = "");
end filter_partial;