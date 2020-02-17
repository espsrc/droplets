---
title: Software management with Conda
---

# Motivation
- Our collaborator shared a Jupyter notebook with me
- However, I cannot execute it on my laptop, what can I do?

# Open and execute notebook
- `wget https://bit.ly/2T4lihJ -O notebook.ipynb`
- `jupyter lab # open and run notebook`
- astroquery is missing

# Conda to the rescue!
- Inside jupyter lab, open a terminal
- `conda install -c conda-forge astroquery`
- Re-run notebook # pandas is also missing

# Install all dependencies
- `conda install -c conda-forge conda_deps`
- `conda_deps notebook.ipynb > environment.yml`
- `conda env update -n session03 -f environment.yml`
- Re-run notebook

# Share your code with its dependencies
- git add environment.yml
- git commit -m " add conda environment "
- git push

# What if another notebook requires astroquery-0.3.5?
- conda list astroquery
- cp environment.yml env-astroquery-0.3.5.yml
- vim env-astroquery-0.3.5.yml # make astroquery 0.3.5 and update env name
- conda env create -f environment.yml

# WIP:
- `conda activate astroquery-0.3.5`
- produces: CommandNotFoundError (i.e. we need to get out of the notebook to switch envs!)

# Problem
- to-do
- Solutions in the next sessions!

# Reference Material
- Jake Vanderplas: https://bit.ly/36z1IyG
- https://conda.io/
- Which license to use? https://choosealicense.com/
