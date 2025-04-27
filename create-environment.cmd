@echo off
call "%~dp0\config.cmd"

cd /d "%PROJECT%"
rem Activate Miniforge environment
call "%MINIFORGE3%\Scripts\activate.bat" "%MINIFORGE3%"
rem Create an environment with all required packages
call mamba create --name %MINIFORGE3_ENV% --file requirements.txt
call mamba activate %MINIFORGE3_ENV%
