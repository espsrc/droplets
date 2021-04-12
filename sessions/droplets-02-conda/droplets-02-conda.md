# Open Science Droplets 02
# Keep your software organized with Conda

Our collaborator shared a [Jupyter notebook](https://github.com/spsrc/droplets/blob/master/gaia_exploratory/jupyter_exploratory.ipynb) with us
and we want to re-run it and change a few things.

## Install Jupyter using conda
Let's work on a temporary folder so at the end of the session we will simply remove the folder to clean everything up:
```
 mktemp --directory
 cd </path/to/temp/folder>
```

Now let's download the git repository containing the notebook:
```
 git clone https://github.com/spsrc/droplets.git
```

First, do we have Jupyter installed?
```
 which jupyter
```

We don't. Instead of using the operating system's package manager (e.g. `apt-get`) or performing a manual installation, let's use `conda`!
```
 curl --output Miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
 bash Miniconda.sh -b -p conda-install
 source conda-install/etc/profile.d/conda.sh
 conda install mamba --channel conda-forge --yes
```

A few comments from the previous commands:
* [Conda](https://conda.io) is a flexible package manager that allows you to install many software packages without being root.
* [Miniconda](https://docs.conda.io/en/latest/miniconda.html) is just a small installer that will only download the minimum set of dependencies.
* [mamba](https://github.com/mamba-org/mamba) provides a faster way of installing conda packages.

Don't worry, the installation will only exist under the temporary folder so it won't interfere with other software on your computer.

Right, so once the `conda` command is available, let's now install Jupyter:
```
 mamba create --name jupyter_env python jupyter
 conda activate jupyter_env
 which jupyter
```

At this point we have just created a **conda environment** named `jupyter_env` which will contain the latest versions of `python` and `jupyter`.
A conda environment is a directory that contains a specific collection of conda packages that you have installed. A good idea is to name conda
environments to reflect the project that you are currently working on. That's going to help you organize your software packages!

After confirming that the Jupyter is available, let's open up the notebook:
```
 jupyter notebook droplets/gaia_exploratory/jupyter_exploratory.ipynb 
```
For the purpose of this demo we will set `Gaia.ROW_LIMIT = 5000` before running the cell to make the execution faster. This will only load a fraction of the data.

Now we execute the first cell ..., which produces the following error:
```
ModuleNotFoundError: No module named 'matplotlib'
```

## Getting the software needed to run the analysis
The `matplotlib` library is missing. Let's install it on top of the same `jupyter_env` conda environment. We open a new terminal, activate the environment and install the missing library: 
```
source conda-install/etc/profile.d/conda.sh 
conda activate jupyter_env
mamba install matplotlib
```

Back in the notebook, re-running the first cell gives no problem with `matploblib`, but produces a new error:
```
ModuleNotFoundError: No module named 'astroquery'
```

Time to install `astroquery`. We repeat the operation, so we go back to the terminal and run:

```
 mamba install astroquery
```
But, contrary to the installation of `matplotlib` we cannot install `astroquery`:
```
Problem: nothing provides requested astroquery
```

Wait, is there no `astroquery` package? Let's check by searching the package on [https://anaconda.org/](https://anaconda.org/).

[It is there!](https://anaconda.org/search?q=astroquery) However, so far we have been using conda's `default` channel and
`astroquery` is only available in other channels. A channel in `conda` is like a repository in `apt-get`, just a remote folder
with extra packages available.

Out of all the available options we strongly recommend using [Conda Forge](https://conda-forge.org/) since it has a big open-source community
behind it, using very good practices for creating and upgrading conda packages.

Back to our issue, let's then install `astroquery` in the terminal but now selecting the specific channel that contains the package:
```
 mamba install --channel conda-forge astroquery
```

Back to the Jupyter notebook, re-running the cell now works!

Great, let's move onto the next cells and execute them.

Oh no! A few cells below we get a similar issue again!
```
ModuleNotFoundError: No module named 'pandas'
```

Wouldn't it be nice if the notebook was shipped with all the dependencies it needs to run?

## Defining all required software in a single file

Well, that is what **conda environment files** are for! For this notebook, our colleage has also included all the required dependencies
to run the notebook [here](https://github.com/spsrc/droplets/blob/session-conda/environment.yml). These are the contents of the `environment.yml` file

```yml
name: droplets

channels:
 - conda-forge
 - defaults

dependencies:
 - python 3.8.*
 - astropy 4.0.*
 - astroquery 0.4.*
 - matplotlib 3.1.*
 - numpy 1.18.*
 - jupyter 1.0.*
 - pandas 1.0.*
 - mkdocs 1.0.*
```

The official documentation about conda environments is available at:

https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html

With a single command we can install all the dependencies at once. Let's give it a go then!
```
 mamba env create --file droplets/environment.yml
```

This creates a new conda environment called `droplets` as pre-defined in the file. Remember that we had activated the environment `jupyter_env` before. We need to activate the new environment `droplets` that contains all the required software. Also, we need to close the notebook and re-launch it from the terminal with the new conda environment:
```
 conda activate droplets
 jupyter notebook droplets/gaia_exploratory/jupyter_exploratory.ipynb
```

Now we run the full notebook without issues, yay!

## Creating environments for other projects

What if we want to re-use part of this environment for a different project?

Just copy and paste the `environment.yml` into a different file and:
* Change the name of the environment (e.g. `project-a`)
* Add/remove dependencies
```
 cp droplets/environment.yml project-a.yml
 # Now edit the file project-a.yml with a new name (for example project-a) and the dependencies you want. Create the environment with:
 mamba env create --file project-a.yml
 ```
 
 Now you are ready to activate the environment with its own software, independent from the other environments:
 ```
 conda activate projet-a
```

There you are! The idea is that for each project you also include the conda environment file that contains
all the required dependencies for the code to run properly. If you upload the `environment.yml` file to
your `git` repository, you can even keep it under version control! That's great for reproducibility!

Conda and conda environments are quite flexible and we encourage you to read more:

https://docs.conda.io/projects/conda/en/latest/user-guide/cheatsheet.html

Many thanks for you attention!
