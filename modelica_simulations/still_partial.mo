model still_partial
  extends Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses;
  extends still_superModel;
  replaceable package Medium = Modelica.Media.Water.StandardWater;

  Modelica.Fluid.Sources.FixedBoundary sink(
      redeclare package Medium = Medium, 
      nPorts = 1, 
      p = system.p_ambient) 
      annotation(
      Placement(visible = true, transformation(origin = {-40, -170}, extent = {{10, 10}, {-10, -10}}, rotation = -90))); 

  Modelica.Fluid.Vessels.OpenTank input_reservoir(
    redeclare package Medium = Medium,
    crossArea = 10,
    height = 10,
    nPorts = 2,
    portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011),
    Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011)}) 
    annotation(
    Placement(visible = true, transformation(origin = {70, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank_B102(
    redeclare package Medium = Medium, V0 = 0.0001, 
    crossArea = 1, 
    height = .2, level(fixed = true, start = 0.01), level_start = 0.01, 
    nPorts = 2,
    nTopPorts = 1, 
    portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011)}) 
    annotation(
    Placement(visible = true, transformation(origin = {62, -52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWith3InletOutletArraysWithEvaporatorCondensor tank_B101(
    redeclare package Medium = Medium, 
    V0 = 0.001, 
    bottom_pipeArea = {0.0001, 0.0001}, 
    crossArea = .0177, 
    height = .13, 
    initType = Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.Init.InitialValues, 
    level_start = 0.0009, 
    min_level_for_heating = .0001, 
    n_BottomPorts = 2, 
    n_SidePorts = 1, 
    n_TopPorts = 1, 
    side_pipeArea = {0.0001}, 
    top_pipeArea = {0.0001}) 
    annotation(
    Placement(visible = true, transformation(origin = {20, -38}, extent = {{-40, -18}, {40, 18}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts output_reservoir(
    redeclare package Medium = Medium,
    V0 = 0.0001,
    crossArea = 1,
    height = .2, level(fixed = true, start = 0.01), level_start = 0.01,
    nPorts = 2,
    nTopPorts = 1,
    portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.011)}) 
    annotation(
    Placement(visible = true, transformation(origin = {0, -150}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
    annotation(
    Placement(visible = true, transformation(origin = {-70, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(
    redeclare package Medium = Medium, 
    dp_nominal(displayUnit = "Pa") = 100, 
    m_flow_nominal = 1) 
    annotation(
    Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));

  Modelica.Fluid.Machines.PrescribedPump pump(
    redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.1e-3, 0.15e-3}, head_nominal = {10, 5, 0}), 
    redeclare package Medium = Medium, 
    N_nominal = 200, 
    V = 9.999999999999999e-05, 
    checkValve = true, 
    energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
    m_flow_start = 0.1, 
    massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
    p_a_start = 100000, 
    p_b_start = 100000, 
    use_N_in = true) 
    annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));

  Modelica.Blocks.Logical.Less less_fillingValve 
    annotation(
    Placement(visible = true, transformation(origin = {-310, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression evap_level_max_ref(
    y = tank_B101.height) 
    annotation(
    Placement(visible = true, transformation(origin = {-410, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid(
    amplitude = 2000,
    falling = 3,
    rising = 3) 
    annotation(
    Placement(visible = true, transformation(origin = {-104, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.MathBoolean.OnDelay onDelay(
    delayTime = 50) 
    annotation(
    Placement(visible = true, transformation(origin = {-128, -38}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));


  Modelica.Blocks.Sources.RealExpression tank_B101_crossArea(
    y = tank_B101.crossArea) 
    annotation(
    Placement(visible = true, transformation(origin = {-410, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product product1 
    annotation(
    Placement(visible = true, transformation(origin = {-382, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product evapTank_refMaxV 
    annotation(
    Placement(visible = true, transformation(origin = {-350, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product evapTank_refMinV 
    annotation(
    Placement(visible = true, transformation(origin = {-350, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression tank_B102_crossArea(
    y = tank_B102.crossArea) 
    annotation(
    Placement(visible = true, transformation(origin = {-266, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression tank_B102_height(
    y = tank_B102.height) 
    annotation(
    Placement(visible = true, transformation(origin = {-266, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product product5 
    annotation(
    Placement(visible = true, transformation(origin = {-226, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product condensedTank_refMaxV 
    annotation(
    Placement(visible = true, transformation(origin = {-196, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression tank_B102_level(
    y = tank_B102.level) 
    annotation(
    Placement(visible = true, transformation(origin = {-266, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product condensedTank_V 
    annotation(
    Placement(visible = true, transformation(origin = {-226, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression evapTank_level(
    y = tank_B101.level) 
    annotation(
    Placement(visible = true, transformation(origin = {-382, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Math.Product evapTank_V 
    annotation(
    Placement(visible = true, transformation(origin = {-350, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.InitialStep initialStep 
    annotation(
    Placement(visible = true, transformation(origin = {-408, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot 
    annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Step step_filling 
    annotation(
    Placement(visible = true, transformation(origin = {-348, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Step step_evap 
    annotation(
    Placement(visible = true, transformation(origin = {-288, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transition_evapFull_and_condensedNotFull 
    annotation(
    Placement(visible = true, transformation(origin = {-318, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transition_inputReservoirIsNotEmpty 
    annotation(
    Placement(visible = true, transformation(origin = {-378, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transition_evapIsEmpty 
    annotation(
    Placement(visible = true, transformation(origin = {-258, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Valves.ValveDiscrete valve_V101(
    redeclare package Medium = Medium,
    dp_nominal(displayUnit = "Pa") = 100,
    m_flow_nominal = 1) 
    annotation(
    Placement(visible = true, transformation(origin = {0, -74}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));

  Modelica.Fluid.Valves.ValveLinear valve_leaking(
    redeclare package Medium = Medium,
    dp_nominal(displayUnit = "Pa") = 100,
    m_flow_nominal = 1) 
    annotation(
    Placement(visible = true, transformation(origin = {-40, -140}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));

  Modelica.Fluid.Valves.ValveLinear valve_clogging(
    redeclare package Medium = Medium,
    dp_nominal(displayUnit = "Pa") = 100,
    m_flow_nominal = 1) 
    annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));


  Modelica.StateGraph.Step step_output 
    annotation(
    Placement(visible = true, transformation(origin = {-228, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transition_evapLevelIsZero 
    annotation(
    Placement(visible = true, transformation(origin = {-198, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Pipes.DynamicPipe pipe_inputToEvap(
    redeclare package Medium = Medium,
    diameter = 0.01,
    height_ab = 0.1,
    length = 0.6) 
    annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));

  Modelica.Fluid.Pipes.DynamicPipe dynamicPipe(
    redeclare package Medium = Medium,
    diameter = 0.01,
    height_ab = -2,
    length = 0.4) 
    annotation(
    Placement(visible = true, transformation(origin = {0, -106}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));

  Modelica.Fluid.Interfaces.FluidPort_a port_out1(
    redeclare package Medium = Medium) 
    annotation(
    Placement(visible = true, transformation(origin = {190, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_a port_out2(
    redeclare package Medium = Medium) 
    annotation(
    Placement(visible = true, transformation(origin = {190, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));


  Modelica.Fluid.Interfaces.FluidPort_b port_in(
    redeclare package Medium = Medium)
    
    annotation(
    Placement(visible = true, transformation(origin = {190, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-108, -8}, {-88, 12}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear V101(
    redeclare package Medium = Medium,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40) 
  annotation(
    Placement(visible = true, transformation(origin = {130, -72}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear V102(    
    redeclare package Medium = Medium,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40) 
  
  annotation(
    Placement(visible = true, transformation(origin = {130, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = outlet) annotation(
    Placement(visible = true, transformation(origin = {110, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression realExpression_leaking(y = valve_leaking_simulator) annotation(
    Placement(visible = true, transformation(origin = {-60, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Sources.RealExpression realExpression_clogging(y = valve_clogging_simulator) annotation(
    Placement(visible = true, transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

equation
  pump.N_in = pump_N;
  evapTank_refMaxV.u2 = evapTank_refMaxV_Val;
  evapTank_refMinV.u2 = evapTank_refMinV_Val;
  condensedTank_refMaxV.u2 = condensedTank_refMaxV_Val;
  valve_V101.open = step_output.active;
  valveDiscrete.open = step_filling.active;
  onDelay.u = step_evap.active;
  transition_evapFull_and_condensedNotFull.condition = evapTank_V.y >= evapTank_refMaxV.y and condensedTank_V.y <= condensedTank_refMaxV.y;
  transition_inputReservoirIsNotEmpty.condition = input_reservoir.V > input_reservoir.height * input_reservoir.crossArea * 0.1;
  transition_evapIsEmpty.condition = evapTank_V.y <= evapTank_refMinV.y;
//TO-DO: change condition to restart cycle. Current error: "Attempt to fill tank while evaporating"
  transition_evapLevelIsZero.condition = false;
//evap_level.y < 0.001;
  connect(tank_B101.Condensed, tank_B102.topPorts[1]) annotation(
    Line(points = {{60, -27}, {60, -28}, {62, -28}, {62, -31}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow.port, tank_B101.heatPort) annotation(
    Line(points = {{-60, -38}, {-20, -38}}, color = {191, 0, 0}));
  connect(valveDiscrete.port_b, tank_B101.TopFluidPort[1]) annotation(
    Line(points = {{0, -8}, {0, -20}}, color = {0, 127, 255}));
  connect(triggeredTrapezoid.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-93, -38}, {-80, -38}}, color = {0, 0, 127}));
  connect(less_fillingValve.u2, evapTank_refMaxV.y) annotation(
    Line(points = {{-322, -34}, {-339, -34}}, color = {0, 0, 127}));
  connect(evap_level_max_ref.y, product1.u2) annotation(
    Line(points = {{-399, -34}, {-394, -34}}, color = {0, 0, 127}));
  connect(product1.u1, tank_B101_crossArea.y) annotation(
    Line(points = {{-394, -22}, {-398.5, -22}, {-398.5, -12}, {-399, -12}}, color = {0, 0, 127}));
  connect(product1.y, evapTank_refMaxV.u1) annotation(
    Line(points = {{-371, -28}, {-362, -28}}, color = {0, 0, 127}));
  connect(product1.y, evapTank_refMinV.u1) annotation(
    Line(points = {{-371, -28}, {-371, -56}, {-362, -56}}, color = {0, 0, 127}));
  connect(tank_B102_height.y, product5.u2) annotation(
    Line(points = {{-255, -50}, {-238, -50}}, color = {0, 0, 127}));
  connect(tank_B102_crossArea.y, product5.u1) annotation(
    Line(points = {{-255, -24}, {-246, -24}, {-246, -31}, {-238, -31}, {-238, -38}}, color = {0, 0, 127}));
  connect(condensedTank_refMaxV.u1, product5.y) annotation(
    Line(points = {{-208, -44}, {-215, -44}}, color = {0, 0, 127}));
  connect(tank_B102_level.y, condensedTank_V.u1) annotation(
    Line(points = {{-255, -12}, {-238, -12}}, color = {0, 0, 127}));
  connect(tank_B102_crossArea.y, condensedTank_V.u2) annotation(
    Line(points = {{-255, -24}, {-238, -24}}, color = {0, 0, 127}));
  connect(less_fillingValve.u1, evapTank_V.y) annotation(
    Line(points = {{-322, -26}, {-330.5, -26}, {-330.5, -6}, {-339, -6}}, color = {0, 0, 127}));
  connect(evapTank_V.u1, evapTank_level.y) annotation(
    Line(points = {{-362, 0}, {-371, 0}}, color = {0, 0, 127}));
  connect(tank_B101_crossArea.y, evapTank_V.u2) annotation(
    Line(points = {{-399, -12}, {-362, -12}}, color = {0, 0, 127}));
  connect(onDelay.y, triggeredTrapezoid.u) annotation(
    Line(points = {{-123, -38}, {-116, -38}}, color = {255, 0, 255}));
  connect(step_filling.outPort[1], transition_evapFull_and_condensedNotFull.inPort) annotation(
    Line(points = {{-337.5, 40}, {-321.5, 40}}));
  connect(transition_evapFull_and_condensedNotFull.outPort, step_evap.inPort[1]) annotation(
    Line(points = {{-316.5, 40}, {-298.5, 40}}));
  connect(initialStep.outPort[1], transition_inputReservoirIsNotEmpty.inPort) annotation(
    Line(points = {{-397.5, 40}, {-381.5, 40}}));
  connect(transition_inputReservoirIsNotEmpty.outPort, step_filling.inPort[1]) annotation(
    Line(points = {{-376.5, 40}, {-358.5, 40}}));
  connect(step_evap.outPort[1], transition_evapIsEmpty.inPort) annotation(
    Line(points = {{-277.5, 40}, {-261.5, 40}}));
  connect(tank_B101.BottomFluidPort[1], valve_V101.port_a) annotation(
    Line(points = {{0, -56}, {0, -64}}, color = {0, 127, 255}));
 connect(transition_evapIsEmpty.outPort, step_output.inPort[1]) annotation(
    Line(points = {{-256.5, 40}, {-239, 40}}));
 connect(step_output.outPort[1], transition_evapLevelIsZero.inPort) annotation(
    Line(points = {{-217.5, 40}, {-201.5, 40}}));
  connect(transition_evapLevelIsZero.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{-196.5, 40}, {-168.5, 40}, {-168.5, 64}, {-430.5, 64}, {-430.5, 40}, {-418.5, 40}}));
  connect(input_reservoir.ports[1], pipe_inputToEvap.port_a) annotation(
    Line(points = {{70, 70}, {70, 60}}, color = {0, 127, 255}));
 connect(pipe_inputToEvap.port_b, pump.port_a) annotation(
    Line(points = {{70, 40}, {70, 30}, {60, 30}}, color = {0, 127, 255}));
 connect(valve_V101.port_b, dynamicPipe.port_a) annotation(
    Line(points = {{0, -84}, {0, -96}}, color = {0, 127, 255}));
 connect(dynamicPipe.port_b, output_reservoir.topPorts[1]) annotation(
    Line(points = {{0, -116}, {0, -129}}, color = {0, 127, 255}));
  connect(input_reservoir.ports[2], port_in) annotation(
    Line(points = {{70, 70}, {190, 70}}, color = {0, 127, 255}));
 connect(output_reservoir.ports[1], V102.port_a) annotation(
    Line(points = {{0, -171}, {120, -171}}, color = {0, 127, 255}));
 connect(tank_B102.ports[1], V101.port_a) annotation(
    Line(points = {{62, -72}, {120, -72}}, color = {0, 127, 255}));
  connect(V101.port_b, port_out1) annotation(
    Line(points = {{140, -72}, {190, -72}}, color = {0, 127, 255}));
 connect(realExpression.y, V101.opening) annotation(
    Line(points = {{121, -120}, {130, -120}, {130, -80}}, color = {0, 0, 127}));
 connect(realExpression.y, V102.opening) annotation(
    Line(points = {{121, -120}, {130, -120}, {130, -162}}, color = {0, 0, 127}));
 connect(V102.port_b, port_out2) annotation(
    Line(points = {{140, -170}, {190, -170}}, color = {0, 127, 255}));
 connect(realExpression_clogging.y, valve_clogging.opening) annotation(
    Line(points = {{20, 39}, {20, 38}}, color = {0, 0, 127}));
 connect(pump.port_b, valve_clogging.port_a) annotation(
    Line(points = {{40, 30}, {30, 30}}, color = {0, 127, 255}));
 connect(valve_clogging.port_b, valveDiscrete.port_a) annotation(
    Line(points = {{10, 30}, {0, 30}, {0, 12}}, color = {0, 127, 255}));
 connect(realExpression_leaking.y, valve_leaking.opening) annotation(
    Line(points = {{-49, -140}, {-48, -140}}, color = {0, 0, 127}));
 connect(valve_leaking.port_b, sink.ports[1]) annotation(
    Line(points = {{-40, -150}, {-40, -160}}, color = {0, 127, 255}));
 connect(valve_clogging.port_b, valve_leaking.port_a) annotation(
    Line(points = {{10, 30}, {-40, 30}, {-40, -130}}, color = {0, 127, 255}));
 annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-440, 120}, {220, -180}})),
    Icon(graphics = {Text(origin = {-1, 0}, extent = {{-59, 46}, {59, -46}}, textString = "distill")}),
    version = "");
end still_partial;