# my dotfiles


## installation

first to stop recursion issues in your directory
```
echo ".cfg" >> .gitignore
```

now clone your dotfiles

```
HTTP:
git clone --bare https://github.com/ethanmoss1/dotfiles $HOME/.cfg


SSH:
git clone --bare git@github.com:ethanmoss1/dotfiles.git $HOME/.cfg
```


add alias to current shell scope
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

checkout the actual content
```
config checkout
```

make sure to hide untracked files
```
dotfiles config --local status.showUntrackedFiles no
```

### Commands
```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

### Overwritten
if you get error along the lines of what is below it is because you already have files in your home dir that are in the repo.
```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
if you care about them you can back them up with the following command
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}`
rerun `config checkout
```

