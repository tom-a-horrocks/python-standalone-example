@ECHO OFF
REM Run this script from the project root, and only when the conda environment is activated.

set /p version_number=<src\\resources\\version.txt

:ask
echo Your current version is %version_number%
echo Is the new version a (1) major, (2) minor, or (3) patch increment?
set INPUT=
set /P INPUT=Type input (1, 2, or 3): %=%
If /I "%INPUT%"=="1" goto major
If /I "%INPUT%"=="2" goto minor
If /I "%INPUT%"=="3" goto patch
echo Incorrect input & goto ask
:major
python scripts\\helpers\\increment-version-file.py major
goto end
:minor
python scripts\\helpers\\increment-version-file.py minor
goto end
:patch
python scripts\\helpers\\increment-version-file.py patch
goto end
:end