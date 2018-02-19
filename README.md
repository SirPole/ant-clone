# ant-clone
Command to automatically clone repository by it's name

[![ANT studio](https://www.brychta.name/antstudio.png)](https://www.antstudio.cz/)


&nbsp; 

## Installation
1. Clone this repository
2. Add path to cloned directory to your PATH.
	- **Unix** - Edit either `/etc/environment` or `~/.bash_profile`.
	- **Windows** - Follow [this tutorial](https://www.howtogeek.com/118594/how-to-edit-your-system-path-for-easy-command-line-access/)
3. Add `PROJECTS_PATH` environment variable. It should lead to directory, that contains all your projects (eg. `/var/www` or `C:\xampp\htdocs`)
	- **Unix** - Edit `~/.bash_profile` file, add `export PROJECTS_PATH=<your path>` 
	- **Windows** - Press `Win+Pause/Break`, then select `Advanced system settings`, `Advanced` tab and `Environment variables` button at the bottom. Add new user environment variable PROJECTS_PATH. You can use browse function to make it easier.

## Usage
```bash
ant-clone <repository>
```

This will clone stated repository (if found) and then automatically open it in PhpStorm
