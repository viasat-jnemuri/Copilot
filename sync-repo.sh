# This bash script uses git to sync a local repository with a remote repository.

# Steps: pull changes from remote repository, stage all changes, commit changes, push changes to the 'main' branch of the remote repository.

# Pull changes from remote repository
git pull origin main

# Stage all changes
git add .

# Commit changes using a message 'Update'
git commit -m "Update repo"

# Push changes to the 'main' branch of the remote repository
git push origin main
