# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import os
import glob

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'HAI-CPS'
copyright = '2025, Jonas Ehrhardt, Lukas Moddemann, Oliver Niggemann'
author = 'Jonas Ehrhardt, Lukas Moddemann, Oliver Niggemann'
release = '2.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = []

templates_path = ['_templates']
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
html_css_files = [
    'css/custom.css',
]
html_logo = os.path.join(os.path.dirname(__file__), '_static', 'imgs', 'logo.png')

img_dir = os.path.join(os.path.dirname(__file__), '_static', 'imgs')
image_files = glob.glob(os.path.join(img_dir, '*'))

# Make sure these are available in LaTeX output
latex_additional_files = [
    os.path.relpath(path, os.path.dirname(__file__)) for path in image_files
]

# -- Theme options ---------------------------------------------------------
html_theme_options = {
    "collapse_navigation": False,
    "sticky_navigation": True,
}

# -- Extensions ------------------------------------------------------------
extensions = [
    "sphinx.ext.autodoc",     # for API docs
    "sphinx.ext.viewcode",    # add links to source
    "sphinx.ext.napoleon",    # Google/NumPy docstrings
]

# -- For using Markdown ----------------------------------------------------
extensions.append("myst_parser")
myst_enable_extensions = [
    "attrs_inline",
]

latex_elements = {
    'papersize': 'a4paper',
    'pointsize': '11pt',
    'preamble': r'''
\usepackage{graphicx}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
''',
    'sphinxsetup': 'hmargin=1in, vmargin=1in, verbatimwithframe=false',
}
