rd /s /q mesa-build

meson setup ^
  mesa-build ^
  mesa ^
  --prefix="%CD%\mesa-installed" ^
  --default-library=static ^
  -Dbuildtype=release ^
  -Db_ndebug=true ^
  -Db_vscrt=mt ^
  -Dllvm=enabled ^
  -Dplatforms=windows ^
  -Dosmesa=true ^
  -Dgallium-drivers=swrast ^
  -Dvulkan-drivers=swrast

ninja -C mesa-build install
