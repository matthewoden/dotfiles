# Settings

A collection of settings used across machines. 

Converting a small number of dotfiles to an ansible playbook of settings and plugins.

## Install Ansible

Ansible can be installed with pip, the Python package manager. If pip isn’t already available on your system of Python, run the following commands to install it:

```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
```

Then install Ansible:

```
pip install --user ansible

```

Then run the playbook!
```
ansible-playbook -i "./inventory" "./main.yml"  --tags="all"
```

TODO:

- [x] homebrew
    - [x] brewfile
- [] tmux
    - [] omni-tmux
    - [] tmux-vim-navigator
    - [] git integration
- [] neovim
    - [] omni-vim
    - [] tmux-vim-navigator
- [] alacritty
    - [] .alacritty.conf
- [] asdf
    - [] elixir
    - [] erlang
    - [] node
- [] bash_profile
    - [] bashrc
    - [] PS1 Prompt

