# requires mkcd
nugit() {
  mkcd $1 &&
  touch .gitignore &&
  touch README.md &&
  echo "# $1" &&
  git init &&
  git status
}
