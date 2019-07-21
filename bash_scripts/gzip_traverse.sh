# go through current folder and all subfolders, find .nii and .img files and zip them
find . -type f \( -name "*.nii" -or -name "*.img" \) -exec gzip "{}" \;

