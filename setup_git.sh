#!/bin/bash

# this makes pull always pull with --rebase
git config --global pull.rebase true

# this makes pull also pull tags
git config --global pull.tags true

# this makes fetch prune stuff as needed each time
git config --global fetch.prune true

# this makes fetch delete local tags that are no longer on the remote
git config --global fetch.pruneTags true

# this makes git push assume you mean the current branch
git config --global push.default current

# this makes push also push any tags pointing to the current tree
git config --global push.followTags true

# this makes git status show all untracked files, not just folders
git config --global status.showUntrackedFiles all

# this makes the interactive rebase format show you the author name to make things easier
git config --global rebase.instructionFormat "[%an] - %s"

# this adds `git pf` as an alias to force pushing (gently)
git config --global alias.pf "push --force-with-lease"

# this sets up my identity
git config --global user.name "Jake Bottrall"
git config --global user.email jakebottrall@gmail.com

# this sets up vim as the default editor
git config --global core.editor vim