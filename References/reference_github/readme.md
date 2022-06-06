### Github

## General Notes

files in order to appear on github as wiki needs to be saved as **readme.md**


## Troubleshooting
`! [rejected]    main -> main (fetch first)
error: failed to push some refs to {my github repo}
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.`

This was caused once when I removed a file directly from github on the website instead of from one of my local repos

use this command to see what main you're in at the repo

`git fetch origin`

which will display something like this and tell you what to enter for the next command

`{series of numbers and letters} main         -> origin/main`

then enter referencing what's after ->

`git diff HEAD...origin/main`

This will show the differences in the repo and your local repos

I did a `git pull` from the whole remote repo to the local repo. While not ideal due to this message it did resolve the problem. Will need to look into a cleaner solution later.
`hint: Pulling without specifying how to reconcile divergent branches is
hint: discouraged. You can squelch this message by running one of the following
hint: commands sometime before your next pull:
hint:
hint:   git config pull.rebase false  # merge (the default strategy)
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint:
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.`
