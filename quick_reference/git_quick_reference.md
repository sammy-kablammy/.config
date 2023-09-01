# GIT QUICK REFERENCE

explanations of common git commands because they are named terribly

# git checkout
don't use this command
it was split into 'switch' and 'restore'

## git branch
list branches that currently exist
git branch

create a branch with the given name:
git branch <name>
alternatively,
git branch -c <name>

delete a branch that already exists
git branch -d <name>

# git switch
switch to a branch that already exists
git switch <name>

## git restore
revert files to the previous commit
git restore <file1> <file2> <file3>

unstage changes for files
git restore --staged <file1> <file2> <file3>

revert file to a specific commit (you'll need the desired commit's hash)
git restore <hash> <file>

revert file to specific branch
git restore <branch name> <file>
