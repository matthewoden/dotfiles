mkcd() {
  mkdir -p $1 &&   # make directory ($1) only if it doesn't exist. (--) end of parameters.
  cd $1 # change directory to ($1).
}
