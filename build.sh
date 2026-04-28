mkdir -p build
cd build

# 1. Generate toolchain HERE
conan install .. --build=missing -s build_type=Release

# 2. Verify file exists
ls conan_toolchain.cmake   # must exist

# 3. Configure
cmake .. \
  -G Ninja \
  -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake \
  -DCMAKE_BUILD_TYPE=Release

# 4. Build
cmake --build .
