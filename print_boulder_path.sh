{  printf "Original transfer location on Boulder petalibrary: " ; pwd ; printf "Folder Contents:\n "
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'; } > Boulder_path.txt
