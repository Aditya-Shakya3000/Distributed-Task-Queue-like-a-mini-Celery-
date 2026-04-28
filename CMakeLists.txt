cmake_minimum_required(VERSION 3.20)
project(TaskQueue)

set(CMAKE_CXX_STANDARD 17)

find_package(Protobuf CONFIG REQUIRED)
find_package(gRPC CONFIG REQUIRED)

# Proto file
set(PROTO_FILE ${CMAKE_CURRENT_SOURCE_DIR}/proto/task.proto)

# Create a library for generated code
add_library(task_proto)

# Generate protobuf (.pb.cc/.pb.h)
protobuf_generate(
    TARGET task_proto
    LANGUAGE cpp
    PROTOS ${PROTO_FILE}
)

# Generate gRPC (.grpc.pb.cc/.grpc.pb.h)
protobuf_generate(
    TARGET task_proto
    LANGUAGE grpc
    GENERATE_EXTENSIONS .grpc.pb.h .grpc.pb.cc
    PLUGIN "protoc-gen-grpc=$<TARGET_FILE:gRPC::grpc_cpp_plugin>"
    PROTOS ${PROTO_FILE}
)

target_include_directories(task_proto
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)

# Link dependencies to generated code
target_link_libraries(task_proto
    PUBLIC
    protobuf::libprotobuf
    gRPC::grpc++
)

# Your server
add_executable(server server/main.cpp)

target_link_libraries(server
    PRIVATE
    task_proto
)
