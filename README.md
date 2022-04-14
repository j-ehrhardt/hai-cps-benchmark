# AI Benchmark for Diagnosis, Reconfiguration, and Planning

This repository contains the simulation models for the AI Benchmark for Diagnosis, Reconfiguration and Planning (BeRfiPl). 

## Motivation 

To improve the autonomy of Cyber-Physical Production Systems (CPPS), a growing number of approaches in Artificial Intelligence (AI) is being developed.
However, implementations of such approaches are often validated on individual use-cases, offering little to no comparability. 
Though CPPS automation includes a variety of problem domains, existing benchmarks usually focus on single or partial problems. 
Additionally, they often neglect to test for AI-specific performance indicators, like asymptotic complexity scenarios or runtimes. 
Within this paper we identify minimum common set requirements for AI benchmarks in the domain of CPPS and introduce a comprehensive benchmark, offering applicability on diagnosis, reconfiguration, and planning approaches from AI. 
The benchmark consists of a grid of datasets derived from 16 simulations of modular CPPS from process engineering, featuring multiple functionalities, complexities, and individual and superposed faults.


## Requirements
A virtual environment with the requirements to run the python scripts can be generated from the `requirements.txt` file. 
Additionally, Modelica has to be installed.

`Modelica=3.2.3`

(`OMEdit`)

`Python~=3.8`

`pandas~=1.4.1`

`plotly~=5.6.0`


## Quickrun 

Run `./scripts/create_benchmark.py` in your terminal.
The datasets will be saved into the `./datasets` directory.

**or** 

Open single models and superModels in OMEdit and run the simulation manually.


# Models

The benchmark consists of four different component modules (mixer, filter, distill, bottling) with different functionalities (cf. Fig.1).
The modules can be interchangeably combined to simulate modular process plants with differing functionalities.

![modules](./images/berfiple_modules.drawio(1).png)

*Fig.1: Four modules with different functionalities: a) filter, b) mixer, c) distill, d) bottling*

For the benchmark, connection models of 16 different CPPS are predefined in `benchmark_config.json`, forming a comprehensive selection of datasets for validating AI algorithms on diagnosis, reconfiguration and planning (cf. Fig. 2).

![cpps](./images/cppsSetups.drawio.png)

*Fig.2: CPPS combinations for the benchmark*


## Information

This benchmark was developed at the chair if Informatics in Engineering at Helmut-Schmidt-University, Hamburg. 
For questions please contact: **jonas.ehrhardt(at)hsu-hh.de**.


## LICENSE
Licensed under the Apache License, Version 2.0 (the "License"); you may not use it except in compliance with the License. A copy of the License is included in the project, see the file LICENSE.**


<img src="./images/IMB.png" alt="logo" width="100"/>
<img src="./images/BeRfiPl.jpeg" alt="hello" width="100"/>
