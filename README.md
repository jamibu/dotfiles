# dotfiles
Various config files. Managed use stow.
- zshrc
- tmux
- Neovim
- Alacritty
- Picom
- Qtile

Stow will create symlinks for all of the files in this repo. When doing this it 
preserves the mirrors the structure of this repo into the home directory. 
Therefore anything in `.config` will be symlinked into the `.config` folder, 
anything in the root of this repo will be symlinked into `home` directory etc 
etc.

## How to setup
First install [Stow](https://www.gnu.org/software/stow/) e.g. on Arch (btw)
```
sudo pacman -S stow
```

Clone this repo into your home directory then enter the folder
```
cd ~/dotfiles
```

You can test to see what stow is going to do using the `-n` and `-v` flags.
 - `n` Simulate the command i.e. don't actually execute any actions
 - `v` Verbose, prints out stow is doing (or in this case what it would do
 if the `-n` flag wasn't included).
```
stow -n -v .
```

If you are happy with that you can run stow for real to create the symlinks
```
stow .
```

## Ignore certain files
You can use .stow-local-ignore to ignore any files you don't want. This
overwrites the default so you will want to add these back. Things like `.git`
and `README.md` are ignored by default

## What if I have existing symlinks?
Stow will not overwrite any symlinks that it does not own. If you have config
that is symlinked from somewhere else you will need to remove these symlinks
to get stow to work.

## What if I have existing config (non-symlinked)?
You can take over an existing file/folder using the `--adopt` flag. E.g. to 
add a `.bashrc` we would create the file in our dotfiles (it can be empty).
Then run stow with adopt to move the existing `.bashrc` to our dotfiles and 
create a symlink to the newly moved file.
```
touch ~/dotfiles/.bashrc
stow --adopt .bashrc
```
__NOTE:__ Doing this overwrites the `.bashrc` in dotfiles with the existing
file.

## Resources
Use of Stow inspired by this video: https://youtu.be/y6XCebnB9gs?si=JEWNVDVIBQKSFjK_
