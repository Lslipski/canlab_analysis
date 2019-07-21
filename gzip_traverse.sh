find . -type f \( -name "*.nii" -or -name "*.img" \) -exec gzip "{}" \;

