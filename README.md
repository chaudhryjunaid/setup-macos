# setup-macos
Some shell scripts and an ansible playbook to setup macos for developers. For setting up a new system, please see the README at  [https://github.com/chaudhryjunaid/setup-apple-silicon-mac].

## Requirements
For macos 13 Ventura or later.

## Setting up pre-requisites
* Ensure you have ssh keys created and the public key uploaded to github

* Install ansible:
  ```
  brew install ansible
  ```

* Clone this repo:
  ```
  cd ~
  git clone git@github.com:chaudhryjunaid/setup-macos.git
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
      time ansible-playbook macos-setup.yml --verbose --tags "dotfiles,zsh"
  ```
* Following tags are supported:
  * dotfiles
  * zsh
  * osx
  * nodejs

## Additional manual configuration required
* Please continue with next steps in setup at [https://github.com/chaudhryjunaid/setup-apple-silicon-mac] if you came from there.
