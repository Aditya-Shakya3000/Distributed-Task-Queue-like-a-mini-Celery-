cmake_minimum_required(VERSION 3.20)
project(TaskQueue)

set(CMAKE_CXX_STANDARD 17)

find_package(Protobuf REQUIRED)
find_package(gRPC REQUIRED)

add_executable(server server/main.cpp)

target_link_libraries(server
    gRPC::grpc++
    protobuf::libprotobuf
)