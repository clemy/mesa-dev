# Mesa Development Environment

## Tested environment
* WSL on Windows 11
* VS Code with WSL and Dev Containers extensions
* Docker Desktop

## Open Devcontainer
Use VS Code, open this folder and reopen this folder as devcontainer. This will install all dependencies to compile Mesa3D. It will additionally install all dependencies for compiling Vulkan applications (Vulkan SDK) and showing video files (ffmpeg).

## Clone repositories
```bash
# Clone Mesa3D with Lavapipe Video Extensions
git clone git@github.com:clemy/mesa.git -b lavapipe_video

# Clone the simple Vulkan Video Encode example
git clone git@github.com:clemy/vulkan-video-encode-simple.git

# Clone Vulkan Conformance Test Suite (CTS) with compatibility patches
git clone git@github.com:clemy/VK-GL-CTS.git -b lavapipe_test
```

## Compile Lavapipe
```bash
# Compile Lavapipe
meson setup mesa.build mesa -Dprefix="$(pwd)/mesa.installed" -Dgallium-drivers=swrast -Dvulkan-drivers=swrast
meson compile -C mesa.build/
# Install Lavapipe in ./mesa.installed
meson install -C mesa.build/
```

## Compile and run the simple Vulkan Video Encode example
```bash
# Compile the example
cmake -B vulkan-video-encode-simple.build vulkan-video-encode-simple
cmake --build vulkan-video-encode-simple.build

# Activate the Lavapipe driver
export VK_DRIVER_FILES=$(pwd)/mesa.installed/share/vulkan/icd.d/lvp_icd.x86_64.json
# Run the example (in subdirectory to find shader files)
(cd vulkan-video-encode-simple.build && exec ./headless)

# Show the created video file
ffplay vulkan-video-encode-simple.build/hwenc.264
```

## Compile and run CTS
```bash
# Fetch all dependencies
python3 VK-GL-CTS/external/fetch_sources.py

# Compile CTS
cmake -B VK-GL-CTS.build VK-GL-CTS -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-m64 -DCMAKE_CXX_FLAGS=-m64 -DSELECTED_BUILD_TARGETS="deqp-vk"
cmake --build VK-GL-CTS.build -j 10

# Activate the Lavapipe driver
export VK_DRIVER_FILES=$(pwd)/mesa.installed/share/vulkan/icd.d/lvp_icd.x86_64.json
# Run CTS video tests
# (tests needing decode for verify will not run, as there is no second Vulkan device with decode in the container)
VK-GL-CTS.build/external/vulkancts/modules/vulkan/deqp-vk -n dEQP-VK.video.*
```
