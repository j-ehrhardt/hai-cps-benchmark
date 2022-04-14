import pandas as pd
import plotly.express as px


def plot_fig(df):
    # plotting some dfs in plotly 
    fig = px.scatter(df, title="reconf benchmark datasets")
    fig.show()
    return

df1 = pd.read_csv("../datasets/ds1/ds1c.csv")
df2 = pd.read_csv("../datasets/ds1/ds1l.csv")
df3 = pd.read_csv("../datasets/ds1/ds1lc.csv")

df_list = [df1, df2, df3]

for df in df_list:
    plot_fig(df)
  
