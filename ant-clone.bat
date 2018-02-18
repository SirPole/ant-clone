@echo off

IF /I NOT [%PROJECTS_PATH%]==[] (GOTO START) ELSE (GOTO MISSING_ENV)

:START
IF /I NOT [%~1]==[] (GOTO CHECK) ELSE (GOTO MISSING_ARG)

:CHECK
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
	GOTO EXIT
) ELSE (GOTO REPO_NOT_FOUND)

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
