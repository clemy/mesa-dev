@echo off

rem Path to Visual Studio 2022
set VS=C:\Program Files\Microsoft Visual Studio\2022\Community
rem Path to Conda installation
set CONDA=C:\Users\clemy\miniconda3

rem Conda environment name (will be created)
set CONDA_ENV=mesadev
rem Path to this directory (determined automatically)
set PROJECT=%~dp0

echo =============================================
echo Configuration:
echo Visual Studio: %VS%
echo Conda: %CONDA%
echo Conda Environment: %CONDA_ENV%
echo This project: %PROJECT%
echo =============================================
