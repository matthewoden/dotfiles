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

Then run the playbook!

``` bash
ansible-playbook -i "./inventory" "./main.yml"  --tags="all"
```

Or, just with the binfile, passing in $tags.

``` bash
/bin/bootstrap rust #install rust.
```


Roles TODO:

- [x] xcode
- [x] homebrew
    - [x] brew
    - [x] cask
    - [x] mas
- [x] tmux
    - [x] tmux-vim-navigator
    - [x] tmux-jump
    - [x] tmux-session
- [] git
- [] neovim 
    - [x] omni-vim
    - [x] tmux-vim-navigator
- [x] alacritty
    - [x] .alacritty.conf
- [x] asdf-vm
- [x] elixir
- [x] erlang
- [x] lua
- [x] fennel
- [x] node
- [x] rust
- [] go  
- [x] shell
    - [x] bash_profile
    - [x] bashrc
    - [x] bash_projects
    - [x] theming 

