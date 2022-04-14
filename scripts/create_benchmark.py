import json
import os
import pandas as pd

import warnings
warnings.filterwarnings("ignore")

def create_ds_dir(setup: str):
    os.system("cd ../datasets && mkdir " + setup)
    return print("Directory ./datasets/" + setup + " was created ...\n")

def create_call_file(setup: str):
    """
    creating a call.mos file with updated dataset directory
    """
    file = open("call.mos", "r")
    replacement = ""
    for line in file:
        if 'cd("ds' in line:
            changes = 'cd("' + setup + '"); \n'
        else:
            changes = line
        replacement = replacement + changes
    file.close()
    # write mode
    fout = open("call.mos", "w")
    fout.write(replacement)
    fout.close()
    return

def create_process_plant(config_ds: dict):
    """
    Creates a process plant model in modelica as .mo file,
    based on the setup, that is encoded in the config_ds dict.

    The file is saved as process_plant.mo
    """

    intro = ''\
            'model process_plant\n' \
            'inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_ambient(displayUnit = "Pa"));\n' \
            'replaceable package Medium = Modelica.Media.Water.StandardWater;\n\n'
    models = ''
    equations = '\nequation\n'
    outro = 'end process_plant;\n'

    mod_list = config_ds["model"]["nodes"]
    equ_list = config_ds["model"]["edges"]

    for i in mod_list:
        models = models + (i[:-1] + " " + i + ";\n") #"(replaceable package Medium = Medium);\n")

    l, m = 1, 1
    for j in equ_list:
        if "mixer" in j[1]:
            equations = equations + ("connect(" + str(j[0]) + ".port_out, " + str(j[1]) + ".port_in" + str(l) + ");\n")
            l += 1
        if "still" in j[0]:
            equations = equations + ("connect(" + str(j[0]) + ".port_out" + str(m) + ", " + str(j[1]) + ".port_in);\n")
            m += 1
        if "mixer" not in j[1] and "still" not in j[0]:
            equations = equations + ("connect(" + str(j[0]) + ".port_out, " + str(j[1]) + ".port_in);\n")

    with open("../modelica_simulations/process_plant.mo", "w") as f:
        f.write(intro)
        f.write(models)
        f.write(equations)
        f.write(outro)
    return

def create_supermodel(faulty_module: str, fault: str):
    """
    Within the supermodels fault induction can be turned off and on.
    Hence, for each fault setup a separate supermodel must be created.
    """
    str_superModel = "../modelica_simulations/" + faulty_module[:-9] + "_superModel.mo"
    ok_str1 = "valve_leaking_simulator = if time >= 4000 then 0.0001 else 0; // leaking"
    nok_str1 = "valve_leaking_simulator = if time >= 2000 then 0.0001 else 0; // leaking"
    ok_str2 = "valve_clogging_simulator = if time >= 4000 then 0.01 else 1; // clogging"
    nok_str2 = "valve_clogging_simulator = if time >= 2000 then 0.01 else 1; // clogging"

    # read mode
    file = open(str_superModel, "r")
    replacement = ""
    for line in file:
        if fault == "l":
            if ok_str1 in line:
                changes = line.replace(ok_str1, nok_str1)
            elif nok_str2 in line:
                changes = line.replace(nok_str2, ok_str2)
            else:
                changes = line
        elif fault == "c":
            if nok_str1 in line:
                changes = line.replace(nok_str1, ok_str1)
            elif ok_str2 in line:
                changes = line.replace(ok_str2, nok_str2)
            else:
                changes = line
        elif fault == "lc":
            if ok_str1 in line:
                changes = line.replace(ok_str1, nok_str1)
            elif ok_str2 in line:
                changes = line.replace(ok_str2, nok_str2)
            else:
                changes = line
        replacement = replacement + changes
    file.close()
    # write mode
    fout = open(str_superModel, "w")
    fout.write(replacement)
    fout.close()
    return

def run_simulation(setup: str, fault: str):
    """
    This file runs the simulation by calling the call.mos file from console
    saves the results .csv as setup + fault .csv
    removes other unnecessary simulation files
    """
    os.system("omc call.mos")

    # delete unnecessarey simulation information and rename file
    os.system("cd ../datasets/" + setup + " && mv process_plant_res.csv " + setup + fault + ".csv")
    filelist = [f for f in os.listdir("../datasets/" + setup) if not f.endswith(".csv")]
    for f in filelist:
        os.remove(os.path.join("../datasets/" + setup, f))
    return

def clean_ds(setup: str, fault: str):
    """
    reading csv as df and cleaning everything unnecessary
    """
    csv_file = "../datasets/" + setup + "/" + setup + fault + ".csv"
    channels_of_interest = ["time", "v_flow", "level", "m_flow", "fluidVolume", "N_in", "opening", "heatTransfer.Ts", "medium.t", "port_a.p", "port_b.p"]

    df = pd.read_csv(csv_file)

    for column in df:
        flag = False
        for i in channels_of_interest:
            if i in column:
                flag = True
        if flag == False:
            df = df.drop(column, 1)

    df.to_csv(csv_file)
    print("dataset " + csv_file + " was created ...\n")
    return

def save_connection_model(config_dict: dict, setup: str):
    """
    saves the simulation configuration as .txt file in dataset directory
    """
    file = "../datasets/" + setup + "/" + setup + "_config.json"
    with open(file, "w") as json_file:
        json.dump(config_dict, json_file)

    print("Saved config-file ... \n")
    return

def create_dataset(config_ds: dict, setup: str):
    """
    This funcion creates a single .csv dataset by
        - building a modelica model and supermodel of the desired process plant setup (including the adapted parametrization)
        - running the simulation (regarding to the desired fault setup)
        - cleaning the dataset from unnecessary values
        - and saving it in a separate directory

    in:
        - a dict of the current ds config

    returns:
        - a csv in a directory named after the process plant build
    """

    create_ds_dir(setup)                            # creating a directory for the dataset setup
    create_call_file(setup)                         # creating an adapted call.mos file to run Modelica simulations
    create_process_plant(config_ds)                 # creating a process plant setup following the config file

    faulty_module = config_ds["faulty_module"][0]   # choose module in which faults will be induced
    for fault in config_ds["faults"]:
        create_supermodel(faulty_module, fault)     # creating a supermodel inducing the fault "fault"
        run_simulation(setup, fault)                # running the om simulation
        clean_ds(setup, fault)                      # cleaning resulting ds from unnecessary values
        print("simulation run " + str(setup) + str(fault) + " finished ... \n")
    save_connection_model(config_ds, setup)         # saving the connection model and simulation setup as file in ds-directory


    return


if __name__ == "__main__":
    # opening benchmark configuration file
    with open('benchmark_config.json') as json_file:
        config_dict = json.load(json_file)

    for setup in config_dict:
        create_dataset(config_dict[setup], setup)