@echo off

rem Path to Visual Studio 2022
set VS=C:\Program Files\Microsoft Visual Studio\2022\Community
rem Path to Miniforge3 installation
set MINIFORGE3=C:\Users\clemy\miniforge3

rem Miniforge3 environment name (will be created)
set MINIFORGE3_ENV=mesadev
rem Path to this directory (determined automatically)
set PROJECT=%~dp0

echo =============================================
echo Configuration:
echo Visual Studio: %VS%
echo Miniforge3: %MINIFORGE3%
echo Miniforge3 Environment: %MINIFORGE3_ENV%
echo This project: %PROJECT%
echo =============================================
