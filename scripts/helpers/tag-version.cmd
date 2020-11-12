set /p version_number=<src\\resources\\version.txt
set version_tag=v%version_number%
git tag -f %version_tag%
