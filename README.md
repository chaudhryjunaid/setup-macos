# setup-macos
Some shell scripts and an ansible playbook to setup macos for developers. For setting up a new system, please see the README at  [https://github.com/chaudhryjunaid/setup-apple-silicon-mac].

## Requirements
For macos 13 Ventura or later.

## Setting up pre-requisites

* Install ansible:
  ```
  brew install ansible
  ```

* Clone this repo:
  ```
  cd ~
  git clone https://github.com/chaudhryjunaid/setup-macos.git
  ```

## Running the playbook

* For a fresh machine, run the complete playbook:
  ```
      cd ~/setup-macos
      time ansible-playbook macos-setup.yml -v
  ```
  The playbook will ask for sudo password and prompt for other information as well in some roles. Please keep an eye on the progress to see if any input is required.

* If you already have a setup and want to execute/reset only part of the configuration done by this repo, please use the `--tags` or `--skip-tags` options:
  ```
      cd setup-macos
      time ansible-playbook macos-setup.yml --verbose --tags "zsh,dotfiles,nodejs"
  ```
* Following tags are supported:
  * zsh
  * dotfiles
  * vim
  * osx
  * iterm
  * ssh
  * nodejs

## Additional manual configuration required
* Please continue with your apple silicon setup in [https://github.com/chaudhryjunaid/setup-apple-silicon-mac] if you came from there. Otherwise, please continue with the next step.
* If you use vim, you will need to execute the following commands at the command-line:
  ```
  vim +PlugInstall +qall
  vim '+PlugClean!' +qall
  ```
  
