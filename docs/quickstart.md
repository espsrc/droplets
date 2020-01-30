# Quick start with the contents

Each chapter will have some notes on how to install the software required to
follow the examples. Here we explain how to simplify the process by having a
working environment with all the dependencies with a few lines of code.
Alternatively, with a single click you can just deploy a ready-to-work virtual
machine with Binder.

## Execute on your local machine

### On Linux:
If you don't have a conda environment on your system, this will create a temporary conda installation called `my_conda_env` in your current directory. This will not interfere with any installation on your system, and removing it is as simple as deleting the `my_conda_env` directory. More information at [miniconda](https://docs.conda.io/en/latest/miniconda.html)

```bash
git clone https://github.com/spsrc/droplets.git
cd droplets
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O
bash ./Miniconda3-latest-Linux-x86_64.sh -b -p my_conda_env
rm ./Miniconda3-latest-Linux-x86_64.sh
source my_conda_env/etc/profile.d/conda.sh 
```
```bash
conda create -n droplets python=3.6
conda activate droplets 
jupyter notebook
```

### On MacOS:

```bash
TBD
```

## Execute online (Binder)

TBD

