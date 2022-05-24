FROM ubuntu:20.04
RUN apt-get update

# update and add OpenModelica packages + Miniconda package
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y gnupg lsb-release wget
RUN for deb in deb deb-src; do echo "$deb http://build.openmodelica.org/apt `lsb_release -cs` stable"; done | tee /etc/apt/sources.list.d/openmodelica.list
RUN wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- | apt-key add -
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Install OpenModelicaCompiler and OpenModelicaLibrary
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y omc omlib-modelica-3.2.2

# Install Python, and Git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3.9 build-essential
RUN DEBIAN_FRONTEND=noninteractive
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git

# Install Miniconda
RUN chmod +x Miniconda3-latest-Linux-x86_64.sh
RUN ./Miniconda3-latest-Linux-x86_64.sh

# Create a user profile "openmodelicausers"
RUN useradd -m -s /bin/bash openmodelicausers

# Change the container to non-root "openmodelicauser" and set the env
USER openmodelicausers
ENV HOME /home/openmodelicausers
ENV USER openmodelicausers
WORKDIR $HOME

# Clone simulation models
RUN git clone https://github.com/j-ehrhardt/benchmark-for-diagnosis-reconf-planning.git
RUN cd benchmark-for-diagnosis-reconf-planning

# Create venv
RUN conda env create -f venv_benchmark.yml
RUN conda activate berfipl

# Run all simulations
RUN python3 scripts/create_benchmark.py

# adapted from https://github.com/kbalzereit/ai-benchmark.git