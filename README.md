# Mesa Development Environment

## Tested environment
* Windows 11 24H2
* Visual Studio 2022 Community (with C++, git & cmake)
* Miniforge 3 (https://conda-forge.org/download/)
* Vulkan SDK 1.4.304.1
* FFMPEG (or VLC) to view h264 files

## Get dependencies
Get all dependencies and store them in sub directories of this project.

### LLVM
Download LLVM 18.1.8 and extract into sub directories:
* https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/llvm-18.1.8.src.tar.xz -> llvm/llvm
* https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/cmake-18.1.8.src.tar.xz -> llvm/cmake

### Flex & Bison
Download and extract the Windows Flex & Bison zip:
* https://sourceforge.net/projects/winflexbison/ -> win_flex_bison

### Mesa3D (with Lavapipe Vulkan Video Extensions)
```cmd
git clone git@github.com:clemy/mesa.git -b lavapipe_video
```

### Simple Vulkan Video Encode Example
```cmd
git clone git@github.com:clemy/vulkan-video-encode-simple.git
```

### Vulkan Conformance Test Suite (CTS) with compatibility patches
```cmd
git clone git@github.com:clemy/VK-GL-CTS.git -b lavapipe_test
```

## Configure paths
Edit `config.cmd` and configure the path to Visual Studio and Miniforge3.

## Setup environment
Execute `create-environment.cmd`. This will create a miniforge environment.

## Open a prompt with all path set
Execute `setpath.cmd`. This will open a prompt with a pre-configured environment.

## Build LLVM
On the pre-configured command prompt call:
```cmd
llvm\build-llvm.cmd
```
This will compile and install LLVM into `llvm\llvm-installed`.

## Build Lavapipe
On the pre-configured command prompt call:
```cmd
build-lavapipe.cmd
```
This will compile and install Lavapipe in `mesa-installed`.

## Build and run the simple Vulkan Video Encode example
On the pre-configured command prompt call:
```cmd
rem Compile the example
cmake -B vulkan-video-encode-simple-build vulkan-video-encode-simple
cmake --build vulkan-video-encode-simple-build --config Release

rem Run the example (in subdirectory to find shader files)
cd vulkan-video-encode-simple-build
Release\headless.exe

# Show the created video file
ffplay hwenc.264
# alternatively (for other video players)
start hwenc.264

cd ..
```

## Build and run CTS
On the pre-configured command prompt call:
```cmd
rem Fetch dependencies
python VK-GL-CTS\external\fetch_sources.py

rem Compile CTS
cmake -B VK-GL-CTS-build VK-GL-CTS -DCMAKE_BUILD_TYPE=Release -DSELECTED_BUILD_TARGETS="deqp-vk"
cmake --build VK-GL-CTS-build --config Release -j 10

rem Enable real GPU as first and Lavapipe as second Vulkan device
set VK_ICD_FILENAMES=
set VK_ADD_DRIVER_FILES=%PROJECT%\mesa-installed\share\vulkan\icd.d\lvp_icd.x86_64.json

rem Check GPU order
vulkaninfo --summary

rem Run CTS on Lavapipe (second device) with first device as reference decoder
cd VK-GL-CTS-build\external\vulkancts\modules\vulkan
Release\deqp-vk -n dEQP-VK.video.encode.h264.* --deqp-vk-device-id=2
```

## Visual Studio Development & Debug Project
For developing Lavapipe in Visual Studio follow these steps:

1. Use `setpath-debug.cmd` to open a command prompt.
2. Call `llvm\build-llvm-debug.cmd` to compile a LLVM version linked with the debug runtime library.
3. Call `build-lavapipe-debug-vs.cmd` to create VS projects.
4. Open the VS solution with `start mesa-build-vs-debug\mesa.sln`.
