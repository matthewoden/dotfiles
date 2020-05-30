npm_ig(){
    exec env ASDF_SKIP_RESHIM=1 npm i -g $@ && asdf reshim nodejs
}
