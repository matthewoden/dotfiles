# Settings

A collection of dotfiles, scripts, settings used across mac machines, all kept and maintained as an ansible playbook.


## Requirements

Python 3, and ansible.

### Install Ansible


### With pip

Ansible can be installed with pip, the Python package manager. If pip isn’t already available on your system of Python, run the following commands to install it:

``` bash
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
```

Then install Ansible:

``` bash
pip install --user ansible

```

### With homebrew

Homebrew installs ansible, yet this playbook handles installing homebrew! So that's a fun chicken and egg problem.

So homebrew isn't already on your machine - live dangerously and excecute a remote shell script:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Then install ansible:
```
brew install ansible
```

This should also install a compatible version of python3. 

## Usage

You can run the full playbook with the following command:

``` bash
ansible-playbook -i "./inventory" "./main.yml"  --ask-become-pass --tags="all"
```

Or just with the binfile, passing in `$tags.` Without any tag values, all roles will be run.

``` bash
/bin/bootstrap rust #install rust
```


## Included Configuration

### Hardware

- trackpad
- keyboard

### UI
- expanded print/save dialogs
- dark mode
- highlight colors
- system animations
- screenshot formats
- hidden files
- dock icons

### Shell

- profile/bashrc
- per-project-config
- theming

### Fonts

- Powerline Modified SF Mono 

### Languages

- elixir
- elm
- erlang
- fennel
- go
- lua
- node
- python3
- rust

### Applications 

- 1Password
- Alacritty Terminal
- Balena Etcher
- Brave Browser
- Encrypto
- Docker
- Dash
- Insomnia Rest Client
- Kaleidoscope
- Pixelmator
- Postgres
- Quiver Notes 
- Spotify
- Sqlitestudio
- Slack
- The Unarchiver
- Timelime

### Packages and Command Line Tools

- asdf
- autoconf
- bash-completion
- bash-git-prompt
- cloudfoundry cli
- coreutils
- docker-compose
- fzf
- fzy # TODO - consolidate usage to just fzy.
- git-lfs
- git
    - global gitignore
    - gitconfig
- gnu-tar
- gpg
- jq
- heroku toolbelt
- kubectl
- neovim
    - init.vim / plugins
    - tmux integration
- ripgrep
- terraform
- terraform-inventory
- terraform-provisioner-ansible
- tmux
    - tmux.conf, plugins
    - tmux-jumper/tmux-session
- vault
- wxmac


# TODO

- Chrome / Brave Extensions
- key bindings
    - capslock as escape
    - fn + hjkl for navigation
    - fn + w/W/b/B for word navigation?
