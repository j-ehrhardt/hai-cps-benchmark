Welcome to the Documentation of HAI-CPS
=======================================

The **Hamburg AI Benchmark for Cyber-Physical Systems (HAI-CPS)** is a comprehensive dataset designed for evaluating AI models in the domains of **anomaly detection, diagnosis, and reconfiguration** for Cyber-Physical Systems (CPS).

HAI-CPS is structured as a benchmark comprising ten different scenarios of a modular process plant, each demonstrating various functionalities and increasing complexities.  
This enables you to comprehensively test your algorithms not only on a single use-case but systematically across increasingly complex examples within the same domain.  
Each scenario can feature multiple anomalies occurring within a single module or across multiple modules of the CPS.

.. image:: /_static/imgs/banner.png
   :alt: banner
   :class: align-center
   :width: 100%

HAI-CPS includes:

- OpenModelica simulation models
- Pre-simulated datasets for benchmarking
- Docker integration for easy execution

In addition to the provided setups, you can also create and simulate your own system constellations using the OpenModelica models and the HAI-CPS Python API.

.. note::

   **HAI-CPS** extends the **Benchmark for Diagnosis, Reconfiguration, and Planning (BeRfiPl)**.  
   You can access the previous version here:  
   `BeRfiPl Benchmark <https://github.com/j-ehrhardt/benchmark-for-diagnosis-reconf-planning/tree/benchmark_v1>`_

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   installation
   overview/index
   simulation/index
   datasets


When using HAI-CPS, please cite

.. code-block::

    @misc{Ehrhardt2025,
    author = {Ehrhardt, Jonas and Moddemann, Lukas and Niggemann, Oliver},
    year = {2025},
    title = {The Hamburg Artificial Intelligence Benchmark for Cyber-Pyhsical Sytems - HAI-CPS},
    howpublished = {\url=https://github.com/j-ehrhardt/hai-cps-benchmark},
    doi = {},
    }


HAI-CPS was developed at the Chair of Informatics in Mechanical Engineering at Helmut-Schmidt-Universtiy.

|hsu|  |imb|  |aut| 

.. |hsu| image:: https://www.hsu-hh.de/wp-content/themes/hsu/img/helmut-schmidt-universitaet-logo.svg
   :width: 12%

.. |imb| image:: ../_static/imgs/IMB.png
   :width: 10%
   
.. |aut| image:: ../_static/imgs/aut.png
   :width: 10%
   
   
