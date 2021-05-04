This is to discuss the script for session 3.

First script in markdown:

------------
------------
------------
# Set up
First we will check if you have `git` installed in your computer. Open a terminal and write:
```bash
git --version
```
You should see something like `git version 2.17.1`. If you don't have git installed you can follow [these instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Work on your own repository
### Create a repository
First, create a repository on your user, you can follow the instructions in [Initialize a repository](https://droplets-spsrc.readthedocs.io/github/#initialize-a-repository). I will create a repository with the following characteristics:

- Name: my_research
- Description: Repository to manage my research files
- Public
- Add README file
- Add .gitignore: `python`
- Choose a license: MIT

The Github page of the repository is https://github.com/manuparra/my_research, because I created it in my user `manuparra`. This repository will live in Github from now on. Before going to the terminal, let's copy the git path of the repository so we can download it. Search for the green button with and arrow and Code written in it, click it and click the clipboard icon.

![](https://raw.githubusercontent.com/spsrc/droplets/master/docs/images/git_clone.png)

In our case the link to copy is: https://github.com/manuparra/my_resarch.git

### Clone the repository in your local computer
Now we want to have it in my local computer so I can edit files more efficiently. First, open a terminal and go to any directory you would like to work in. You can now clone the repository and access it with:

```bash
git clone https://github.com/manuparra/my_resarch.git
cd my_research
```
If you do an `ls -l` you will see the current files, for example the `README.md`. To see the status of the local copy of the repository, use:

```bash
git status
```
You should get this:
```
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```
The branch you are in (master or main), which is up to date with origin (that means the repository in the cloud, in this case Github), and that there are no changes to commit. All good!

### Make changes to one of the files

Open the `README.md` file with your favourite editor (vim, emacs, xed, edit, etc) and modify any of the content. For example, you can include a longer description of the project. Save the file. Now, let's check again the status:

```bash
git status
```
There are two important messages here. First, check the file that has been modified:

```
	modified:   README.md
```
Second, that the changes are not staged for commit, which means that if you make a commit, the changes will not be incorporated to the new version.
```
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
```
To actually stage the file, we can `add` it, as in the informative note. So you can run

```bash
git add README.md
```
Running again `git status` now gives:
```
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   README.md
```

The next step is to commit the change. A commit need a message that describes it. It is common to write an actual action that describes what has been changed, for example:

```bash
git commit -m "Update README file with more details"
```
A final `git status` will give you that your branch is ahead from origin (means Github) by one commit. Apart from that, everything is clean. Note the message:
```
  (use "git push" to publish your local commits)
```
Everything is easy when you read the messages. Let's push the changes from your local repository in your computer to the `origin` repository in Github. We will be more specific and define where to push (`origin`) and which branch (master) and use the command

```bash
git push origin master
```

If you go back to the Github repository you should see that the file has been modified. You can also check the commits, when it happened and who did it.

### Change several files in one go

We want to make a series of changes and create new files, but all these will be a "single update" of the repository. The idea is to make as many changes as we want, stage them (with `git add <files>`), make a single commit (with `git commit -m "text") and push all the changes in one go (with `git push origin master`).

I will create a file called `my_plot_function.py`


