# load bash projects
LOAD_DIRECTORY = "~/.bash_projects/*"

for f in $LOAD_DIRECTORY; do
   . $f
done
