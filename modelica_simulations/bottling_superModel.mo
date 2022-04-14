model bottling_superModel

  Real valve_V402_simulator(start = 0);
  Real valve_V405_simulator(start = 0);
  Real valve_clogging_simulator(start = 1);
  Real valve_leaking_simulator(start = 0);
  Real pump_P401_simulator(start = 100);
  
  Real bottle_volume; //in m^3
  Real reload_time; //in s
  Real minVolPercentage;
  Real maxVolPercentage;
  Real volumeFlow_factor;

equation
  // CPPS parameters
  valve_V402_simulator = 0;
  valve_V405_simulator = 0;
  pump_P401_simulator = 150;
  
  // bottling process controll
  bottle_volume = 0.01;
  reload_time = 10;
  minVolPercentage = 0.2;
  maxVolPercentage = 0.8;
  volumeFlow_factor = 0.3; // indicates the time the valve is openened (the smaller, the longer the bottling valve will be opened)
    
  // error induction:
  valve_leaking_simulator = if time >= 2000 then 0.0001 else 0; // leaking
  valve_clogging_simulator = if time >= 2000 then 0.01 else 1; // clogging

  
end bottling_superModel;
