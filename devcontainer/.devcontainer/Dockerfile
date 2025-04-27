FROM mcr.microsoft.com/devcontainers/cpp:ubuntu-24.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    flex bison \
    python3-pip python3-mako \
    llvm-16-dev \
    libdrm-dev libwayland-dev libwayland-egl-backend-dev \
    libxcb1-dev libxcb-randr0-dev libx11-dev \
    libxext-dev libxfixes-dev libxcb-glx0-dev libxcb-shm0-dev \
    libx11-xcb-dev libxcb-dri2-0-dev libxcb-dri3-dev \
    libxcb-present-dev libxshmfence-dev \
    libxxf86vm-dev libxrandr-dev wayland-protocols \
    libgl-dev libglx-dev \
    libvulkan-dev libvulkan-volk-dev libvulkan-memory-allocator-dev glslc vulkan-tools \
    ffmpeg

RUN pip install --break-system-packages meson lxml