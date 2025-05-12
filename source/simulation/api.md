# API 

We created a very basic Python API that allows you to run simulations which you pre-configured in a `conf.json` file. 
The API communicates with the OpenModelica console, loads the simulation models, builds the process plant setup which you defined, and runs the simulation with or without anomalies. 
The simulation data then is cleaned and saved as a `.csv` file. 

## Configuration File

The configuration file describes the process plant configuration you want to run. (The `benchmark_setup.json` holds all simulation setups for the HAI-CPS benchmark).
It is formatted as json file and has the following attributes: 

- `ID`: The `ID` is a unique identifier, when processing multiple configurations in one confiugration file. 
    - `ds_name`: The dataset name is an identifier (optimally unique) that allows you to differentiate your dataset from other datasets.
    - `model`: The `model` key defines the setup of the process plant configuration you want to simulate: 
        - `modules`: The `modules` key holds a dictionary of all employed CPS modules. **Make sure to give them unique names (e.g. mixer0, mixer1, mixer2, etc.) otherwise the simulation will break.
            - `files`: The `files` key holds the path to the simulation model file. This allows you to embed your own simulatoin model.
            - `faults`: The `faults` key holds a dictionariy of all faults, in which the fault name (e.g. `anom_clogging`) is paired with a Boolean value. During the initialization of the simulation these faults are induced in the simulation models by the API to appear after 2500 timesteps. 
        - `edges`: The `edges` key holds a dictionary that describes all connections between the modules that are introduced in the `modules` key. The connections are noted as lists with two entries that connect the input ports to the modules with the output ports of another module. 
    - `sim_setup`: The `sim_setup` key holds a dictionary that describes the general simulation setup: 
        - `startTime`: Denotes an integer value of the simulation's start time. 
        - `stopTime`: Denotes an integer value of teh simulations's stop time. 
        - `numberOfIntervals`: Denotes the number of timesteps the simulation is discretized. 

Here is an example of a config file for `ds1` of the HAI-CPS benchmark:

```json

{
  "ds1": {
    "ds_name": "ds1",
    "model": {
      "modules": {
        "mixer0": {
          "files": "../models/Mixer.mo",
          "faults": {
            "anom_clogging": false,
            "anom_valve_in0": false,
            "anom_valve_in1": false,
            "anom_valve_in2": false,
            "anom_pump75": false,
            "anom_pump50": false
          }
        },
        "source0": {
          "files": "../models/Source.mo",
          "faults": {}
        },
        "source1": {
          "files": "../models/Source.mo",
          "faults": {}
        },
        "source2": {
          "files": "../models/Source.mo",
          "faults": {}
        },
        "sink0": {
          "files": "../models/Sink.mo",
          "faults": {}
        }
      },
      "edges": {
        "0": ["source0.port_out0", "mixer0.port_in0"],
        "1": ["source1.port_out0", "mixer0.port_in1"],
        "2": ["source2.port_out0", "mixer0.port_in2"],
        "3": ["mixer0.port_out0", "sink0.port_in0"]
      }
    },
    "sim_setup": {
      "startTime": 0,
      "stopTime": 10000,
      "numberOfIntervals": 10000
    }
  }
}
  

```



## Python API


The main functionalities of the Python API include:

- Creating simulation models dynamically from a modular description.
- Injecting fault scenarios into specific modules.
- Running OpenModelica simulations via `.mos` scripts.
- Cleaning and exporting results in different modes.
- Supporting both "normal" and "anomalous" dataset generation.

---

## Functions Overview

### `create_sim_setup(mos_path, dict_setup)`
Creates the `call.mos` file used by OpenModelica for simulation. It customizes the simulation parameters such as start time, stop time, and number of intervals.

**Parameters:**
- `mos_path` (str): Path to write the `.mos` file.
- `dict_setup` (dict): Dictionary containing simulation configuration.

---

### `create_plant_sim_model(model_dir, sim_setup)`
Generates the `Plant.mo` model file according to the structure defined in the `sim_setup` dictionary.

**Parameters:**
- `model_dir` (str): Directory where the model file should be saved.
- `sim_setup` (dict): Contains information about modules and edges.

