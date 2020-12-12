# setup-macos
An ansible playbook to setup macOS for developers

## How to run
To setup pre-reqs and download the repo:
```
  curl https://raw.githubusercontent.com/chaudhryjunaid/setup-macos/main/pre-setup.sh | bash
```

Then, to run the complete playbook:
```
    cd ~/setup-macos
    time ansible-playbook macos-setup.yml --verbose
```

Or to run only a specifc task:
```
    cd ~/setup-macos
    time ansible-playbook macos-setup.yml --verbose --tags "homebrew,zsh,dotfiles,folders,nodejs"
```
## Additional manual configuration required
If you use vim, you will need to execute the following commands at the command-line:
```
vim +PlugInstall +qall
vim '+PlugClean!' +qall
```
Additionally, if you do not use iTerm, you will need to set your terminal font to a powerline font for vim to display special characters nicely. For iTerm this is done automatically via the ansible tag iterm..

