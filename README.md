# setup-macos
An ansible playbook to setup macos for developers. Please follow the below instructions to setup your mac for development.

## Requirements
For macos 11 Big Sur or later.

## Setting up pre-requisites

* Make sure you are on macos 11 Big Sur or later. A clean install is preferred.

* Install the macos Command-line tools:
  ```
  xcode-select --install
  ```

* If you need Xcode, please login to your apple account in AppStore and download/install Xcode. Then, set the command-line tools directory to point to Xcode:
  ```
  sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
  ```

* Install homebrew:
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

* Install ansible:
  ```
  brew install ansible
  ```

* Clone this repo:
  ```
  cd ~
  git clone https://github.com/chaudhryjunaid/setup-macos.git
  ```

## Running brew installs
* If you have not already from some earlier setup repo or manual process installed common applications, please run the following brew scripts to install common applications on your mac:
  ```
    cd ~/setup-macos
    zsh ./brew/brew.sh # install basic apps
    zsh ./brew/opt-brew.sh # install optional/additional apps
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
      time ansible-playbook macos-setup.yml --verbose --tags "homebrew,zsh,dotfiles,folders,nodejs"
  ```
* Following tags are supported:
  * homebrew
  * zsh
  * dotfiles
  * vim
  * osx
  * iterm
  * folders
  * ssh
  * nodejs

## Additional manual configuration required

* If you use vim, you will need to execute the following commands at the command-line:
  ```
  vim +PlugInstall +qall
  vim '+PlugClean!' +qall
  ```

* Additionally, you will need to set your terminal font (or just the non-ascii font for iTerm) to a powerline font for vim to display special characters nicely. This repo installs the fonts in macos. You will just need to select it from your terminal's preferences.

