# Benchmark for Reconfiguration and Planning 


## Requirements

``== Modelica 3.2.3``

``>= Python 3.9``

``~ pandas 1.4.1``



## Quickrun 

Run ``/scripts/create_benchmark.py`` in your terminal.
The datasets will be saved into the ``/datasets`` directory.

**or**

Open and run models in OM Edit individually


## Models

Modelica Models are saved in `/modelica simulations`. 
Each Module (source, sink, filter, mixer, distill, bottling) is defined in a model.mo and a superModel.mo file.

To run the modules individually in OM Edit, the models have to be connected to a source and a sink in a separate (process_plant.mo) file. 
Pump velocity has to be adapted regarding the comments in the `source_superModel.mo`.
Errors (leaking, clogging or both) can be injected in the module's supermodel. 
