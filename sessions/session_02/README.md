---
title: Share your Jupyter notebooks with git
---

# Motivation
- In session 01 we created a Jupyter notebook
- Now we want to share it openly with my boss

# Requirements
- Account on github.com
- git
- conda env create -f environment.yml

# Create a repository on GitHub
- log into github.com (others: gitlab, bitbucket, etc)
- create a repository

# Create a local clone
- git clone
- cd clone

# Add the notebook to the repository
- wget https://raw.githubusercontent.com/spsrc/droplets/master/gaia_exploratory/gaia_exploratory.ipynb
- git add gaia_exploratory.ipynb
- git commit -m " initial version "
- git push # see notebook in web browser

# Update the repository
- jupyter lab # open and edit notebook
- git add
- git commit -m " here is my change "
- git push # see updated notebook in web browser

# Reference Material
- Jake Vanderplas: https://bit.ly/36z1IyG

# Problem
- My boss can see the notebook but cannot execute it!
- Solutions in the next sessions!

