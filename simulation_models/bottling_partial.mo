model bottling_partial
  extends bottling_superModel;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa")) annotation(
    Placement(visible = true, transformation(origin = {-130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Water.StandardWater;  
  
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Medium, nPorts = 1, p = 99000) annotation(
    Placement(visible = true, transformation(origin = {10, -110}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Fluid.Vessels.OpenTank tank_B401(redeclare package Medium = Medium, crossArea = 0.33, height = 0.45, level(fixed = true, start = 0.05), level_start = 0.05, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank_B402(redeclare package Medium = Medium, crossArea = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 0.35, level(fixed = true, start = 0.01), level_start = 0.01, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.1)}) annotation(
    Placement(visible = true, transformation(origin = {80, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.015, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));  
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.015, height_ab = -0.4, length = 0.725) annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.015, height_ab = -0.4, length = 0.4) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Medium, allowFlowReversal = false, diameter = 0.05, height_ab = -1, length = 0.175) annotation(
    Placement(visible = true, transformation(origin = {80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valve_V403(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {80, -50}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valve_clogging(redeclare package Medium = Medium, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveLinear valve_leaking(redeclare package Medium = Medium, allowFlowReversal = true, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Machines.PrescribedPump pump_P401(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 500, T_start = system.T_start, V = 0.000001, V_flow_single(fixed = false), allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.001, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_out(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_in(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression_valve_clogging(y = valve_clogging_simulator) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression_valve_leaking(y = valve_leaking_simulator) annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete_port_in(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    
    Modelica.Fluid.Valves.ValveDiscrete valveDiscrete_V404(redeclare package Medium = Medium, allowFlowReversal = false, dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
    
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step B401_filling annotation(
    Placement(visible = true, transformation(origin = {316, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B401_isFull annotation(
    Placement(visible = true, transformation(origin = {346, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B402_isEmpty annotation(
    Placement(visible = true, transformation(origin = {490, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step bottling annotation(
    Placement(visible = true, transformation(origin = {460, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition1 annotation(
    Placement(visible = true, transformation(origin = {234, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal B402_isFull annotation(
    Placement(visible = true, transformation(origin = {430, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep1 annotation(
    Placement(visible = true, transformation(origin = {204, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step B402_filling annotation(
    Placement(visible = true, transformation(origin = {406, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  valveDiscrete_port_in.open = if time < 2 then true elseif B401_filling.active then true else false;
  valveDiscrete_V404.open = if time < 2 then true elseif B402_filling.active then true else false;
  valve_V403.opening = if bottling.active then if sin(volumeFlow_factor * time) >= 0 then 1 else 0 else 0;
  pump_P401.N_in = if time < 2 then pump_P401_simulator elseif B402_filling.active then pump_P401_simulator else 0;
  //B401_isEmpty.condition = if tank_B401.level <= 0.4 * tank_B401.height then true else false;
  B402_isEmpty.condition = if tank_B402.level <= minVolPercentage * tank_B402.height then true else false;
  B401_isFull.condition = if tank_B401.level >= maxVolPercentage * tank_B401.height then true else false;
  B402_isFull.condition = if tank_B402.level >= maxVolPercentage * tank_B402.height then true else false;
  connect(tank_B401.ports[1], pipe.port_a) annotation(
    Line(points = {{-80, -10}, {-80, -20}}, color = {0, 127, 255}));
  connect(pipe.port_b, pump_P401.port_a) annotation(
    Line(points = {{-80, -40}, {-80, -50}, {-60, -50}}, color = {0, 127, 255}));
  connect(pump_P401.port_b, pipe1.port_a) annotation(
    Line(points = {{-40, -50}, {-20, -50}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valve_clogging.port_a) annotation(
    Line(points = {{0, -50}, {10, -50}, {10, 0}}, color = {0, 127, 255}));
  connect(pipe3.port_b, tank_B402.ports[1]) annotation(
    Line(points = {{10, 80}, {10, 100}, {80, 100}, {80, 60}}, color = {0, 127, 255}));
  connect(tank_B402.ports[2], pipe4.port_a) annotation(
    Line(points = {{80, 60}, {80, 44}}, color = {0, 127, 255}));
  connect(valve_V403.port_b, port_out) annotation(
    Line(points = {{80, -60}, {80, -110}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valve_leaking.port_a) annotation(
    Line(points = {{0, -50}, {10, -50}, {10, -70}}, color = {0, 127, 255}));
  connect(realExpression_valve_clogging.y, valve_clogging.opening) annotation(
    Line(points = {{19, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(realExpression_valve_leaking.y, valve_leaking.opening) annotation(
    Line(points = {{19, -80}, {18, -80}}, color = {0, 0, 127}));
  connect(valveDiscrete_port_in.port_a, port_in) annotation(
    Line(points = {{-130, 20}, {-130, 30}}, color = {0, 127, 255}));
  connect(valveDiscrete_port_in.port_b, tank_B401.ports[2]) annotation(
    Line(points = {{-130, 0}, {-130, -10}, {-80, -10}}, color = {0, 127, 255}));
  connect(pipe4.port_b, valve_V403.port_a) annotation(
    Line(points = {{80, 24}, {80, -40}}, color = {0, 127, 255}));
  connect(bottling.outPort[1], B402_isEmpty.inPort) annotation(
    Line(points = {{470.5, 58}, {486.5, 58}}));
  connect(B402_isFull.outPort, bottling.inPort[1]) annotation(
    Line(points = {{431.5, 58}, {449, 58}}));
  connect(initialStep1.outPort[1], transition1.inPort) annotation(
    Line(points = {{214.5, 56}, {230, 56}}));
  connect(B401_filling.outPort[1], B401_isFull.inPort) annotation(
    Line(points = {{326.5, 56}, {342.5, 56}}));
  connect(valve_leaking.port_b, sink.ports[1]) annotation(
    Line(points = {{10, -90}, {10, -100}}, color = {0, 127, 255}));
  connect(B402_filling.outPort[1], B402_isFull.inPort) annotation(
    Line(points = {{416.5, 58}, {426.5, 58}}));
  connect(B401_filling.inPort[1], transition1.outPort) annotation(
    Line(points = {{306, 56}, {236, 56}}));
  connect(B401_isFull.outPort, B402_filling.inPort[1]) annotation(
    Line(points = {{348, 56}, {396, 56}, {396, 58}}));
  connect(B402_isEmpty.outPort, initialStep1.inPort[1]) annotation(
    Line(points = {{492, 58}, {504, 58}, {504, 20}, {194, 20}, {194, 56}}));
  connect(valveDiscrete_V404.port_b, pipe3.port_a) annotation(
    Line(points = {{10, 50}, {10, 60}}, color = {0, 127, 255}));
  connect(valveDiscrete_V404.port_a, valve_clogging.port_b) annotation(
    Line(points = {{10, 30}, {10, 20}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-140, 120}, {560, -120}})),
    version = "");
end bottling_partial;