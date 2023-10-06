# GIT QUICK REFERENCE

explanations of common git commands because they are named terribly.
i'm considering restructuring this file to be based on use case instead of command

# misc tips
see a more compact git log:
* git log --oneline
you can also give `git log` a filename and it will show changes relating to that
file.
see more fun stuff
* git log --all --graph --decorate --oneline
to view in vim, do this (don't forget the - at the end)
* git log | vim -R -
to see all the files currently being tracked by git
* git ls-tree -r main --name-only

# HEAD
HEAD is the name of the currently checked out commit.
HEAD^ refers to the parent of HEAD. HEAD^^ is the grandparent, etc.
HEAD~n is the nth parent of HEAD.

# git rm
don't use this command
it just seems to cause problems.
use 'git add' and 'git restore' instead
(if you're looking to remove a file from git's tracking, then try rm --cached)

# git checkout
don't use this command
it was split into 'switch' and 'restore'

actually maybe do use. you can do
* git checkout <commit hash>
to look at a previous commit.
think "hey check this out" instead of "checking out of a store"

to move the current branch to some other commit, use
* git checkout --hard <commit hash>

## git branch
list branches that currently exist
* git branch

create a branch with the given name:
* git branch <name>

delete a branch that already exists
* git branch -d <name>

# git switch
switch to a branch that already exists
* git switch <name>

create a branch and then switch to it (this is just so you don't have to git branch beforehand)
* git switch -c <name>
* git switch --create <name>

# git revert
undo a commit. it'll stay in the history but its effects will be undone.
basically, make a new commit that happens to precisely undo the previous one.

## git restore
revert files to the previous commit
* git restore <file1> <file2> <file3>

unstage changes for files
* git restore --staged <file1> <file2> <file3>

revert file to a specific commit
* git restore <file> -s <commit hash>

# git add
stage all changes in the given file
* git add <file>

stage some changes in the given file (it will open the file and prompt you for each change)
note: when in the -p menu, type '?' to see what all the options mean
* git add --interactive <file>
* git add -i <file>
while in the interactive mode, here are some of the less obvious options:
* status: shows a message similar to git status. you can see staged and unstaged changes.
* update: effectively "git adds" a file. just adds all the changes. (citation needed)
* patch: enter the patching screen. remember to use 's' once in there.

rather than entering the full interactive mode, you can jump straight into patching:
* git add -p <file>
* git add --patch <file>
when patching, remember to use the 's' option to split hunks into smaller changes.

note: 'git commit --interactive' also exists.

# git reset
this command is basically like `git checkout` but instead of just peeping an
older commit, it will move the current branch pointer with you.

# branches and stuff
once you have created a new local branch and want to push it to a remote branch,
do
* git push origin new_feature
if you want to set it so that future pushes don't need to specify the remote
branch, you can do
* git push -u origin my_feature
from that point on, you can just 'git push' and it will remember.
this is a per-branch setting, so your local 'main' branch will still push to the
remote 'main' branch, for example

# git stash
to drop everything you're currently working on and go back to the previous commit,
you'll want to use git stash.

it seems that 'git stash' is equivalent to 'git stash push' in general

when you want to get stashed changes back...
* git stash pop

see stashes available
* git stash list

sometimes, stashed changes just kinda linger. i think it's when merge conflicts occur.
anyways, to remove stashed changes from the stash list, use
* git stash drop <index>
where <index> is the number of the item in the stash list you want to remove

# git merge
to merge the branch "newfeature" into "main," checkout main and do this:
* git merge newfeature
when you merge, a .orig file may be created. this is just a backup in case
something goes wrong while merging. delete this once you merge successfully.

# rebase
use `git rebase -i` to open interactive mode
from there, you swap the lines around until you are satisfied with the order

# bisect
start with `git bisect start`
then do `git bisect bad` on a bad commit or `git bisect good` on a good commit
...hooray, you've found the bad change
