@ECHO OFF

REM Run this script from the project root, and only when the conda environment is activated.
REM Compiles the program (assuming entry point is main.py) to "dist\\<project_name>"

set /p project_name=<.\\project_name.txt
REM site_packages for activated conda environment
REM set site_packages=%CONDA_PREFIX%\Lib\site-packages

REM Compile into "build" folder
if exist build rmdir build /s /q
python -m nuitka --standalone --output-dir build --include-data-file=src/resources/*=resources/ src/main.py

REM Rename executable and move distribution to 'dist' folder
rename "build\\main.dist\\main.exe" "%project_name%.exe"
if exist dist rmdir dist /s /q
mkdir dist
move "build\\main.dist" "dist\\%project_name%"
rmdir "build" /s /q
