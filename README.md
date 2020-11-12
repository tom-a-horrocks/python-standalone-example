# Python Template
In Python, scripting is fun! However, writing a compiled, versioned, stand-alone Python application for Windows is not. This template helps with the latter, assuming you're happy with Nuitka for compilation, conda for environment management, and git for version control. Everything is glued together through the magic of *shudders* batch scripts. 

## Software Prerequisites
* Nuitka requires MinGW64 from https://sourceforge.net/projects/mingw-w64/files/mingw-w64/. Use the following options:
    * Architecture: x86_64 (must match Python).
    * Threads: posix (enables C++11/C11 multi-threading features at the cost of requiring an extra DLL in executable; see https://stackoverflow.com/questions/17242516/mingw-w64-threads-posix-vs-win32).
    * Install path: `C:\MinGW64`.
* Anaconda or miniconda.
* Git.

## Set-up
* After downloading the template, edit `project_name.txt` to contain your project's name. This will be the name of the compiled executable, the folder containing it, and your conda environment.
* Create a new conda environment with the name matching `project_name.txt`.
* `pip install semantic-version` (within activated conda environment).
* `conda install -c conda-forge nuitka` (within activated conda environment).
* Delete `.git` and create a new repository (`git init`).

## Usage
Your program's entry point is `src/main.py`. Any files you place in the `resources` folder will be available in both the scripted and compiled versions of your program; see how `main.py` reads `resources/version.txt`.

Use the scripts to compile your code and manage its version, although you're always free to edit `resources/version.txt` manually. All scripts must be called from the root directory (NOT the scripts directory) with the anaconda environment enabled.
* `export-conda-environment.cmd`: Exports the conda environment to <project-name>.yml (includes pip requirements).
* `compile.cmd`: Compiles `src/main.py` to `dist/<project-name>`, copying over the resources folder in the process.
* `zip-distributable.cmd`: Creates a zipped archive of the compiled code with filename `<project-name>-v<version-number>.zip`. The version number is obtained from `resources/version.txt`.
* `make_release.cmd`: A combination of the above scripts; run this when you're ready to release a new version. Does the following:
	* increments the version number
	* updates the conda requirements
	* git tags the release (includes incremented version number and updated conda requirements)
	* compiles the code
	* zips the build into an archive with versioned filename 

Remember to push your tags!
