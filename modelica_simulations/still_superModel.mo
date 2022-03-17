model still_superModel
  Real pump_N(start=0);
  Real evapTank_refMaxV_Val(start=0);
  Real evapTank_refMinV_Val(start=0);
  Real condensedTank_refMaxV_Val(start=0);
  Real valve_leaking_simulator(start=0);
  Real valve_clogging_simulator(start=0);
  Real outlet(start=0);
equation
  // CPPS component controll 
  outlet = if time <= 3000 then 0 else 1;

  // CPPS parameters 
  pump_N = 200;
  evapTank_refMaxV_Val = 0.8;
  evapTank_refMinV_Val = 0.2;
  condensedTank_refMaxV_Val = 0.8;
  
  // fault induction
  valve_leaking_simulator = if time >= 2000 then 0.001 else 0; // leaking
  valve_clogging_simulator = if time >= 2000 then 0.8 else 1; // clogging
end still_superModel;
