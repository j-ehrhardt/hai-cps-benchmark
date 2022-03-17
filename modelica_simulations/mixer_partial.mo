model mixer_partial
  extends mixer_superModel;
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial)  
      annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Sources.FixedBoundary sink(
      redeclare package Medium = Medium, 
      nPorts = 1, 
      p = system.p_ambient) 
      annotation(
      Placement(visible = true, transformation(origin = {12, -106}, extent = {{10, 10}, {-10, -10}}, rotation = -90))); 


  Modelica.Fluid.Vessels.OpenTank tank_B201(
      redeclare package Medium = Medium, 
      crossArea= 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
      height= 0.35, level(fixed = true, start = 0.3), 
      level_start = 0.3, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
      nPorts = 2,       
      portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})  
      annotation(
    Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  

  Modelica.Fluid.Vessels.OpenTank tank_B202(
      redeclare package Medium = Medium, 
      crossArea = 0.1, 
      height = 0.35, level(fixed = true, start = 0.3), 
      level_start = 0.3, 
      nPorts = 2, 
      portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})  
      annotation(
    Placement(visible = true, transformation(origin = {-34, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  

  Modelica.Fluid.Vessels.OpenTank tank_B203(
      redeclare package Medium = Medium, 
      crossArea = 0.1, 
      height = 0.35, level(fixed = true, start = 0.3), level_start = 0.3, 
      nPorts = 2, 
      portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})  
      annotation(
      Placement(visible = true, transformation(origin = {12, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));  


  Modelica.Fluid.Vessels.OpenTank tank_B204(
      redeclare package Medium = Medium, 
      crossArea = 0.33, 
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
      height = 0.45, level(fixed = true, start = 0), 
      level_start = 0, 
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, 
      nPorts = 2, 
      portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})  
      annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  

  Modelica.Fluid.Pipes.StaticPipe pipe(
      redeclare package Medium = Medium, allowFlowReversal = true, diameter= 0.015, height_ab=0, 
      length= 0.13) 
      annotation(
      Placement(visible = true, transformation(origin = {-80, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  

  Modelica.Fluid.Pipes.StaticPipe pipe1(
      redeclare package Medium = Medium, allowFlowReversal = true, 
      diameter = 0.015, height_ab = 0, length = 0.13) 
      annotation(
    Placement(visible = true, transformation(origin = {-34, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));


  Modelica.Fluid.Pipes.StaticPipe pipe2(
      redeclare package Medium = Medium, allowFlowReversal = true, 
      diameter = 0.015, height_ab = 0, length = 0.13) 
      annotation(
    Placement(visible = true, transformation(origin = {12, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));


  Modelica.Fluid.Pipes.StaticPipe pipe3(
      redeclare package Medium = Medium, allowFlowReversal = true, 
      diameter = 0.015, height_ab = 0, length = 0.4) 
      annotation(
    Placement(visible = true, transformation(origin = {-6, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));


  Modelica.Fluid.Pipes.StaticPipe pipe4(
      redeclare package Medium = Medium, allowFlowReversal = true, 
      diameter = 0.015, height_ab = 0, length = 0.6) 
      annotation(
    Placement(visible = true, transformation(origin = {80, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 270)));



  Modelica.Fluid.Machines.PrescribedPump pump_P201(
      redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}),
      redeclare package Medium = Medium,
      N_nominal = 150, 
      T_start = system.T_start, 
      V = 0.001, 
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
    Placement(visible = true, transformation(origin = {60, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 

  Modelica.Fluid.Valves.ValveLinear valve_V201(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40)  
    annotation(
  Placement(visible = true, transformation(origin = {-80, -16}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
 

  Modelica.Fluid.Valves.ValveLinear valve_clogging(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40)  
    annotation(
  Placement(visible = true, transformation(origin = {30, -54}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
 
 
  Modelica.Fluid.Valves.ValveLinear valve_leaking(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40)  
    annotation(
  Placement(visible = true, transformation(origin = {12, -76}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  
  

  Modelica.Fluid.Valves.ValveLinear valve_V202(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40)  
    annotation(
  Placement(visible = true, transformation(origin = {-34, -16}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  

  Modelica.Fluid.Valves.ValveLinear valve_V203(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit = "Pa") = 1000, dp_start = 0.0, 
    m_flow_nominal = 40)  
    annotation(
  Placement(visible = true, transformation(origin = {12, -16}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));


  Modelica.Blocks.Sources.RealExpression realExpression_pump_P201(
    y = pump_P201_simulator)
    annotation(
      Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Blocks.Sources.RealExpression realExpression_valve_clogging(
    y = valve_clogging_simulator)
    annotation(
      Placement(visible = true, transformation(origin = {60, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

  Modelica.Blocks.Sources.RealExpression realExpression_valve_leaking(
    y = valve_leaking_simulator)
    annotation(
      Placement(visible = true, transformation(origin = {-8, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_b port_in1(
    replaceable package Medium=Medium)
    annotation(
    Placement(visible = true, transformation(origin = {-80, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_b port_in2(
    replaceable package Medium=Medium)
    annotation(
    Placement(visible = true, transformation(origin = {-34, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_b port_in3(
    replaceable package Medium=Medium)
    annotation(
    Placement(visible = true, transformation(origin = {14, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Interfaces.FluidPort_a port_out(
    replaceable package Medium=Medium)
    annotation(
    Placement(visible = true, transformation(origin = {110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Valves.ValveLinear valveLinear(
    replaceable package Medium=Medium,
    dp_nominal(
    displayUnit = "Pa")
    = 1000,
    dp_start = 0.0,
    m_flow_nominal = 40)
    annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.InitialStep initialStep annotation(
    Placement(visible = true, transformation(origin = {260, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Transition transition annotation(
    Placement(visible = true, transformation(origin = {310, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Step step_filling annotation(
    Placement(visible = true, transformation(origin = {360, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.TransitionWithSignal transitionWithSignal_fillingComplete(
    enableTimer = true,
    waitTime = 1)
     annotation(
    Placement(visible = true, transformation(origin = {410, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.StateGraph.Step step_emptying annotation(
    Placement(visible = true, transformation(origin = {460, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal_isEmpty(enableTimer = true, waitTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {510, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  //valveLinear.opening = if (time > 400 and tank_B204.level > tank_B204.height*minVolPercentage) then 1 else 0;
  valveLinear.opening = if step_emptying.active then 1 else 0;
  valve_V201.opening = if step_filling.active then valve_V201_simulator else 0;
  valve_V202.opening = if step_filling.active then valve_V202_simulator else 0;
  valve_V203.opening = if step_filling.active then valve_V203_simulator else 0;
  transitionWithSignal_fillingComplete.condition = tank_B204.level > tank_B204.height*maxVolPercentage;
  transitionWithSignal_isEmpty.condition = tank_B204.level < tank_B204.height*minVolPercentage;
 connect(pipe.port_b, valve_V201.port_a) annotation(
    Line(points = {{-80, -2}, {-80, -6}}, color = {0, 127, 255}));
 connect(valve_V201.port_b, pipe3.port_a) annotation(
    Line(points = {{-80, -26}, {-80, -54}, {-16, -54}}, color = {0, 127, 255}));
  connect(tank_B202.ports[1], pipe1.port_a) annotation(
    Line(points = {{-34, 50}, {-34, 30}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valve_V202.port_a) annotation(
    Line(points = {{-34, 10}, {-34, -6}}, color = {0, 127, 255}));
 connect(valve_V202.port_b, pipe3.port_a) annotation(
    Line(points = {{-34, -26}, {-34, -54}, {-16, -54}}, color = {0, 127, 255}));
  connect(tank_B203.ports[1], pipe2.port_a) annotation(
    Line(points = {{12, 50}, {12, 30}}, color = {0, 127, 255}));
  connect(pipe2.port_b, valve_V203.port_a) annotation(
    Line(points = {{12, 10}, {12, -6}}, color = {0, 127, 255}));
 connect(valve_V203.port_b, pipe3.port_a) annotation(
    Line(points = {{12, -26}, {12, -40}, {-16, -40}, {-16, -54}}, color = {0, 127, 255}));
  connect(realExpression_pump_P201.y, pump_P201.N_in) annotation(
    Line(points = {{60, -31}, {60, -44}}, color = {0, 0, 127}));
  connect(pump_P201.port_b, pipe4.port_a) annotation(
    Line(points = {{70, -54}, {80, -54}, {80, -30}}, color = {0, 127, 255}));
  connect(pipe4.port_b, tank_B204.ports[1]) annotation(
    Line(points = {{80, -10}, {80, 20}}, color = {0, 127, 255}));
 connect(tank_B201.ports[1], port_in1) annotation(
    Line(points = {{-80, 50}, {-80, 120}}, color = {0, 127, 255}));
  connect(tank_B202.ports[2], port_in2) annotation(
    Line(points = {{-34, 50}, {-34, 120}}, color = {0, 127, 255}));
  connect(tank_B203.ports[2], port_in3) annotation(
    Line(points = {{12, 50}, {14, 50}, {14, 120}}, color = {0, 127, 255}));
 connect(tank_B204.ports[2], valveLinear.port_a) annotation(
    Line(points = {{80, 20}, {110, 20}, {110, 0}}, color = {0, 127, 255}));
 connect(valveLinear.port_b, port_out) annotation(
    Line(points = {{110, -20}, {110, -90}}, color = {0, 127, 255}));
 connect(initialStep.outPort[1], transition.inPort) annotation(
    Line(points = {{270.5, 54}, {306.5, 54}}));
 connect(transition.outPort, step_filling.inPort[1]) annotation(
    Line(points = {{311.5, 54}, {349.5, 54}}));
 connect(step_filling.outPort[1], transitionWithSignal_fillingComplete.inPort) annotation(
    Line(points = {{370.5, 54}, {406.5, 54}}));
 connect(transitionWithSignal_fillingComplete.outPort, step_emptying.inPort[1]) annotation(
    Line(points = {{411.5, 54}, {449.5, 54}}));
 connect(step_emptying.outPort[1], transitionWithSignal_isEmpty.inPort) annotation(
    Line(points = {{470.5, 54}, {506.5, 54}}));
 connect(transitionWithSignal_isEmpty.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{511.5, 54}, {559.5, 54}, {559.5, -6}, {239.5, -6}, {239.5, 54}, {249.5, 54}}));
 connect(realExpression_valve_clogging.y, valve_clogging.opening) annotation(
    Line(points = {{49, -76}, {29.5, -76}, {29.5, -62}, {30, -62}}, color = {0, 0, 127}));
 connect(realExpression_valve_leaking.y, valve_leaking.opening) annotation(
    Line(points = {{3, -76}, {4, -76}}, color = {0, 0, 127}));
 connect(valve_leaking.port_b, sink.ports[1]) annotation(
    Line(points = {{12, -86}, {12, -96}}, color = {0, 127, 255}));
 connect(pipe3.port_b, valve_clogging.port_a) annotation(
    Line(points = {{4, -54}, {20, -54}}, color = {0, 127, 255}));
 connect(valve_clogging.port_b, pump_P201.port_a) annotation(
    Line(points = {{40, -54}, {50, -54}}, color = {0, 127, 255}));
 connect(pipe3.port_b, valve_leaking.port_a) annotation(
    Line(points = {{4, -54}, {12, -54}, {12, -66}}, color = {0, 127, 255}));
 connect(tank_B201.ports[2], pipe.port_a) annotation(
    Line(points = {{-80, 50}, {-80, 18}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Documentation,
 Diagram(coordinateSystem(extent = {{-120, 140}, {560, -120}})),
 version = "");
end mixer_partial;