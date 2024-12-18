import os

def create_dir(dir_path):
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)


def read_file(file_path):
    with open(file_path, 'r') as f:
        content = f.readlines()
    return content