# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"

# let's just use bashrc, and keep consistent.
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# >>> JVM installed by coursier >>>
export JAVA_HOME="/Users/matthewpotter/Library/Caches/Coursier/jvm/adopt@1.8.0-292/Contents/Home"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
export PATH="$PATH:/Users/matthewpotter/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/matthewpotter/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
