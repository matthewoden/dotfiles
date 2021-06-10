npm_ig(){
    exec env ASDF_SKIP_RESHIM=1 npm i -g $@ && asdf reshim nodejs
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/mopott/.asdf/installs/nodejs/12.17.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/mopott/.asdf/installs/nodejs/12.17.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/mopott/.asdf/installs/nodejs/12.17.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/mopott/.asdf/installs/nodejs/12.17.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/mopott/.asdf/installs/nodejs/12.17.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/mopott/.asdf/installs/nodejs/12.17.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
