# Settings

A collection of settings used across machines. 

Converting a small number of dotfiles to an ansible playbook of settings and plugins.

## Install Ansible

Ansible can be installed with pip, the Python package manager. If pip isn’t already available on your system of Python, run the following commands to install it:

``` bash
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
```

Then install Ansible:

``` bash
pip install --user ansible

```

or with homebrew (though the playbook will do this for you.)

Install homebrew:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

... then install ansible:
```
brew install ansible
```

## Usage

You can run the playbook with the following command

``` bash
ansible-playbook -i "./inventory" "./main.yml"  --tags="all"
```

Or, just with the binfile, passing in $tags. Without any tag values, all roles will be run.

``` bash
/bin/bootstrap rust #install rust
```


Roles TODO:

- [x] fonts
    - [x Powerline Modified SF Mono 
- [x] xcode
- [x] homebrew
    - [x] brew
    - [x] cask
    - [x] mas
- [x] tmux
    - [x] tmux-vim-navigator
    - [x] tmux-jump
    - [x] tmux-session
- [x] git
    - [x] gitignore
    - [x] gitconfig
- [x] neovim 
    - [x] omni-vim
    - [x] tmux-vim-navigator
    - [x] plugins
    - [x] coc-extensions
- [x] alacritty
    - [x] .alacritty.conf
- [] languages
    - [x] asdf-vm
    - [x] elixir
    - [x] elm  
    - [x] erlang
    - [x] fennel
    - [x] go  
    - [x] lua
    - [x] node
    - [x] rust
- [x] shell
    - [x] bash_profile
    - [x] bashrc
    - [x] bash_projects
    - [x] theming 

