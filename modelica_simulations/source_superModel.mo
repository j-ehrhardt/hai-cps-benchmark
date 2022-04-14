model source_superModel
//Real realExpression_valveLinear_simulator(start = 0);
//Real realExpression_pump_simulator(start = 1500);

equation

//realExpression_pump_simulator = 400; //1000 for mixer, >=1200 for filter, 500 standard
//realExpression_pump_simulator = if time >= 250 then 2500 else 1500;
//realExpression_valveLinear_simulator = 1;
//realExpression_valveLinear_simulator = if time >= 25 then if sin(0.1 * time) >= 0 then 1 else 0 else 0;

end source_superModel;
