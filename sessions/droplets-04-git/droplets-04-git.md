# Open Science Droplets 04
# Version control with git (episode I)

Slides for this session are available in [droplets-04-introduction-slides.pdf](droplets-04-introduction-slides.pdf)

## Set up
First we will check if you have `git` installed in your computer. Open a terminal and write:
```bash
git --version
```
You should see something like `git version 2.17.1`. If you don't have git installed you can follow [these instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Main git workflow in your computer

### Create a repository
First, create a repository on your user, you can follow the instructions in [Initialize a repository](https://droplets-spsrc.readthedocs.io/github/#initialize-a-repository). I will create a repository with the following characteristics:

- Name: MessierCatalogueService
- Description: Repository to manage my research files
- Public
- Add README file
- Add .gitignore: `python`
- Choose a license: MIT

The Github page of the repository is https://github.com/manuparra/MessierCatalogueService, because I created it in my user `manuparra`. This repository will live in Github from now on. Before going to the terminal, let's copy the git path of the repository so we can download it. Click the green button with and arrow and the word `Code`, and then click the clipboard icon to copy the link.

![](https://raw.githubusercontent.com/spsrc/droplets/master/docs/images/git_clone.png)

In our case the link to copy is: https://github.com/manuparra/MessierCatalogueService.git

### Clone the repository in your local computer
Now we want to have it in my local computer so I can edit files more efficiently. First, open a terminal and go to any directory you would like to work in. You can now clone the repository and access it with:

```bash
git clone https://github.com/manuparra/my_resarch.git
cd MessierCatalogueService
```
If you do an `ls -l` you will see the current files, for example the `README.md`. To see the status of the local copy of the repository, use:

```bash
git status
```
You should get this:
```
On branch main
Your branch is up to date with 'origin/main'.

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
Second, that the changes are **not** staged for commit, which means that if you make a commit, the changes will not be incorporated to the new version.
```
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
```
To actually stage the file, we can `add` it, as explained in the informative note. So you can run

```bash
git add README.md
```
Running again `git status` now gives:
```
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   README.md
```

The next step is to commit the change. A commit needs a message that describes it. It is common to write an actual action that describes what has been changed, for example:

```bash
git commit -m "Update README file with some details"
```
A final `git status` will give you that your branch is ahead from origin (means Github) by one commit. Apart from that, everything is clean. Note the message:
```
  (use "git push" to publish your local commits)
```
Everything is easy when you read the messages. Let's push the changes from your local repository in your computer to the `origin` repository in Github. We will be more specific and define where to push (`origin`) and which branch (main) and use the command

```bash
git push origin main
```

If you go back to the Github repository you should see that the file has been modified. You can also check the commits, when it happened and who did it.

### Change several files in one go

We want to make a series of changes and create new files, but all these will be a "single update" of the repository. The idea is to make as many changes as we want, stage them (with `git add <files>`), make a single commit (with `git commit -m "text"`) and push all the changes in one go (with `git push origin main`).

I will create a file called `requirements.txt` and edit it with some text editor. And then follow the sequence:

```bash
git add .
git commit -m "Add requirements files"
git push origin main
```
Now, in the Github page we can see that the changes are immediately included. We can see and navigate the files. We can also go to the commits list and see all the changes applied to the files in the repository.

Back to the terminal, we can also have a list of all the commits and when were they recorded. You have the basic `log` command, although there are different ways to show them, for example

```bash
git log
git log --pretty=oneline
```

Now we are going to show again the full process by adding a new file:

```bash
curl http://skyserver.sdss.org/dr14/en/tools/places/messier.csv > messier.csv
git add messier.csv
git commit -m "Include file with messier objects"
git push origin main
```

### Time travel

To retrieve past versions of the files you can use the `checkout` git command. First use `git log` to find out the hash code for each commit, and select the version you want to restore. Then:

```bash
git log
git checkout 9ef93d5
```
The files in your directory will automatically show the same files and contents that you had at that time. To go back to the latest version:
```bash
git checkout main
```

### Comparing versions
You don't need to checkout the whole repository to a previous commit just to check how a file has changed. You can simply use `diff` to show the differences of a file between two commits, for example:
```bash
git diff 9ef93d5 a2f8140
```

## Work in parallel with branches

When you have a repository with all your contents, it is a good practice that you leave that `main` branch as it is and you work in new content in a parallel branch without disturbing the main content. That allows you to make different tests, leave a development that take several days paused, etc. To work in a different branch we create it with the same command `checkout`, but note the `-b` to create the new branch:

```bash
git checkout -b plot_messier
```
Now you will work in a parallel universe, and none of the files in the `main` branch will be modified. You can check what branch are you on with `git branch`. Now you can make your changes as normal, add new files and modify them.

```bash
git add .
git commit -m "Describe new changes"
```
When uploading the changes to Github, note that you need to explicitly say which branch to upload.

```bash
git push origin plot_messier
```
You can always go back to the main branch (or any other branches) with `git checkout main`.

When you are happy with the contents of your new branch, you can merge it with the main branch from Github. You need to create a Pull Request in the web. There, you will be able to choose which branch should be merge with which other branch. When working with collaborators, it is a good idea that someone else verifies that the changes in the branch are good and clear. Once you are happy, you can Accept the Pull Request. From this point all the changes (commits) will be part of the `main` branch.

Remember to use `git pull` in your terminal to update your local copy of the repository with the new changes (from you or from your collaborators) that are in Github.





