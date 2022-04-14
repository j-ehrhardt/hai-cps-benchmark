model mixer_superModel
  Real valve_V201_simulator(start=1);
  Real valve_V202_simulator(start=1);
  Real valve_V203_simulator(start=1);
  Real valve_V204_simulator(start=0);
  Real valve_V205_simulator(start=0);
  Real valve_V206_simulator(start=0);
  Real valve_V207_simulator(start=0);
  Real valve_V209_simulator(start=0);
  Real valve_V210_simulator(start=0);
  Real valve_V211_simulator(start=0);
  Real valve_clogging_simulator(start=1);
  Real valve_leaking_simulator(start=0);
  Real pump_P201_simulator(start=150);
  Real pump_P202_simulator(start=0);
  
  Real minVolPercentage;
  Real minVolPercentageMixer;
  Real maxVolPercentage;

equation
  // mixer process controll
  minVolPercentage = 0.01;
  minVolPercentageMixer = 0.2;
  maxVolPercentage = 0.85; // should be <= 0.85
  
  // Insert Recipe here:
  valve_V201_simulator = 1;
  valve_V202_simulator = 1;
  valve_V203_simulator = 1;
  pump_P201_simulator = 150;
  
  /*
  // Recipe 0:
  valve_V201_simulator = if time >= 100 then 0 else 1;
  valve_V202_simulator = if time >= 100 then 0 else 1;
  valve_V203_simulator = if time >= 100 then 0 else 1;
  pump_P201_simulator = 150;
  */
  
  /*  
  // Recipe 1:
  valve_V201_simulator = if time >= 100 then 0 else 0.8;
  valve_V202_simulator = if time >= 100 then 0 else 0.1;
  valve_V203_simulator = if time >= 100 then 0 else 0.1;
  pump_P201_simulator = 1500;
  
  // Recipe 2:
  valve_V201_simulator = if time >= 100 then 0 else 0.75;
  valve_V202_simulator = if time >= 100 then 0 else 0.1;
  valve_V203_simulator = if time >= 100 then 0 else 0.15;
  pump_P201_simulator = 1500;
  
  // Recipe 3:
  valve_V201_simulator = if time >= 100 then 0 else 0.75;
  valve_V202_simulator = if time >= 100 then 0 else 0.15;
  valve_V203_simulator = if time >= 100 then 0 else 0.1;
  pump_P201_simulator = 1500;
   */

  // CPPS parameters
  valve_V204_simulator = 0;
  valve_V205_simulator = 0;
  valve_V206_simulator = 0;
  valve_V207_simulator = 0;
  valve_V209_simulator = 0;
  valve_V210_simulator = 0;
  valve_V211_simulator = 0;
  pump_P202_simulator = 0;
  
  // error induction
  valve_leaking_simulator = if time >= 2000 then 0.0001 else 0; // leaking
  valve_clogging_simulator = if time >= 2000 then 0.8 else 1; // clogging
end mixer_superModel;
