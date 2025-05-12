# Benchmark

The goal of **HAI-CPS** is to provide a comprehensive benchmark that enables you to evaluate your machine learning algorithms along two axes:

- **CPS complexity**  
- **Anomaly complexity**

HAI-CPS includes **ten different datasets**, each recorded from a unique process plant setup.  
The datasets are available in **discrete**, **continuous**, and **hybrid** formats to suit a wide range of algorithmic needs.

You can find a full overview of all datasets [here](../datasets.md).

---

## CPS Complexity

HAI-CPS features ten different process plant configurations, each exhibiting increasing structural and behavioral complexity.

<img src="../_static/imgs/cpps-setups.png" alt="HAI-CPS setups" width="100%" />

---

## Anomaly Complexity

For each individual anomaly — and all meaningful combinations of anomalies — a dedicated dataset has been recorded.  
This allows for a systematic evaluation of your model's performance under varying anomaly scenarios and interactions.

---

## Data Formats

HAI-CPS datasets are provided in four formats, depending on what your model requires:

- **discrete**: Includes only binary/discrete control and sensor values.
- **continuous**: Includes only real-valued sensor data and process measurements.
- **hybrid**: A combination of discrete and continuous features.
- **including-states**: Hybrid data **plus** automaton states from each module (i.e., internal process states during execution).

---
