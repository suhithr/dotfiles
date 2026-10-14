# Dotfiles

This is for easy setup and portability of my most commonly used dotfiles across new machines.
From a highly customized shell terminal zsh (archived) I've switched to fish.

Running `minimal_install.sh` on Mac or Linux will

1. (On Mac) Install homebrew and the fish shell, and make fish the default shell
2. Link my configs to the home directory (existing files are backed up with a timestamp).
  a. config.fish
  b. .vimrc
  c. .gitconfig
  d. vscode keybindings & settings, for VS Code / Cursor / Antigravity if installed (only on Mac currently since that's where I write code).

It's safe to re-run. It needs your password for sudo (Homebrew, `/etc/shells`) and `chsh`,
so run it from a real terminal:

```
git clone https://github.com/suhithr/dotfiles.git ~/code/dotfiles
~/code/dotfiles/minimal_install.sh
```
