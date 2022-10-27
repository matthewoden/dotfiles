# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
# if not running interactively, return.
[[ $- != *i* ]] && return

# add completion when available
# shellcheck disable=SC1091
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less                           # use less for everything

# default to using colors.
alias ls='ls -G'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

# completion in case bash_completion isn't working/available
complete -cf sudo

### k8s context
__kube_ps1()
{
    # Get current context
    CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")

    if [ -n "$CONTEXT" ]; then
        echo "${CONTEXT}"
    fi
}

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    # config
    __GIT_PROMPT_DIR=/usr/local/opt/bash-git-prompt/share
    # be pretty everywhere.
    GIT_PROMPT_ONLY_IN_REPO=0
    # perfomance for large git repos/changes
    GIT_PROMPT_SHOW_UNTRACKED_FILES=no

    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
    source "/usr/local/opt/bash-git-prompt/share/prompt-colors.sh"

    function prompt_callback() {
      echo -n " (${Yellow}$(__kube_ps1)${ResetColor}) \n"
    }
    # theme overrides
    GIT_PROMPT_START_USER="\n${Cyan}\#. ${Magenta}\A${White} - \u${Blue}@\h${ResetColor} in ${Green}\w${ResetColor}"
    GIT_PROMPT_START_ROOT="${Magenta}\u${ResetColor} in ${Green}\w${ResetColor}\n"
    GIT_PROMPT_PREFIX="["
    GIT_PROMPT_SUFFIX="] "
    GIT_PROMPT_LEADING_SPACE=0
    GIT_PROMPT_END_USER="${White}${ResetColor}$ "
    GIT_PROMPT_END_ROOT="${White}${ResetColor}# "
fi


# The number of trailing directory components to retain when adding
# the directory names to the prompt -- trailing directories are
# marked with an `...` ellipsis.
export PROMPT_DIRTRIM=3

# Don't check mail when opening terminal.
unset MAILCHECK

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# expand aliases when completing
shopt -s expand_aliases

# Enable history appending instead of overwriting.
shopt -s histappend

# # ex - archive extractor
# # usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# load individual bash projects, skip .bak
for filename in ~/.bash_projects/*; do
    if [[ $filename =~ \.bash$ ]]; then
        # shellcheck source=/dev/null
        . "$filename"
    fi
done

# doom emacs
export EDITOR="code -w"

export HISTTIMEFORMAT='%F %T '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/matthewpotter/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"
