What you build:

1. gRPC-based worker system
2. Task scheduler + queue
3. Retry + failure handling
4. Multi-worker support

Tech stack:

1. C++
2. gRPC
3. Redis
4. Docker

Concepts you’ll learn:

1. Concurrency (threads, async)
2. IPC / RPC design
3. Fault tolerance basics

Use this exact combo:

1. Build system → CMake
2. Dependency manager → Conan
3. RPC → gRPC
4. Serialization → Protobuf
5. Compiler → gcc/clang
6. Build tool → Ninja (faster than make)

Install conan

Linux: 
1. create a venv: python3 -m venv .venv
2. activate vevn: source conan/bin/activate
3. install conan in it: pip install conan

Windows:


Initialize conan:
conan profile detect --force

Install dependenceis:
conan install . --output-folder=build --build=missing

Build Project:
1. cd build
2. cmake .. -G Ninja -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
3. cmake --build .

Run server
./server