# Introduction to containers (singularity)

(This chapter has been developed by M. Parra (IAA). The scripts can be found [here](https://github.com/spsrc/reproducibility-course/tree/main/session3/T3.2_singularity))

**Table of contents**

<!-- vscode-markdown-toc -->
* 1. [Containers, images, ...  ?](#Containersimages...)
* 2. [What containers are not](#Whatcontainersarenot)
* 3. [Why do you (and don't) need containers](#Whydoyouanddontneedcontainers)
* 4. [Singularity installation](#Singularityinstallation)
* 5. [What is Singularity and what advantages does it have over Docker](#WhatisSingularityandwhatadvantagesdoesithaveoverDocker)
* 6. [Singularity Commands](#SingularityCommands)
* 7. [Containers Hub](#ContainersHub)
* 8. [Interact with images](#Interactwithimages)
	* 8.1. [Entering the images from a shell](#Enteringtheimagesfromashell)
	* 8.2. [Executing command from a container](#Executingcommandfromacontainer)
* 9. [Building our own container](#Buildingourowncontainer)
* 10. [References](#References)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

<HR>

**Aim of this session**

In this section we provide a very short introduction to the general idea behind containers. We briefly discuss the situations when containers can be a good choice for your problem and when other solutions might be more fitting. During this training event, we focus on one containerisation technology: Singularity, although we will cite other widespread container technologies such as Docker. You are most likely to see these two used in the research environment, with Singularity becoming the technology of choice for High Performance Computing development (although Docker is not going from that space anytime soon).


##  1. <a name='Containersimages...'></a>Containers, images, ...  ?

You may hear people say they are "running an image" or "running a container". These terms are often used interchangeably, although, they can mean different things - container being the running image.
The most important feature of containers, and where their real strength comes from, is that unlike "regular" applications, they can and often do perform all their work in isolation from their host OS.

Your containers do not have to know what the rest of your OS is up to. They don't even have to have access to the same files as your host OS, or share the same network  (again it is possible to achieve that). Containers put a layer between your existing host filesystem and whatever you are running inside them.

##  2. <a name='Whatcontainersarenot'></a>What containers are not

You will often hear the expression that "containers are like VMs", or "like VMs, but lighter". This may make sense on the surface. 

At the end of the day, containers make use of virtualisation, *BUT* a different kind of virtualisation. There are fewer moving components in the case of containers and the end result might be the same for the end user.

Containers remove a lot of components of virtual machines though: **they do not virtualise the hardware**, they do not have to contain a fully-fledged guest OS to operate. They have to **rely on the host OS** instead. VMs sit on top of the underlying hardware, whereas containers sit on top of the host OS.

![Containers vs VMs](https://gitlab.com/ska-telescope/src/ska-src-training-containers/-/raw/main/Talks/containers-intro/media/Virtual-Machine-and-Container-Deployments.png)
*Source [1](#ref1).*


For a more in-depth explanation of the differences between VMs and containers, please see this website by the [IBM Cloud Team](https://www.ibm.com/cloud/blog/containers-vs-vms).

##  3. <a name='Whydoyouanddontneedcontainers'></a>Why do you (and don't) need containers

**Yes, containers:**

- Containers will provide a reproducible work environment.
- They go beyond just sharing your code: you provide a fully-working software with all its required dependencies (modules, libraries, etc.).
- You can build self-contained images that meet the particular needs of your project. No need to install software "just in case", or install something to be used just once.
- You are no longer tied to the software and library versions installed on your host system.
- Need python3, but only python2 is available? There is an image for that.


**No, thanks:**

- Your software still depends on hardware you run it on - make sure your results are consistent across different hardware architectures.
- Not the best for sharing large amounts of data (same as you wouldn't use git to share a 10GB file).
- Additional safety concerns, as e.g. Docker gives extra power to the user "out of the box". There is potential to do some damage to the host OS by an inexperienced or malicious user if your containerisation technology of choice is not configured or used properly.



##  4. <a name='Singularityinstallation'></a>Singularity installation

Follow the steps below to install Singularity for your operating system:

- [Linux](https://ska-telescope.gitlab.io/src/ska-src-training-containers/#h.cpchh14b5v93)
- [MacOSX](https://ska-telescope.gitlab.io/src/ska-src-training-containers/#h.nuqiqiwd9xpa)
- [Windows](https://ska-telescope.gitlab.io/src/ska-src-training-containers/#h.vfuryuhkc9ca)

##  5. <a name='WhatisSingularityandwhatadvantagesdoesithaveoverDocker'></a>What is Singularity and what advantages does it have over Docker

Singularity is a container platform (like Docker, PodMan, Moby, LXD, ... among other). It allows you to create and run containers that package up pieces of software in a way that is portable and reproducible. You can build a container using Singularity on your laptop, and then run it on many of the largest HPC clusters in the world, local university or company clusters, a single server, in the cloud, or on a workstation down the hall. Your container is a single file, and you don’t have to worry about how to install all the software you need on each different operating system.

**Advantages:**

- Easy to learn and use (relatively speaking)
- Approved for HPC (installed on some of the biggest HPC systems in the world)
- Can convert Docker containers to Singularity and run containers directly from Docker Hub
- SingularityHub

**Disadvantages:**

- Less mature than Docker
- Smaller user community
- Under very active development

Singularity is focused for scientific software running in an HPC environent.

**Aims**

- Mobility of Compute
- Reproducibility
- User Freedom
- Support on Existing Traditional HPC


##  6. <a name='SingularityCommands'></a>Singularity Commands

To work with the Singularity there are really only a few commands that provide us with all the operations:

- ``build`` : Build a container on your user endpoint or build environment

- ``exec`` : Execute a command to your container

- ``inspect`` : See labels, run and test scripts, and environment variables

- ``pull`` : pull an image from Docker or Singularity Hub

- ``run`` : Run your image as an executable

- ``shell`` : Shell into your image



##  7. <a name='ContainersHub'></a>Containers Hub

Practically most of your day-to-day software and services are already containerised in public catalogues. These catalogues are called Hubs and contain thousands of ready-to-use containers. You only need to launch and run them to be able to use their functionality.

Here are the most important ones:

- [DockerHub](https://hub.docker.com/) 
- [SingularityHub](https://singularityhub.github.io/singularity-catalog/)

Examples of ready-to-use containers include the following:

- Bio:
  - [QIIME](https://hub.docker.com/search?q=qiime)
  - [BioGenomics](https://hub.docker.com/r/biocontainers/clustal-omega)
  - ...
- Astro:
  - [CASA](https://hub.docker.com/search?q=casacore)
  - [CARTA](https://hub.docker.com/r/carta/cartabuild/)
  - [wsclean](https://hub.docker.com/search?q=wsclean)
  - ...
- Langs and computation:
  - [R](https://hub.docker.com/_/r-base)
  - [Python](https://hub.docker.com/search?q=python)
  - [Fortran](https://hub.docker.com/search?q=Fortran)
  - ...



###  Run a simple test

Go to the environment where you have Singularity installed to do some tests. You can test your installation like so:

```
$ singularity pull docker://godlovedc/lolcow
```

This command will simply download an image that already exists in Docker (`docker://godlovedc/lolcow from DockerHub: lol docker`), and store it as a local file with SIF format.

Then, we execute the image as an executable, simply typing:

```
$ singularity run lolcow_latest.sif
```



##  8. <a name='Interactwithimages'></a>Interact with images

Two ways of working with singularity containers:

- Entering the images from a shell
- Executing command from a container


###  8.1. <a name='Enteringtheimagesfromashell'></a>Entering the images from a shell

The shell command allows you to open a new shell within your container and interact with it as though it were a small virtual machine.

For this training we will download a container image from DockerHub that includes the R programming language for version 4.1.0. To find the container or the concrete version we can go to DockerHub and search for `R` and then select the tag we are looking for.


```
singularity pull docker://r-base:4.1.0
```

This downloads an image called ``r_base4.1.0.sif`` containing everything needed to run R. Then, we run the following command to start a shell in the container.

```
singularity shell r-base_4.1.0.sif
```

We are now inside the container and can interact with it without modifying anything on our host system. 


For example, we are now going to execute a small piece of code that generates an image, simply by executing the following [code](./plot01.R).

```
install.packages("ggplot2")
library(ggplot2)

mydata<-economics
theme_set(theme_light())

ggplot(mydata, aes(x=date)) +
   geom_line(aes(y=unemploy), color = "#00AFBB") +
   labs(y="Unemployment", x="Year")
```

:bulb: **NOTE:** Remember that outside the container R does not exist, it only lives inside the container, either with the shell command or with exec.


###  8.2. <a name='Executingcommandfromacontainer'></a>Executing command from a container

We could automate this a bit more by directly executing some command inside the contedor on some data we have in our project. For this it would be enough to execute the following and automatically the contenedor would execute the command, and then it would finish.


```
singularity exec r-base4.1.0.sif Rscript plot02.R
```

In this example the file `plot02.R`, generates an image file ``ouput.png`` with the plot already available.

Here is the [code](./plot02.R):

```
install.packages("ggplot2")
library(ggplot2)

mydata<-economics
theme_set(theme_light())

ggplot(mydata, aes(x=date)) +
   geom_line(aes(y=unemploy), color = "#00AFBB") +
   labs(y="Unemployment", x="Year")

ggsave("ouput.png")
```

Now we are going to do something more complete, so we need some data in a CSV file, which is available [here](https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv), and a new file with the commands to be done in R. The idea with this example is to see a workflow with containers, from the moment I have the source code of my program with the data, to its execution and results.

Here is the [code](./plot03.R):

```
library(ggplot2) 

carsUSA <- read.csv("cars.csv",header= TRUE)

carsUSA$gear <- factor(carsUSA$gear,levels=c(3,4,5),
                       labels=c("3","4","5")) 
carsUSA$am <- factor(carsUSA$am,levels=c(0,1),
                     labels=c("0","1")) 
carsUSA$cyl <- factor(carsUSA$cyl,levels=c(4,6,8),
                      labels=c("4","6","8")) 

qplot(mpg, data=carsUSA, geom="density", fill=gear, alpha=I(.5), 
      main="Distribution of Gas Milage", xlab="Miles Per Gallon", 
      ylab="Density")

ggsave("mtcars.png")
```

Then try it:

```
singularity exec r-base4.1.0.sif Rscript plot03.R
```

After that you have to check a new file `mtcars.png` with the latest plot.


##  9. <a name='Buildingourowncontainer'></a>Building our own container

Before you build your own container, make sure that someone else hasn't done it before. If this is not the case, then you will have or need to create your own container, to run a function, create a documentation pdf, generate a graph or run a service, among many others.

To build a container you need to know a bit about linux and how to install packages, as this is the basis for "how containers are made". 
After all, building a container is nothing more than following a recipe of commands or operations that install and configure things ([+info](https://sylabs.io/guides/3.7/user-guide/definition_files.html)).

Firstly here you can see an example of a definition file for the first example of container we've seen ``lolcow.def``:

```
Bootstrap: docker
From: ubuntu:16.04

%post
    apt-get -y update
    apt-get -y install fortune cowsay lolcat

%environment
    export LC_ALL=C
    export PATH=/usr/games:$PATH

%runscript
    fortune | cowsay | lolcat
```

We can build it with:

```
$ sudo singularity build lolcow.sif lolcow.def
```

:bulb: **NOTE:** Here you will need ``sudo`` privileges.



We will review how to create a container that automatically downloads some weather data and prints a result on a graph. To do it, we create this file as `weather.def` with the instructions to build the image:


```
Bootstrap: shub

From: r-base:4.1.0
%post
  # Install required R packages
  R --slave -e 'install.packages("ggplot2", repos="https://cloud.r-project.org/")'

%runscript
  #!/bin/bash
  Rscript "main.R"
```

We also need the file ``main.R`` where the R commands are:

```

temperature <- read.csv(url("https://raw.githubusercontent.com/datasets/global-temp/master/data/annual.csv"))

jpeg(file="temperature.jpg")
plot(x=temperature$Year,y=temperature$Mean)
dev.off()

```

After that we can build the container:

```
sudo singularity build weather.sif weather.def
```

And then we can execute the container with:

```
singularity run weather.sif 
```

That's all !.


##  10. <a name='References'></a>References

1. <a name="ref1">NIST Special Publication 800-190, Application Container Security Guide - Scientific Figure on ResearchGate</a>. Available from: https://www.researchgate.net/figure/Virtual-Machine-and-Container-Deployments_fig1_329973333 [accessed 28 Jan, 2022]

