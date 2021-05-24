# Open Science Droplets 05
# Share your project with the World with Binder

## Purpose

We will create a Jupyter notebook that downloads the image image of a source from astronomical surveys using the [NASA Skyview service](https://skyview.gsfc.nasa.gov/current/cgi/titlepage.pl). We will include the script in the IAA-CSIC Github organization so anyone can use and contribute to the code. Finally, we will make everything ready to be executed in the cloud using the service provided by [myBinder](https://mybinder.org/).

We will show the natural process to construct and work with the repository, starting with this already created code [skyview_func.py](https://gist.github.com/jmoldon/678f44f08216e143ba23c54b15055adf).

##

### Explore the original script

The available catalogs can be seen here: https://skyview.gsfc.nasa.gov/current/cgi/query.pl

We will start with this code to retrieve images from surveys https://gist.github.com/jmoldon/678f44f08216e143ba23c54b15055adf

The script has the following functions:
- `coords_from_name(field_name)`: given a source name (e.g. M101) it gives the coordinates of the source
- `def plot_fits(fits_name, plot_title=None, cmap_name='viridis', colorbar=True, contour=True)`: it produces a png image from a fits file
- `call_skyview(source_name, survey, fov=1)`: given a survey, a name and a FoV, it downloads the cutout image to fits file

Therefore, if we `import` the script, we can use `call_skyview` to produce a png given a source name and a survey name.

### Create repository and populate with main content

We can search foy IAA-CSIC in Github and we see that there is an existing organization: https://github.com/IAA-CSIC. Please, contact Javier Moldón if you want to become a member of the organization.

First, we create the repository iaa-skyview. We will fill the repo parameters as explained in [Droplets - Initialize a repository](https://droplets-spsrc.readthedocs.io/github/#initialize-a-repository). 

Now, we will clone the repository so we can work in our local terminal.

We create a file `skyview_func.py` with the contents of [skyview_func.py](https://gist.github.com/jmoldon/678f44f08216e143ba23c54b15055adf). Push the file to Github (git add, commit and push as explained in [Droplets - Working with git](https://droplets-spsrc.readthedocs.io/git/#working-with-git-locally).

We try to execute it using `python skyview_func.py M31 DSS 2`, but it does not work. Sounds familiar?

```bash
$ python skyview_func.py M31 DSS 2
Traceback (most recent call last):
  File "skyview_func.py", line 5, in <module>
    from astroquery.skyview import SkyView
ModuleNotFoundError: No module named 'astroquery'
```

We need to install all the required dependencies.
### Define the conda environment

We create a conda environment file. If you don't remember the exact format, just look at an [example](https://github.com/spsrc/droplets/blob/master/environment.yml).

We create this environment.yml file and fill it with the dependencies we see in the script [skyview_func.py](https://gist.github.com/jmoldon/678f44f08216e143ba23c54b15055adf) (astropy, astroquery, etc...)
```yml
name: iaa-skyview
  
channels:
 - defaults
 - conda-forge

dependencies:
  - python
  - astroquery
  - astropy
  - aplpy
  - matplotlib
  - jupyterlab
```

and create the environment with `mamba env create -f environment.yml`. If you don't have conda or mamba installed, follow [this](https://droplets-spsrc.readthedocs.io/quickstart/#execute-on-your-local-machine).

Now we activate the environment, named `iaa-skyview` so we have access to the required software.

```bash
mamba env create -f environment.yml
...
conda activate iaa-skyview
```
### Open Jupyter lab and create a basic notebook

Next, we will create a notebook that imports the functions of the script and executes `call_skyview`. For example, we can add this to the notebook:

```python
from skyview_func import call_skyview
call_skyview('M101', 'DSS', 1)
```

You can try with different sources and different surveys.

### Run the notebook on myBinder.org

myBinder is a free service that gets any public repository (you don't need to enroll or configure anything), create a virtual machine, install the dependencies listed in your conda environment, and execute Jupyter so you can run the notebooks or scripts in the cloud.

- Go to [myBinder.org](https://mybinder.org/)
- Copy the link of the repository
- Press Launch and wait

In the same page, you can copy the URL below and share your Binder with others. You will also find a text that you can paste into your README to show a binder badge.

You can also add this to the link to start Jupyter Lab instead of the more basic Jupyter:
```
?urlpath=lab/tree/<name-of-notebook.ipynb>
```

## Summary

We have created a public respository in Github under the IAA-CSIC organization. This is open to anyone to contribute or add new functionality. This can be executed locally or in the cloud provided by myBinder. 


