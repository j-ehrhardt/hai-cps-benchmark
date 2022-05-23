model still_partial
  extends still_superModel;
  inner Modelica.Fluid.System system(allowFlowReversal = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa")) annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  // components
  Modelica.Fluid.Vessels.OpenTank tank_B101(redeclare package Medium = Medium, crossArea = 0.33, height = 0.55, level(start = 0.01), level_start = 0.01, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011)}) annotation(
    Placement(visible = true, transformation(origin = {20, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank_B102(redeclare package Medium = Medium, crossArea = 0.33, height = 0.33, level(start = 0.1), level_start = 0.1, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011)}) annotation(
    Placement(visible = true, transformation(origin = {14, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank_B103(redeclare package Medium = Medium, crossArea = 0.33, height = 0.33, level(start = 0.1), level_start = 0.1, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011)}) annotation(
    Placement(visible = true, transformation(origin = {20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_out1(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {190, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_out2(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {190, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_in(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {190, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-108, -8}, {-88, 12}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete valve_V101(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {150, -60}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveDiscrete valve_V102(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {150, -140}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveDiscrete valve_input(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {150, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveDiscrete valve_output_evap(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, -70}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valve_fill_evap(redeclare package Medium = Medium, allowFlowReversal = true, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete evaporating_true(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-46, -34}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveLinear valve_leaking(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {110, -90}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valve_clogging(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 100, m_flow(fixed = false), m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -60}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression_leaking(y = valve_leaking_simulator) annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression_clogging(y = valve_clogging_simulator) annotation(
    Placement(visible = true, transformation(origin = {90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Medium, nPorts = 1, p = system.p_ambient) annotation(
    Placement(visible = true, transformation(origin = {190, -110}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.1e-3, 0.15e-3}, head_nominal = {10, 5, 0}), redeclare package Medium = Medium, N_nominal = 200, V = 9.999999999999999e-05, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_a_start = 100000, p_b_start = 100000, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -0.5, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -0.5, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {20, 42}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {150, -110}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -0.5, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-40, -110}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -0.5, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = -0.5, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {60, -140}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  // state graph
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {250, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step fill_evap annotation(
    Placement(visible = true, transformation(origin = {330, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step fill_tankB101 annotation(
    Placement(visible = true, transformation(origin = {290, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step_evap annotation(
    Placement(visible = true, transformation(origin = {410, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal evap_isFull(enableTimer = false, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {350, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal start_process(waitTime = 3) annotation(
    Placement(visible = true, transformation(origin = {270, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step empty_remainingEvap annotation(
    Placement(visible = true, transformation(origin = {450, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal evap_isEmpty(waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {470, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal tankB101_isFull(waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {310, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal heating_isComplete(enableTimer = true, waitTime = 352) annotation(
    Placement(visible = true, transformation(origin = {390, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step empty_reservoirTanks annotation(
    Placement(visible = true, transformation(origin = {490, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal tanks_areEmpty(waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {510, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  evaporator evaporator0 annotation(
    Placement(visible = true, transformation(origin = {-85.0576, -115.162}, extent = {{7.05759, 38.8168}, {81.1623, 81.1623}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal evaporating_isFinished(enableTimer = false, waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {430, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step wait annotation(
    Placement(visible = true, transformation(origin = {370, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal tanks_areEmpty2(waitTime = 1) annotation(
    Placement(visible = true, transformation(origin = {554, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step empty_reservoirTank2 annotation(
    Placement(visible = true, transformation(origin = {534, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
// conditions
  start_process.condition = true;
  tankB101_isFull.condition = if tank_B101.level >= max_levelTank * tank_B101.height then true else false;
  evap_isFull.condition = if evaporator0.evaporator_tank.level >= max_levelTank * evaporator0.evaporator_tank.height then true else false;
  heating_isComplete.condition = if evaporator0.evaporator_tank.level >= max_levelTank * evaporator0.evaporator_tank.height then true else false;
  evap_isEmpty.condition = if evaporator0.evaporator_tank.level <= min_levelTank * evaporator0.evaporator_tank.height then true else false;
  //tanks_areEmpty.condition = if tank_B102.level <= min_levelTank * tank_B102.height and tank_B103.level <= min_levelTank * tank_B103.height then true else false;
  tanks_areEmpty.condition = if tank_B102.level <= min_levelTank * tank_B102.height then true else false;
  tanks_areEmpty2.condition = if tank_B103.level <= min_levelTank * tank_B103.height then true else false;
  
  evaporating_isFinished.condition = if evaporator0.evaporator_tank.level <= evap_level * evaporator0.evaporator_tank.height then true else false;
// actions
  valve_input.open = if time <= 2 or fill_tankB101.active then true else false;
  valve_fill_evap.open = if time <= 2 or fill_evap.active then true else false;
  pump.N_in = if time <= 2 or fill_evap.active then 400 else 0;
  evaporator0.evaporating_water.N_in = if time <= 2 or step_evap.active then 200 else 0;
  evaporating_true.open = if time <= 2 or step_evap.active then true else false;
  valve_output_evap.open = if time <= 2 or empty_remainingEvap.active then true else false;
  valve_V101.open = if empty_reservoirTanks.active then true else false;
  //valve_V102.open = if time <= 2 or empty_reservoirTanks.active then true else false;
  valve_V102.open = if empty_reservoirTank2.active then true else false;
// equations
  connect(valve_input.port_a, port_in) annotation(
    Line(points = {{160, 60}, {190, 60}}));
  connect(valve_input.port_b, pipe1.port_a) annotation(
    Line(points = {{140, 60}, {120, 60}}, color = {0, 127, 255}));
  connect(pipe1.port_b, tank_B101.ports[1]) annotation(
    Line(points = {{100, 60}, {20, 60}}, color = {0, 127, 255}));
  connect(tank_B101.ports[2], pipe2.port_a) annotation(
    Line(points = {{20, 60}, {20, 52}}, color = {0, 127, 255}));
  connect(pipe2.port_b, pump.port_a) annotation(
    Line(points = {{20, 32}, {20, 30}, {0, 30}}, color = {0, 127, 255}));
  connect(pipe5.port_b, valve_clogging.port_a) annotation(
    Line(points = {{70, -60}, {80, -60}}, color = {0, 127, 255}));
  connect(valve_clogging.port_b, valve_leaking.port_a) annotation(
    Line(points = {{100, -60}, {110, -60}, {110, -80}}, color = {0, 127, 255}));
  connect(valve_clogging.port_b, valve_V101.port_a) annotation(
    Line(points = {{100, -60}, {140, -60}}, color = {0, 127, 255}));
  connect(valve_V101.port_b, port_out1) annotation(
    Line(points = {{160, -60}, {190, -60}}, color = {0, 127, 255}));
  connect(realExpression_clogging.y, valve_clogging.opening) annotation(
    Line(points = {{90, -51}, {90, -52}}, color = {0, 0, 127}));
  connect(realExpression_leaking.y, valve_leaking.opening) annotation(
    Line(points = {{101, -90}, {102, -90}}, color = {0, 0, 127}));
  connect(valve_output_evap.port_b, pipe4.port_a) annotation(
    Line(points = {{-40, -80}, {-40, -100}}, color = {0, 127, 255}));
  connect(pipe4.port_b, tank_B103.ports[1]) annotation(
    Line(points = {{-40, -120}, {-40, -140}, {20, -140}}, color = {0, 127, 255}));
  connect(tank_B103.ports[2], pipe6.port_a) annotation(
    Line(points = {{20, -140}, {50, -140}}, color = {0, 127, 255}));
  connect(pipe6.port_b, valve_V102.port_a) annotation(
    Line(points = {{70, -140}, {140, -140}}, color = {0, 127, 255}));
  connect(valve_V102.port_b, port_out2) annotation(
    Line(points = {{160, -140}, {190, -140}}, color = {0, 127, 255}));
  connect(initialStep.outPort[1], start_process.inPort) annotation(
    Line(points = {{260.5, 40}, {262.5, 40}, {262.5, 70}, {266.5, 70}}));
  connect(start_process.outPort, fill_tankB101.inPort[1]) annotation(
    Line(points = {{271.5, 70}, {273.5, 70}, {273.5, 40}, {279.5, 40}}));
  connect(fill_tankB101.outPort[1], tankB101_isFull.inPort) annotation(
    Line(points = {{300.5, 40}, {302.5, 40}, {302.5, 70}, {306.5, 70}}));
  connect(tankB101_isFull.outPort, fill_evap.inPort[1]) annotation(
    Line(points = {{311.5, 70}, {313.5, 70}, {313.5, 40}, {319.5, 40}}));
  connect(fill_evap.outPort[1], evap_isFull.inPort) annotation(
    Line(points = {{340.5, 40}, {342, 40}, {342, 70}, {346, 70}}));
  connect(empty_remainingEvap.outPort[1], evap_isEmpty.inPort) annotation(
    Line(points = {{460, 40}, {462, 40}, {462, 70}, {466, 70}}));
  connect(evap_isEmpty.outPort, empty_reservoirTanks.inPort[1]) annotation(
    Line(points = {{472, 70}, {474, 70}, {474, 40}, {480, 40}}));
  connect(empty_reservoirTanks.outPort[1], tanks_areEmpty.inPort) annotation(
    Line(points = {{500, 40}, {502, 40}, {502, 70}, {506, 70}}));
  connect(pump.port_b, valve_fill_evap.port_a) annotation(
    Line(points = {{-20, 30}, {-40, 30}, {-40, 20}}, color = {0, 127, 255}));
  connect(evaporator0.port_out0, valve_output_evap.port_a) annotation(
    Line(points = {{-40, -50}, {-40, -60}}, color = {0, 127, 255}));
  connect(valve_fill_evap.port_b, evaporator0.port_in0) annotation(
    Line(points = {{-40, 0}, {-38, 0}, {-38, -15}, {-39, -15}}, color = {0, 127, 255}));
  connect(valve_leaking.port_b, pipe3.port_a) annotation(
    Line(points = {{110, -100}, {110, -110}, {140, -110}}, color = {0, 127, 255}));
  connect(pipe3.port_b, sink.ports[1]) annotation(
    Line(points = {{160, -110}, {180, -110}}, color = {0, 127, 255}));
  connect(tank_B102.ports[1], pipe5.port_a) annotation(
    Line(points = {{14, -60}, {50, -60}}, color = {0, 127, 255}));
  connect(evaporator0.port_out1, evaporating_true.port_a) annotation(
    Line(points = {{14, -22}, {-56, -22}, {-56, -34}}, color = {0, 127, 255}));
  connect(evaporating_true.port_b, tank_B102.ports[2]) annotation(
    Line(points = {{-36, -34}, {-36, -47}, {14, -47}, {14, -60}}, color = {0, 127, 255}));
  connect(wait.outPort[1], heating_isComplete.inPort) annotation(
    Line(points = {{380.5, 40}, {382.5, 40}, {382.5, 70}, {386.5, 70}}));
  connect(step_evap.outPort[1], evaporating_isFinished.inPort) annotation(
    Line(points = {{420.5, 40}, {422.5, 40}, {422.5, 70}, {426.5, 70}}));
  connect(evap_isFull.outPort, wait.inPort[1]) annotation(
    Line(points = {{352, 70}, {354, 70}, {354, 40}, {360, 40}}));
  connect(heating_isComplete.outPort, step_evap.inPort[1]) annotation(
    Line(points = {{392, 70}, {394, 70}, {394, 40}, {400, 40}}));
  connect(evaporating_isFinished.outPort, empty_remainingEvap.inPort[1]) annotation(
    Line(points = {{432, 70}, {434, 70}, {434, 40}, {440, 40}}));
  connect(tanks_areEmpty.outPort, empty_reservoirTank2.inPort[1]) annotation(
    Line(points = {{512, 70}, {516, 70}, {516, 40}, {524, 40}}));
  connect(empty_reservoirTank2.outPort[1], tanks_areEmpty2.inPort) annotation(
    Line(points = {{544, 40}, {546, 40}, {546, 70}, {550, 70}}));
  connect(tanks_areEmpty2.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{556, 70}, {562, 70}, {562, 20}, {228, 20}, {228, 40}, {240, 40}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-80, 120}, {580, -160}})),
    version = "",
    uses(Modelica(version = "3.2.3")));
end still_partial;