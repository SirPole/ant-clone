@echo off

IF /I [%PROJECTS_PATH%]==[] (GOTO MISSING_ENV)
IF /I [%~1]==[] (GOTO MISSING_ARG)
SET HOST=git@git.antstudio.cz
FOR %%g IN (project, siemens, core) DO (
	git ls-remote %HOST%:%%g/%~1 >nul 2>%1
	IF NOT ERRORLEVEL 128 (
		SET REPOSITORY=%HOST%:%%g/%~1
		GOTO CLONE
	)
)
GOTO REPO_NOT_FOUND

:CLONE
IF /I NOT [%REPOSITORY%]==[] (
	git -C %PROJECTS_PATH% clone %REPOSITORY%
	GOTO EXEC
)
GOTO REPO_NOT_FOUND

:EXEC
FOR /f %%i IN ('dir /b %HOMEPATH%\.PhpStorm*') DO SET /P PHPSTORM_HOME=<%HOMEPATH%\%%i\system\.home
START %PHPSTORM_HOME%\bin\phpstorm64.exe %PROJECTS_PATH%\%~1\
GOTO EXIT

:MISSING_ENV
ECHO Please setup your PROJECTS_PATH environment variable. See README.md for help.
GOTO EXIT

:MISSING_ARG
ECHO Please define which repo you wish to clone.
GOTO EXIT

:REPO_NOT_FOUND
ECHO No repository '%~1' found.
GOTO EXIT

:EXIT
