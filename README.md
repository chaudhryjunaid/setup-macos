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
