# Installation

When using HAI-CPS, you can either use the pre-compiled datasets or run the simulations locally.  
For running the simulations locally, you must install all necessary requirements.  
Alternatively, we provide a `Dockerfile` that allows you to run the simulations inside a Docker container — this is our **recommended** setup.

## Requirements

**For local installation**:

<div style="border-left: 4px solid #007acc; padding: 0.5em 1em; background: #f0f8ff;">
<strong>Note:</strong>  
Local usage has only been tested on Ubuntu 22.04 LTS and Ubuntu 24.04 LTS.  
While the models run without issues in the OpenModelica Shell and OpenModelica Editor, the Python API may encounter problems.
</div>

- You need an installation of **OpenModelica 1.25** and the **OpenModelica Standard Library 4.0.0** to run the benchmark.
- All additional Python requirements are listed in the `venv.yml` file available in the benchmark's [GitHub repository](https://github.com/j-ehrhardt/hai-cps-benchmark/blob/main/venv.yml).

**Using Docker**:

- To run the simulation inside a Docker container, you need a current version of **Docker** and **Docker Compose** installed.

## Installation

**For local installation**:

1. Install OpenModelica by following the instructions on the [OpenModelica website](https://openmodelica.org/download/download-linux/).
2. Install all additional requirements:
   - We recommend installing a recent version of **Miniforge**.
   - Navigate to the directory containing the `venv.yml` file.
   - Then, create the environment by running:
   ```bash
   mamba env create -f env.yml
   ```

**Using Docker:**

1. Navigate to the directory where the `Dockerfile` is located. 
2. Set up the container by running: 
    ```bash
    docker compose up -d
    ```


