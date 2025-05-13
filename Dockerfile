FROM ubuntu:22.04
# Set environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive
CMD ["/bin/bash"]
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y gnupg lsb-release wget curl git
RUN echo "deb http://build.openmodelica.org/apt `lsb_release -cs` stable" | tee /etc/apt/sources.list.d/openmodelica.list
RUN wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- | apt-key add -
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y omc omlibrary
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3 build-essential git vim
RUN curl -o /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    &&     bash /tmp/miniconda.sh -b -p /opt/conda \
    &&     rm /tmp/miniconda.sh
ENV PATH="/opt/conda/bin:/opt/openmodelica/bin:$PATH"
WORKDIR /root
# RUN --mount=type=cache,target=/root/.cache/git \
#     git clone --depth 1 https://imb-git.hsu-hh.de/ehrhardj/benchmark-for-reconfiguration-planning.git \
#     &&     cd benchmark-for-reconfiguration-planning \
#     &&     conda env create -f venv.yml

RUN --mount=type=cache,target=/root/.cache/git \
    git clone --depth 1 --branch main_v2_resized_tanks https://imb-git.hsu-hh.de/ehrhardj/benchmark-for-reconfiguration-planning.git \
    && cd benchmark-for-reconfiguration-planning \
    && conda env create -f venv.yml

# RUN git clone https://imb-git.hsu-hh.de/ehrhardj/benchmark-for-reconfiguration-planning.git \
#     &&     cd benchmark-for-reconfiguration-planning \
#     &&     conda env create -f venv.yml
ENV PATH /opt/conda/envs/myenv/bin:$PATH
RUN /opt/conda/bin/conda run -n hai-cps
WORKDIR /root/benchmark-for-reconfiguration-planning/code