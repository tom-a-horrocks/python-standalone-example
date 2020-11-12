ECHO OFF

REM This script increments versions and checks environments, updates git,
REM builds the software, and places the distributable into a zip
REM in dist\\<project-name>-<version-tag>.zip

set /p project_name=<.\\project_name.txt

ECHO This script assumes that everything needed to make the code work has been
ECHO committed. It will also make a new commit with the updated version number
ECHO (and possible conda environment).
ECHO It also assumes the build will work -- so test this before executing this!
ECHO If this is not agreeable, exit now and commit/build your code!

setlocal
:PROMPT
SET /P proceed=Would you like to proceed (Y/[N])?
IF /I "%proceed%" NEQ "Y" GOTO END

REM Update environment requirements
CALL scripts\\export-conda-environment.cmd
git add environment.yml

REM Increment version identifier
CALL scripts\\helpers\\increment-version.cmd
git add src\\resources\\version.txt

REM Commit pre-build changes and tag
set /p version_number=<src\\resources\\version.txt
git commit -m "Increment version to %version_number%"
CALL scripts\\helpers\\tag-version.cmd

REM Compile
CALL scripts\\compile.cmd

REM Zip up built code, ready to distribute.
CALL scripts\\zip-distributable.cmd

:END
endlocal
