@echo off
@REM Get the current path of the batchscript file
set "myPath=%~dp0"

@REM Test if the gulpfile exists before continuing
if not exist "%myPath%"\gulpfile.js (
    echo "%myPath%"\gulpfile.js not found.
    echo Terminating the script.
    pause
    exit
)
@REM Change the path
cd /d "%myPath%"
@REM Start GULP
cmd /c gulp

pause
exit