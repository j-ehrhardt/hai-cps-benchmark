model mixer_partial
  extends mixer_superModel;
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {70, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Medium, nPorts = 1, p = system.p_ambient) annotation(
    Placement(visible = true, transformation(origin = {12, -152}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Fluid.Vessels.OpenTank tank_B201(redeclare package Medium = Medium, crossArea = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 0.35, level(fixed = true, start = 0.1), level_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank_B202(redeclare package Medium = Medium, crossArea = 0.1, height = 0.35, level(fixed = true, start = 0.1), level_start = 0.1, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {-34, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank_B203(redeclare package Medium = Medium, crossArea = 0.1, height = 0.35, level(fixed = true, start = 0.1), level_start = 0.1, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {12, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank_B204(redeclare package Medium = Medium, crossArea = 0.33, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 0.45, level(fixed = true, start = 0.1), level_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    
 Modelica.Fluid.Vessels.OpenTank tank_reservoir(redeclare package Medium = Medium, crossArea = 0.33, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 10, level(fixed = true, start = 0.1), level_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 4, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1),Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1),Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {-79, -41}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -1, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -1, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-34, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -1, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {12, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.015, height_ab = -0.1, length = 0.4) annotation(
    Placement(visible = true, transformation(origin = {-4, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -0.5, length = 0.6) annotation(
    Placement(visible = true, transformation(origin = {80, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 270)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -0.5, length = 0.6) annotation(
    Placement(visible = true, transformation(origin = {12, -112}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Fluid.Pipes.StaticPipe pipe_out(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.015, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {110, -48}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Fluid.Machines.PrescribedPump pump_P201(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 150, T_start = system.T_start, V = 0.005, allowFlowReversal = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.001, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {62, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_clogging(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {30, -54}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_leaking(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {12, -76}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {110, -12}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_in1(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-80, 114}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_in2(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-34, 114}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_in3(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {14, 114}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_V201(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1, opening_min = 0.00000000001) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_V202(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1, opening_min = 0.00000000001) annotation(
    Placement(visible = true, transformation(origin = {-34, -4}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_V203(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1, opening_min = 0.00000000001) annotation(
    Placement(visible = true, transformation(origin = {12, -8}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_V204(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1, opening_min = 0.00000000001) annotation(
    Placement(visible = true, transformation(origin = {-36, -54}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression_valve_clogging(y = valve_clogging_simulator) annotation(
    Placement(visible = true, transformation(origin = {30, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression realExpression_valve_leaking(y = valve_leaking_simulator) annotation(
    Placement(visible = true, transformation(origin = {-8, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_in1(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-80, 134}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_in2(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-34, 134}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_in3(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {14, 134}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_out(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {110, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {198, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition annotation(
    Placement(visible = true, transformation(origin = {220, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step B201_filling annotation(
    Placement(visible = true, transformation(origin = {248, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B201_isFull(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {278, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step B204_filling annotation(
    Placement(visible = true, transformation(origin = {494, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B204_isFull(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {520, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step B202_filling annotation(
    Placement(visible = true, transformation(origin = {308, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step B203_filling annotation(
    Placement(visible = true, transformation(origin = {368, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step Reservoir_filling annotation(
    Placement(visible = true, transformation(origin = {430, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B202_isFull(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {338, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B203_isFull(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {398, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal Reservoir_isFull(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {464, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step B204_emptying annotation(
    Placement(visible = true, transformation(origin = {550, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B204_isEmpty(enableTimer = true, waitTime = 0) annotation(
    Placement(visible = true, transformation(origin = {580, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  // conditions
  B201_isFull.condition = tank_B201.level >= tank_B201.height * maxVolPercentage;
  B202_isFull.condition = tank_B202.level >= tank_B202.height * maxVolPercentage;
  B203_isFull.condition = tank_B203.level >= tank_B203.height * maxVolPercentage;
  B204_isFull.condition = tank_reservoir.level <= tank_reservoir.height * minVolPercentage;
  Reservoir_isFull.condition = tank_B203.level <= tank_B203.height * minVolPercentage;
  B204_isEmpty.condition = tank_B204.level < tank_B204.height * minVolPercentageMixer;
// actions
  valve_in1.open = if time <= 1 then true elseif B201_filling.active then true else false;
  valve_in2.open = if time <= 1 then true elseif B202_filling.active then true else false;
  valve_in3.open = if time <= 1 then true elseif B203_filling.active then true else false;
  valve_V201.open = if time <= 1 then true elseif Reservoir_filling.active then true else false;
  valve_V202.open = if time <= 1 then true elseif Reservoir_filling.active then true else false;
  valve_V203.open = if time <= 1 then true elseif Reservoir_filling.active then true else false;
  valve_V204.open = if time <= 1 then true elseif B204_filling.active then true else false;
//if time <1 then 1 elseif
  pump_P201.N_in = if time <= 1 then 150 elseif B204_filling.active then pump_P201_simulator else 0;
//if time <11 then 150
  valveDiscrete.open = if time <= 1 then true elseif B204_emptying.active then true else false;
  connect(tank_B202.ports[1], pipe1.port_a) annotation(
    Line(points = {{-34, 50}, {-34, 30}}, color = {0, 127, 255}));
  connect(tank_B203.ports[1], pipe2.port_a) annotation(
    Line(points = {{12, 50}, {12, 30}}, color = {0, 127, 255}));
  connect(pipe4.port_b, tank_B204.ports[1]) annotation(
    Line(points = {{80, -10}, {80, 20}}, color = {0, 127, 255}));
 connect(initialStep.outPort[1], transition.inPort) annotation(
    Line(points = {{208.5, 110}, {216, 110}}));
 connect(transition.outPort, B201_filling.inPort[1]) annotation(
    Line(points = {{221.5, 110}, {237, 110}}));
 connect(B204_filling.outPort[1], B204_isFull.inPort) annotation(
    Line(points = {{504.5, 110}, {516, 110}}));
  connect(realExpression_valve_clogging.y, valve_clogging.opening) annotation(
    Line(points = {{30, -63}, {29.5, -63}, {29.5, -62}, {30, -62}}, color = {0, 0, 127}));
  connect(realExpression_valve_leaking.y, valve_leaking.opening) annotation(
    Line(points = {{3, -76}, {4, -76}}, color = {0, 0, 127}));
  connect(pipe3.port_b, valve_clogging.port_a) annotation(
    Line(points = {{6, -54}, {20, -54}}, color = {0, 127, 255}));
  connect(tank_B201.ports[1], pipe.port_a) annotation(
    Line(points = {{-80, 50}, {-80, 30}}, color = {0, 127, 255}));
  connect(pipe_out.port_b, port_out) annotation(
    Line(points = {{110, -58}, {110, -90}}, color = {0, 127, 255}));
  connect(tank_B204.ports[2], valveDiscrete.port_a) annotation(
    Line(points = {{80, 20}, {110, 20}, {110, -2}}, color = {0, 127, 255}));
  connect(valveDiscrete.port_b, pipe_out.port_a) annotation(
    Line(points = {{110, -22}, {110, -38}}, color = {0, 127, 255}));
  connect(valve_in1.port_a, port_in1) annotation(
    Line(points = {{-80, 124}, {-80, 134}}, color = {0, 127, 255}));
  connect(tank_B201.ports[2], valve_in1.port_b) annotation(
    Line(points = {{-80, 50}, {-80, 104}}, color = {0, 127, 255}));
  connect(valve_in2.port_a, port_in2) annotation(
    Line(points = {{-34, 124}, {-34, 134}}, color = {0, 127, 255}));
  connect(tank_B202.ports[2], valve_in2.port_b) annotation(
    Line(points = {{-34, 50}, {-34, 104}}, color = {0, 127, 255}));
  connect(valve_in3.port_a, port_in3) annotation(
    Line(points = {{14, 124}, {14, 134}}, color = {0, 127, 255}));
  connect(tank_B203.ports[2], valve_in3.port_b) annotation(
    Line(points = {{12, 50}, {14, 50}, {14, 104}}, color = {0, 127, 255}));
 connect(B201_filling.outPort[1], B201_isFull.inPort) annotation(
    Line(points = {{258.5, 110}, {274.5, 110}}));
 connect(B201_isFull.outPort, B202_filling.inPort[1]) annotation(
    Line(points = {{279.5, 110}, {297.5, 110}}));
 connect(B202_filling.outPort[1], B202_isFull.inPort) annotation(
    Line(points = {{318.5, 110}, {334.5, 110}}));
 connect(B202_isFull.outPort, B203_filling.inPort[1]) annotation(
    Line(points = {{339.5, 110}, {357.5, 110}}));
 connect(B203_filling.outPort[1], B203_isFull.inPort) annotation(
    Line(points = {{378.5, 110}, {394.5, 110}}));
 connect(B204_isFull.outPort, B204_emptying.inPort[1]) annotation(
    Line(points = {{521.5, 110}, {539.5, 110}}));
 connect(B204_emptying.outPort[1], B204_isEmpty.inPort) annotation(
    Line(points = {{560.5, 110}, {576.5, 110}}));
 connect(B204_isEmpty.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{581.5, 110}, {603.5, 110}, {603.5, 74}, {179.5, 74}, {179.5, 110}, {186.5, 110}}));
  connect(pump_P201.port_b, pipe4.port_a) annotation(
    Line(points = {{72, -54}, {80, -54}, {80, -30}}, color = {0, 127, 255}));
  connect(pump_P201.port_a, valve_clogging.port_b) annotation(
    Line(points = {{52, -54}, {40, -54}}, color = {0, 127, 255}));
 connect(pipe.port_b, valve_V201.port_a) annotation(
    Line(points = {{-80, 10}, {-80, 0}}));
 connect(pipe1.port_b, valve_V202.port_a) annotation(
    Line(points = {{-34, 10}, {-34, 6}}, color = {0, 127, 255}));
 connect(pipe2.port_b, valve_V203.port_a) annotation(
    Line(points = {{12, 10}, {12, 2}}, color = {0, 127, 255}));
 connect(valve_V201.port_b, tank_reservoir.ports[1]) annotation(
    Line(points = {{-80, -20}, {-80, -47}, {-79, -47}, {-79, -48}}, color = {0, 127, 255}));
 connect(valve_V202.port_b, tank_reservoir.ports[2]) annotation(
    Line(points = {{-34, -14}, {-33.75, -14}, {-33.75, -24}, {-69, -24}, {-69, -26}, {-79, -26}, {-79, -48}}, color = {0, 127, 255}));
 connect(valve_V203.port_b, tank_reservoir.ports[3]) annotation(
    Line(points = {{12, -18}, {-34, -18}, {-34, -36}, {-74, -36}, {-74, -37}, {-79, -37}, {-79, -48}}, color = {0, 127, 255}));
 connect(pipe3.port_a, valve_V204.port_b) annotation(
    Line(points = {{-14, -54}, {-26, -54}}, color = {0, 127, 255}));
 connect(valve_V204.port_a, tank_reservoir.ports[4]) annotation(
    Line(points = {{-46, -54}, {-79, -54}, {-79, -48}}, color = {0, 127, 255}));
 connect(B204_filling.inPort[1], Reservoir_isFull.outPort) annotation(
    Line(points = {{483, 110}, {465, 110}}));
 connect(Reservoir_isFull.inPort, Reservoir_filling.outPort[1]) annotation(
    Line(points = {{460, 110}, {440, 110}}));
 connect(Reservoir_filling.inPort[1], B203_isFull.outPort) annotation(
    Line(points = {{419, 110}, {399, 110}}));
 connect(valve_leaking.port_b, pipe5.port_a) annotation(
    Line(points = {{12, -86}, {12, -102}}, color = {0, 127, 255}));
 connect(pipe5.port_b, sink.ports[1]) annotation(
    Line(points = {{12, -122}, {12, -142}}, color = {0, 127, 255}));
 connect(pipe3.port_b, valve_leaking.port_a) annotation(
    Line(points = {{6, -54}, {12, -54}, {12, -66}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Documentation,
    Diagram(coordinateSystem(extent = {{-120, 140}, {600, -180}})),
    version = "");
end mixer_partial;