---
title: Software management with Conda
---

# Motivation
- Our collaborator shared a Jupyter notebook with me
- However, I cannot execute it on my laptop, what can I do?

# Open and execute notebook
- `git clone git@github.com:spsrc/droplets.git`
- `cd droplets/gaia_exploratory`
- `jupyter lab --no-browser >& output &`
- `tail output # open browser and run notebook`
- Arrgh: astroquery is missing! How do I install it?

# Conda to the rescue!
- `conda install -c conda-forge astroquery`
- Arrgh: pandas is also missing!

# Install all dependencies
- `conda install -c conda-forge conda_deps`
- `conda_deps jupyter_exploratory.ipynb > environment.yml`
- `conda env update -n session-03 -f environment.yml`
- Re-run notebook

# Share your code with its dependencies
- git checkout -b conda-env
- git add environment.yml
- git commit -m " add conda environment "
- git push origin conda-env

# What if another notebook requires astroquery-0.3.5?
- conda list astroquery
- cp environment.yml env-astroquery-0.3.5.yml
- vim env-astroquery-0.3.5.yml # make astroquery 0.3.5 and update env name
- conda env create -f env-astroquery-0.3.5.yml
- conda activate astroquery-0.3.5
- conda list astroquery

# Problem
- to-do
- Solutions in the next sessions!

# Reference Material
- https://conda.io/

# NB
- switching conda environments inside Jupyter Lab's terminal does not work: CommandNotFoundError
