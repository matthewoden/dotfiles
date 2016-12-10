# requires mkcd
nugit() {
  mkcd $1 && # make directory
  echo ".DS_Store" >> .gitignore # basic ignore
  echo "# $1" >> ./README.md # pipe the directory name in to the readme title
  git init && # create the repo
  git status # show user the results.
}