---

### `write_anomaly_in_module(module, module_dict, reset=False)`
Injects or resets faults (anomalies) in a specific Modelica module file based on provided fault flags.

**Parameters:**
- `module` (str): Name of the module.
- `module_dict` (dict): Dictionary of all module configurations.
- `reset` (bool): If `True`, all faults are reset to false.

<div style="border-left: 4px solid #ffa500; padding: 0.5em 1em; background-color: #fff8e1;">
<strong>💡 Note:</strong>  
Used internally during simulation setup and reset.
</div>
</br>

---

### `induce_anomalies_in_plant(sim_setup, reset=False)`
Writes all anomaly flags into their respective model files based on the configuration.

**Parameters:**
- `sim_setup` (dict): Full simulation setup.
- `reset` (bool): If `True`, all anomalies are reset after simulation.

---

### `data_cleaning(data_dir, sim_setup, modus)`
Cleans the simulation output data by selecting only relevant columns based on the selected modus (e.g., `continuous`, `discrete`, `hybrid`).

**Parameters:**
- `data_dir` (str): Directory containing the simulation output.
- `sim_setup` (dict): Simulation setup.
- `modus` (str): Type of data to extract: `continuous`, `discrete`, `hybrid`, or any with `_s` suffix to include states.

<div style="border-left: 4px solid #ffa500; padding: 0.5em 1em; background-color: #fff8e1;">
<strong>💡 Note:</strong>  
Intermediate CSV is removed after filtering.
</div>
</br>

---

### `run_sim(sim_setup, mos_path='./call.mos', model_dir='../models', data_dir='../data', modus='hybrid', states=True)`
Orchestrates the full simulation process including model creation, fault injection, simulation execution, and cleanup.

**Parameters:**
- `sim_setup` (dict): Simulation configuration.
- `mos_path` (str): Path to the `.mos` file.
- `model_dir` (str): Directory for storing the model.
- `data_dir` (str): Directory for storing results.
- `modus` (str): Simulation data type.
- `states` (bool): Whether to include system states.

<div style="border-left: 4px solid #ffa500; padding: 0.5em 1em; background-color: #fff8e1;">
<strong>⚠️ Warning:</strong>  
Overwrites existing `.csv` data if filenames match.
</div>
</br>

---

### `process_faults_all_combinations(data, file_path)`
Generates all combinations of datasets where exactly one fault is active and all others are inactive. Saves them to a JSON file.

**Parameters:**
- `data` (dict): The original dataset setup.
- `file_path` (str): Path to write the new benchmark configuration.

<div style="border-left: 4px solid #ffa500; padding: 0.5em 1em; background-color: #fff8e1;">
<strong>💡 Note:</strong>  
Used to create benchmark configurations for fault detection algorithms.
</div>
</br>

---

## Main Execution

```python
if __name__ == '__main__':
    behavior = 'anomalous'  # can be 'anomalous' or 'normal'

    if behavior == 'normal':
        with open('benchmark_setup.json') as f:
            setup = json.load(f)
        for i in setup:
            run_sim(sim_setup=setup[i], modus='continuous', states=True)

    elif behavior == 'anomalous':
        with open('benchmark_setup.json') as f:
            setup = json.load(f)
        process_faults_all_combinations(setup, 'benchmark_setup_anom.json')

        with open('benchmark_setup_anom.json') as f_anom:
            setup_anom = json.load(f_anom)
        for i in setup_anom:
            run_sim(sim_setup=setup_anom[i], modus='discrete', states=True)

    else:
        raise ValueError(f"Unknown behavior: {behavior}. Must be 'normal' or 'anomalous'.")
```

---

## Directory Structure Assumptions
- `vanilla_call.mos`: Template for simulation execution.
- `../models`: Folder for `Plant.mo` and related model files.
- `../data`: Simulation output folder.

<div style="border-left: 4px solid #ffa500; padding: 0.5em 1em; background-color: #fff8e1;">
<strong>💡 Note:</strong>  
Assumes OpenModelica is available as `omc` on the system path.
</div>
</br>



