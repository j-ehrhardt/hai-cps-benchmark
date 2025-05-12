# Using the Simulation

You can use the code and models from this repository in two ways. 
Either, you simulate your own scenarios or you recreate the benchmark.

<div style="border-left: 4px solid #007acc; padding: 0.5em 1em; background: #f0f8ff;">
<strong>Note:</strong>  
If you want to use the models in Simulink, you can export to FMU models from the OMEdit and import them into Simulink.

</div>
</br>


## Replicate the Benchmark Datasets

If you simply want to replicate all datasets from the benchmark run the `sim.py` file with the virtual environemtn activated (either from the docker container or your terminal)
The script will automatically select the `benchmark_setup.json` file and run all simulations.

<div style="border-left: 4px solid #ffa500; padding: 0.5em 1em; background-color: #fff8e1;">

<strong>⚠️ Warning:</strong>  
Attention! The simulations takes time, so be prepared to let your computer run for a while. 

</div>
</br>

## Create Your Own Simulation

If you want to create your own CPS configurations and simulations, you can either use the OpenModelica Editor (OMEdit) or you use the python interface provided in this repository.

When using the OMEdit, simply load the models from the `models` directory and assemble them into new configurations within the `ProcessPlant.mo` file.

When using the Python interface, create your unique setup as a `config.json` and run the `sim.py` file within the virtual environment. (This is especially suited for the docker usage). 
You can orient yourself on the setup file for the benchmark `benchmark_setup.json` in the `code` directory. 
Make sure to insert your `config.json` in the `sim.py` file. 
