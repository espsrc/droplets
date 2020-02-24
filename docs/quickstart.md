# Quick start with the contents

Each chapter will have some notes on how to install the software required to
follow the examples. Here we explain how to simplify the process by having a
working environment with all the dependencies with a few lines of code.
Alternatively, with a single click you can just deploy a ready-to-work virtual
machine with Binder.

## Execute online (Binder)

For a completely hassle-free experience just follow the link below! [Binder](https://mybinder.org/) will create a virtual machine to automagically serve an executable version of the Jupyter notebook with the exploratory Gaia analysis. It will take a couple of minutes to set up everything.

[Binder exploratory Gaia analysis](https://mybinder.org/v2/gh/spsrc/droplets/master?filepath=gaia_exploratory%2Fjupyter_exploratory.ipynb)


## Execute on your local machine

You need to download the [droplets](https://github.com/spsrc/droplets) repository from Github and to have a working conda installation. If you don't have a conda environment on your system, this will create a temporary conda installation called `my_conda_env` in the droplets directory. This will not interfere with any installation on your system, and removing it is as simple as deleting the `my_conda_env` directory. More information at [miniconda](https://docs.conda.io/en/latest/miniconda.html)

### On Linux:

```bash
# 1. Download droplets repository contents from Github
git clone https://github.com/spsrc/droplets.git
cd droplets
# 2. Prepare a local installation of conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh -b -p my_conda_env
rm ./Miniconda3-latest-Linux-x86_64.sh
# 3. Make conda available to your terminal
source my_conda_env/etc/profile.d/conda.sh
```
You can skip steps 2 and 3 if you already have conda available. Now that you have everything needed, you can create a conda environment with the dependencies:
```bash
conda env create -f environment.yml
conda activate droplets
jupyter notebook
```

### On MacOS:
Here are the steps for MacOS. The only difference is the Miniconda version to download.
```bash
# 1. Download droplets repository contents from Github
git clone https://github.com/spsrc/droplets.git
cd droplets
# 2. Prepare a local installation of conda.
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash ./Miniconda3-latest-MacOSX-x86_64.sh -b -p my_conda_env
rm ./Miniconda3-latest-MacOSX-x86_64.sh
# 3. Make conda available to your terminal
source my_conda_env/etc/profile.d/conda.sh
```

You can skip steps 2 and 3 if you already have conda available. Now that you have everything needed, you can create a conda environment with the dependencies:
```bash
conda env create -f environment.yml
conda activate droplets
jupyter notebook
```
Now navigate to the ```gaia_exploratory``` folder
![]/images/quickstart_naviagtenotebook_1.png
and to the ```jupyter_exploratory.ipynb``` 
![]/images/quickstart_naviagtenotebook_2.png

### Comming back in the future

If you want to come back and continue an analysis at a later time you don't need to repeat all the installation steps. Just go to the droplets folder and run:

```bash
source my_conda_env/etc/profile.d/conda.sh
conda activate droplets
```

## Take down

If you want to remove everything related to the installations above, simply remove the droplets directory, which also contains the local conda installation and all the dependencies.

```bash
rm -r droplets
```

In case you were working with your own conda installation, you can delete the environment with:

```bash
conda remove -n droplets
```

