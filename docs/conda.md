# Installing miniconda

We recommend using `conda` to manage the dependencies. Miniconda is a light-weight version of Anaconda. First we show how to install Miniconda if you don't have it already. More details [here](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html#regular-installation)

You can skip this step if you already have conda available in your path.

## Miniconda for Linux:
```bash
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh
rm ./Miniconda3-latest-Linux-x86_64.sh
```

## Miniconda for macOS:
```bash
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
```

## Miniconda for Windows:
You can follow the instructions (download the exe file) from here: https://docs.conda.io/projects/conda/en/latest/user-guide/install/windows.html


## Mamba!

[mamba](https://github.com/mamba-org/mamba) is a very efficient dependency solver. If you don't have it, you can substitute all `mamba` commands with `conda`, and it will do the same but slower. You can install it in the base environment with:

```
conda install mamba -n base -c conda-forge
```

!!! warning
    Remember you can replace the command `conda` by `mamba` if you have mamba installed. Except when you activate or desactivate environments, for which you still need to use `conda`.

## Mambaforge
This is an optional way of having everything in one go by skipping miniconda and installing directly. Additionally, this will set by default `conda-forge` as the main and only channel. 

```bash
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh
```

### Uninstallation

It is very easy to clean your system and uninstall the conda installation by following the instructions here](https://github.com/conda-forge/miniforge#uninstallation). This works for unix-type installations.

Uninstalling Miniforge/Mambaforge means removing the files that were created during the installation process. You will typically want to remove:

1. Any modifications to your shell rc files that were made by Miniforge:

```bash
# Use this first command to see what rc files will be updated
conda init --reverse --dry-run
# Use this next command to take action on the rc files listed above
conda init --reverse
# Temporarily IGNORE the shell message 
#       'For changes to take effect, close and re-open your current shell.', 
# and CLOSE THE SHELL ONLY AFTER the 3rd step below is completed.
```

2. Remove the folder and all subfolders where the base environment for Miniforge was installed:

```bash
CONDA_BASE_ENVIRONMENT=$(conda info --base)
echo The next command will delete all files in ${CONDA_BASE_ENVIRONMENT}
# Warning, the rm command below is irreversible!
# check the output of the echo command above
# To make sure you are deleting the correct directory
rm -rf ${CONDA_BASE_ENVIRONMENT}
```

3. Any global conda configuration files that are left behind.

```bash
echo ${HOME}/.condarc will be removed if it exists
rm -f "${HOME}/.condarc"
```

```

# Working with conda environments

Once we have installed conda/miniconda we are in the `base` environment. Now, we can create our environment for our first project.

```
mamba create --name repro36 python=3.6
conda activate repro36
python --version
```
We can check everything that is installed in the environment with:

```
conda list
```

After this command we can see:

```
# packages in environment at /home/jmoldon/miniconda3/envs/repro36:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                        main  
_openmp_mutex             4.5                       1_gnu  
ca-certificates           2022.3.29            h06a4308_0  
certifi                   2020.6.20          pyhd3eb1b0_3  
ld_impl_linux-64          2.35.1               h7274673_9  
libffi                    3.3                  he6710b0_2  
libgcc-ng                 9.3.0               h5101ec6_17  
libgomp                   9.3.0               h5101ec6_17  
libstdcxx-ng              9.3.0               hd4cf53a_17  
ncurses                   6.3                  h7f8727e_2  
openssl                   1.1.1n               h7f8727e_0  
pip                       21.2.2           py36h06a4308_0  
python                    3.6.13               h12debd9_1  
readline                  8.1.2                h7f8727e_1  
setuptools                58.0.4           py36h06a4308_0  
sqlite                    3.38.2               hc218d9a_0  
tk                        8.6.11               h1ccaba5_0  
wheel                     0.37.1             pyhd3eb1b0_0  
xz                        5.2.5                h7b6447c_0  
zlib                      1.2.12               h7f8727e_1  
```

We can install any software available in anaconda.org with a simple command. For example:

```
mamba install matplotlib
```


When we need to work on a different project, we can create new environments with their specific requirements
```
mamba create --name r_3.5 --channel r r=3.5.1 r-essentials
conda activate r_3.5
```

Remember that some packages come from specific channels like conda-forge, r, bioconda, etc.

We can even install the pip package manager:

```
mamba install pip
```

## Using environments

The best practice is to store all the main dependencies in an environment file:

Contents of file `environment.yml`:
```yml
name: r-env
  
channels:
- conda-forge
- bioconda
- defaults

dependencies:
- r-base=4.1.3
- r-reshape2=1.4.4
- r-ggplot2=3.3.5
```

```
mamba env create -f environment.yml
```

Now we can access the environment with:

```
conda activate r-env
```

We can now execute a script with R:

```
Rscript script.r
```

### Automatically created environment file

If you want to see what you installed manually, you can do:

```
conda activate repro36
conda env export --from-history
```

If you want the full details of all the dependencies:

```
conda env export
```

### Remove environment

We can easily remove any environment created (you may need to deactivate it first).
```
conda env remove -n r_3.5
```

# Let's save our analysis in Github

- Create repository
- Add environment.yml, script.r, ouput.png, README with instruction

