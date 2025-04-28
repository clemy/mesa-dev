@echo off
call "%~dp0\config.cmd"

cd /d "%PROJECT%"
rem Activate Miniforge environment
call "%CONDA%\Scripts\activate.bat" "%CONDA%"
rem Create an environment with all required packages
call conda create --name %CONDA_ENV% --file requirements.txt
call conda activate %CONDA_ENV%
