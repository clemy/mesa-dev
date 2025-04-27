@echo off
call "%~dp0\config.cmd"

cd /d "%PROJECT%"
rem Activate VS2022 x64 environment
call "%VS%\VC\Auxiliary\Build\vcvars64.bat"
rem Activate Miniforge environment
call "%MINIFORGE3%\Scripts\activate.bat" "%MINIFORGE3%"
call mamba activate %MINIFORGE3_ENV%

rem Start a command prompt with PATH and Vulkan driver configured correctly
%comspec% /k "set PATH=%PROJECT%\llvm\llvm-debug-installed\bin;%PROJECT%\win_flex_bison;%PATH% & set VK_ICD_FILENAMES=%PROJECT%\lvp_icd-vs-debug.x86_64.json"
