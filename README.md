# INTRODUCTION
This repository contains a set of configuration files offering useful defaults 
and functions for **zsh**, **bash**, **screen**, and **gvim**.  
They are written entirely to my taste and you should
customize them according to your preferences.

# FEATURES
bash
* aliases for common UNIX commands and functions
* shell prompt that interacts with `screen`

zsh
* oh-my-zsh base configuration
* custom prompt with exit code, elapsed time, and git branch

screen
* display compact pathname in tagline for easy orientation

vim/gvim
* some Windows-like behavior (without obliterating vim functionality)
* other useful key mappings
* relative numbering
* two-space tabbing
* useful plugins (pathogen, NERDTree, NERDCommenter)

# INSTALLATION
Decide how you want to organize dotfiles from other people. For example, I put
mine in ~/dotfiles/\<userid\> to keep them straight. With that in mind, you
would type:

```sh
git clone https://github.com/teadotjay/dotfiles.git ~/dotfiles/teadotjay
cd ~/dotfiles/teadotjay && git submodule update --init
```

If you get a "git" error, try replacing `git` with `/usr/bin/git` above.

From that point, you can cherry-pick my settings or replace your dotfiles with
links to mine using deploy.sh. (Don't worry, deploy.sh makes a backup.)

```sh
cd ~/dotfiles/teadotjay && ./deploy.sh
```
