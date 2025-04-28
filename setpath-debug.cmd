@echo off
call "%~dp0\config.cmd"

cd /d "%PROJECT%"
rem Activate Miniforge environment
call "%CONDA%\Scripts\activate.bat" "%CONDA_ENV%"
rem Activate VS2022 x64 environment
call "%VS%\VC\Auxiliary\Build\vcvars64.bat"

rem Start a command prompt with PATH and Vulkan driver configured correctly
%comspec% /k "set PATH=%PROJECT%\llvm\llvm-installed-debug\bin;%PROJECT%\win_flex_bison;%PATH% & set VK_ICD_FILENAMES=%PROJECT%\lvp_icd-vs-debug.x86_64.json"
