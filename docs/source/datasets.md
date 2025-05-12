# Datasets

The HAI-CPS benchmark constist of a total of 10 Datasets showing increasing system complexity

<img src="../_static/imgs/cpps-setups.png" alt="HAI-CPS" width="100%" />


Each dataset is available in four recording modes: 
- **discrete**: Includes only binary/discrete control and sensor values.
- **continuous**: Includes only real-valued sensor data and process measurements.
- **hybrid**: A combination of discrete and continuous features.
- **including-states**: Hybrid data **plus** automaton states from each module (i.e., internal process states during execution).

Within each recording mode all anomalies in all modules and all their permutations are saved as a separate `.csv` file, along with a recording of without any anomaly, to foster unsupervised ML methods. 

The naming convention of the channels within the recordings follows the schema `<module><component><sensor>`. 

The recordings of HAI-CPS are structured as follows: 
```bash

HAI-CPS
├── ds1
|   ├── discrete
|   |   ├── ds1_normal.csv
|   |   ├── ds1_anom_clogging.csv
...
|   ├── continuous
|   |   ├── ds1_normal.csv
|   |   ├── ds1_anom_clogging.csv
...
|   ├── hybrid
|   |   ├── ds1_normal.csv
|   |   ├── ds1_anom_clogging.csv
...
|   ├── including-states
|   |   ├── ds1_normal.csv
|   |   ├── ds1_anom_clogging.csv
...
├── ds2
...

```


## Download

HAI-CPS is hosted on IEEE-Dataport. 
You can find and download all datasets, follwing this [link](data-port-link). 

<img src="https://ieee-dataport.org/themes/custom/dataport_bootstrap/logo.svg" alt="Dataport-logo" width="20%" />

