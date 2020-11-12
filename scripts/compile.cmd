@ECHO OFF

REM Run this script from the project root, and only when the conda environment is activated.
REM Compiles the program (assuming entry point is main.py) to "dist\\<project_name>"

set /p project_name=<.\\project_name.txt

REM Compile into "build" folder
if exist build rmdir build /s /q
python -m nuitka --standalone --mingw64 --follow-imports --output-dir build src/main.py

REM Copy in resources folder, including hidden folders
mkdir "build\\main.dist\\resources"
xcopy "src\\resources" "build\\main.dist\\resources" /S /E /H

REM Rename executable and move distribution to 'dist' folder
rename "build\\main.dist\\main.exe" "%project_name%.exe"
if exist dist rmdir dist /s /q
mkdir dist
move "build\\main.dist" "dist\\%project_name%"
rmdir "build" /s /q
