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

equation
  // CPPS parameters
  valve_V402_simulator = 0;
  valve_V405_simulator = 0;
  pump_P401_simulator = 200;
  
  // bottling process controll
  bottle_volume = 0.01;
  reload_time = 10;
  minVolPercentage = 0.2;
  maxVolPercentage = 0.8;
    
  // error induction:
  valve_leaking_simulator = if time >= 2000 then 0.001 else 0; // leaking
  valve_clogging_simulator = if time >= 2000 then 0.8 else 1; // clogging

  
end bottling_superModel;
