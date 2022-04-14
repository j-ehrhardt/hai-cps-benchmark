model process_plant
inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa"));
replaceable package Medium = Modelica.Media.Water.StandardWater;

source source0;
bottling_partial bottling_partial0;
sink sink0;

equation
connect(source0.port_out, bottling_partial0.port_in);
connect(bottling_partial0.port_out, sink0.port_in);
end process_plant;
