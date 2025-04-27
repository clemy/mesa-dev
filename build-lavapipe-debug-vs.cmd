rd /s /q mesa-build-vs-debug

meson setup ^
  mesa-build-vs-debug ^
  mesa ^
  --prefix="%CD%\mesa-installed-vs-debug" ^
  --default-library=static ^
  -Dbuildtype=debug ^
  -Db_vscrt=mtd ^
  -Dllvm=enabled ^
  -Dplatforms=windows ^
  -Dosmesa=true ^
  -Dgallium-drivers=swrast ^
  -Dvulkan-drivers=swrast ^
  --backend=vs
