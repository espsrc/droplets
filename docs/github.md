# Taking your research online

You have received an e-mail from a good colleague.


!!! note "email"
    Hi again!

    Thanks a lot for sending me the notebook you prepared, but actually I cannot open it. How can I do that? Also, I will be travelling during the following days, if you could send me something I can explore from my mobile phone, that would be great!

    Cheers,

    Galileo    


We need to compile all our results and send them in a format that helps
understanding the process and the results of our analysis. One common approach
is to describe all the details in the body of the e-mail and send different
figures as attachments. This is a poor approach that complicate visualization,
makes it difficult to connect description and figures, and that probably will
miss details on how the results were obtained. Alternatively we can generate a
document with the content that we can then convert to pdf so it is easy to send
and be opened by anyone. However, using a Jupyter notebook has several
advantatges:

- It is easy to export as pdf or html, and can be visualized in nearly any platform.
- It naturally contains the results and the logic followed to obtain them, as already seen in the previous [chapter](docs/jupyter)
- It is immediate to generate them if an update is needed.
- It explicitly show the full process used at each step.

<h3>Objectives and scope</h3>

In this section we will show how to use Github to share results with the community or your colleagues. You will be able to share code, text documents, figures or notebooks, which can be rendered automatically.




# How Github works

## Code, history, issues

...
...

### What is GitHub 
[origin](https://guides.github.com/activities/hello-world/)

GitHub is a code hosting platform for version control and collaboration. It lets you and others work together on projects from anywhere.

### Why this is useful
 [origin](https://the-turing-way.netlify.com/collaborating_github/collaborating_github.html#why-this-is-useful)

Developing your project or analysis collaboratively on GitHub or GitLab
provides a prompter to document your work in detail and it provides a great
opportunity to get additional contributors to your idea. Contributions can be
everything from new ideas, to bug reports and actual code contributions.


### README and project communication

[origin](https://the-turing-way.netlify.com/collaborating_github/1/readme_communication.html#readme-and-project-communication)

README files are the welcome mat for your project. They are the first thing new visitors to your project will see and thus are part of a set of really important documents to make potential contributors feel welcome and invite them to get involved. Your README file should cover:

 - What you are doing, for who, and why.
 - What makes your project special and exciting.
 - How to get started.
 - Where to find key resources.

### Roadmapping

[origin](https://the-turing-way.netlify.com/collaborating_github/2/roadmapping.html)

If you plan a larger piece of work, it is very useful to have an outline for the work you need to do and share it with potential contributors. Your roadmap covers your goal and vision and should include a timeline for tasks that need to be completed, thus helping anyone new to your project to develop an understanding of what is currently happening on the project and what’s coming next. A roadmap is also a great tool to highlight dependencies among tasks, helping you to schedule work on them efficiently. Also milestones can be really helpful to get to your main goal. 

If you work on GitHub, you can use [GitHub’s Project board](https://help.github.com/en/github/managing-your-work-on-github/tracking-the-progress-of-your-work-with-project-boards) to manage tasks and issues.


## Hello Word tutorial 

[origin](https://guides.github.com/activities/hello-world/)

Following the steps above you will learn how to:

- Create and use a repository
- Start and manage a new branch
- Make changes to a file and push them to GitHub as commits
- Open and merge a pull request

### Step 1: Create a repository 

A repository is usually used to organize a single project. Repositories can contain folders and files, images, videos, spreadsheets, and data sets – anything your project needs. We recommend including a README, or a file with information about your project. GitHub makes it easy to add one at the same time you create your new repository. It also offers other common options such as a license file.

**To create a new repository**

In the upper right corner, next to your avatar or identicon, click + and then select **New repository**.
Name your repository hello-world.
Write a short description.
Select Initialize this repository with a README.

Click **Create repository**.

### Step 2. Create a Branch

Branching is the way to work on different versions of a repository at one time.

By default your repository has one branch named ```master``` which is considered to be the definitive branch. We use branches to experiment and make edits before committing them to ```master```.

When you create a branch off the ```master``` branch, you’re making a copy, or snapshot, of ```master``` as it was at that point in time. If someone else made changes to the ```master``` branch while you were working on your branch, you could pull in those updates.

This diagram shows:

- The ```master``` branch
- A new branch called ```feature``` (because we’re doing ‘feature work’ on this branch)
- The journey that ```feature``` takes before it’s merged into master

Have you ever saved different versions of a file? Something like:

- ```story.txt```
- ```story-joe-edit.txt```
- ```story-joe-edit-reviewed.txt```
Branches accomplish similar goals in GitHub repositories.

Branches are used for keeping bug fixes and feature work separate from our ```master``` (production) branch. When a change is ready, then you can merge your branch into ```master```.


**To create a new branch**

Go to your new repository ```hello-world```.
Click the drop down at the top of the file list that says **branch: master**.
Type a branch name, ```readme-edits```, into the new branch text box.
Select the blue **Create branch** box or hit “Enter” on your keyboard.

Now you have two branches, ```master``` and ```readme-edits```. They look exactly the same, but not for long! Next we’ll add our changes to the new branch.


### Step 3. Make and commit changes
Bravo! Now, you’re on the code view for your ```readme-edits branch```, which is a copy of ```master```. Let’s make some edits.

On GitHub, saved changes are called **commits**. Each commit has an associated commit message, which is a description explaining why a particular change was made. **Commit** messages capture the history of your changes, so other contributors can understand what you’ve done and why.

**Make and commit changes**

Click the ```README.md``` file.
Click the pencil icon in the upper right corner of the file view to edit.
In the editor, write a bit about yourself.
Write a commit message that describes your changes.
Click **Commit** changes button.

These changes will be made to just the README file on your ```readme-edits``` branch, so now this branch contains content that’s different from ```master```.

### Step 4. Open a Pull Request
Nice edits! Now that you have changes in a branch off of master, you can open a **pull request**.

Pull Requests are the heart of collaboration on GitHub. When you open a **pull request**, you’re proposing your changes and requesting that someone review and pull in your contribution and merge them into their branch. Pull requests show **diffs**, or differences, of the content from both branches. The changes, additions, and subtractions are shown in green and red.

As soon as you make a commit, you can open a pull request and start a discussion, even before the code is finished.

By using GitHub’s [@mention system](https://help.github.com/en/github/writing-on-github/about-writing-and-formatting-on-github#text-formatting-toolbar) in your pull request message, you can ask for feedback from specific people or teams, whether they’re down the hall or 10 time zones away.

You can even open pull requests in your own repository and merge them yourself. It’s a great way to learn the [GitHub flow](https://guides.github.com/introduction/flow/) before working on larger projects.

**Open a Pull Request for changes to the README**

- Click the  **Pull Request** tab, then from the Pull Request page, click the green **New pull request** button.
- In the **Example Comparisons** box, select the branch you made, ```readme-edits```, to compare with master (the original).
- Look over your changes in the **diffs** on the Compare page, make sure they’re what you want to submit.
- When you’re satisfied that these are the changes you want to submit, click the big green **Create Pull Request** button.
- Give your pull request a title and write a brief description of your changes.

When you’re done with your message, click **Create pull** request!

### Step 5. Merge your Pull Request

In this final step, it’s time to bring your changes together – merging your ```readme-edits``` branch into the ```master``` branch.

- Click the green **Merge pull request** button to merge the changes into ```master.
- Click **Confirm merge**.
- Go ahead and delete the branch, since its changes have been incorporated, with the **Delete branch** button in the purple box.


