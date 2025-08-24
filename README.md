# setup-macos
This repo contains brew scripts, an ansible playbook and a README.md guide to setup and configure software and developer tools on a new apple silicon mac.

## Requirements
For macos 13.6 Sequoia or later.

## Before you setup
- Make sure you have a stable and fast internet connection. Setting up a new machine requires lots of downloads.
- Please run one step at a time and allow it to succeed before starting next steps.

## Initial steps
- Setup your user account and log into your Apple account during initial system setup.
- Update your macOS to the latest version available first thing as a best practice
- Login to github and open the readme in this repo: [https://github.com/chaudhryjunaid/setup-macos](https://github.com/chaudhryjunaid/setup-macos/edit/main/README.md) on Safari to follow the rest of these steps.
- Generate your SSH key by following [Github's instructions](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) and upload to [github keys page](https://github.com/settings/keys) after logging into github on Safari.
- Install XCode command line tools
  ```
  xcode-select --install
  ```
- Install Homebrew using the command from https://brew.sh:
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

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

## Install apps
- Open Terminal.app and execute:
  ```
  which brew
  # if brew is not detected and you are on apple silicon
  eval $(/opt/homebrew/bin/brew shellenv); 
  ```
- Comment/uncomment packages from brew files in brew/ folder
- Execute the following commands to run the configured installs:
  ```
  cd setup-macos/brew
  ./install.sh
  ```

## Auto-configure the system
- Run the macos-playbook.yml:
  ```
  cd setup-macos
  time ansible-playbook macos-setup.yml -v
  ```
  This playbook will prompt you for your name and email and your preferred command line editor during its execution so that it may configure the system appropriately. Please keep an eye on the run for these prompts.

## Additional manual configuration
- Turn on settings sync for your preferred editor and signin with github or the relevant account to enable sync
- Select nerd fonts for editors, terminals, and more
- Restart all your terminals to activate oh-my-zsh and other goodies.

## Manually Running the playbook
* If you already have a setup and want to execute/reset only part of the configuration done by this repo, please use the `--tags` or `--skip-tags` options:
  ```
      cd setup-macos
      time ansible-playbook macos-setup.yml --verbose --tags "dotfiles,zsh"
  ```
* Following tags are supported:
  * dotfiles
  * zsh
  * osx
