
if [ -f "$HOME/.tmuxifier/bin/tmuxifier" ]; then
    export PATH="$HOME/.tmuxifier/bin:$PATH"
    export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
    eval "$(tmuxifier init -)"
fi

tmux_jump() {
    # starting in ~/www..
    BASE="$HOME/www"
    # ... look for directories exactly one level deep (`~/www/project`)
    # and match them with fzf. In this case we break ties by favoring matches
    # on the project name instead of the owner name (implementaion means
    # favoring matches closer to the end of the string.) This is simplified a
    # little bit with the `--select-1 --query="$1"` line: if there's only one
    # match for the argument passed in as the first argument to this function,
    # we select immediately instead of asking for an interactive selection.
    SELECTED=$(find "$BASE" -mindepth 1 -maxdepth 2 -type d | sed "s|$BASE/||g" | fzf --tiebreak=end --select-1 --query="$1")

    # fzf will exit with a non-zero code if you ctrl-c or ctrl-g out of
    # it. We use this as a signal that we don't want to jump after all.
    if [[ "$?" != 0 ]]; then echo "cancelling!"; return 1; fi

    # call tmux-session on the *full* path to the matched project!
    tmux-session "$BASE/$SELECTED"
}


alias t=tmux_jump
