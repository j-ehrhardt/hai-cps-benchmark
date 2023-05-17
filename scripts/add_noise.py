# as the simulation has no variance this script helps to introduce gaussian noise on the datasets.

import os
import pandas as pd
import numpy as np
np.random.seed(42)


def add_noise(df):
    mu, sigma = 0, 0.05 # 5% gaussian noise on df
    noise = np.random.normal(mu, sigma, df.shape)
    df = df + noise
    return df

def iterate_dirs(dir_path):
    # Iterate over all entries in the given directory
    for entry in os.scandir(dir_path):
        if entry.is_file():
            # open file
            if ".csv" in entry.name:
                with open(entry.path) as handle:
                    df = pd.read_csv(handle, index_col=0)
                df = add_noise(df)
                df.to_csv(entry.path)
                print(f"Changed {entry.path}")
        elif entry.is_dir():
            # Recursion if only subdir
            iterate_dirs(entry.path)

if __name__ == "__main__":
    dir_path = "../datasets"
    iterate_dirs(dir_path)