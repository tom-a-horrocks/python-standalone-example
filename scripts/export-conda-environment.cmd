@ECHO OFF

REM Run this script from the project root, and only when the conda environment is activated.
REM Exports project's conda environment to environment.yml, and excludes the conda prefix.
REM Assumes the conda environment name matches <project-name>.

set /p project_name=<.\\project_name.txt

REM Exclude "prefix" as it's not needed for our purposes and is machine-specific.
conda env export -n %project_name% | findstr -v "prefix" > environment.yml