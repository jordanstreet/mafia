# Minimum CMake version
cmake_minimum_required(VERSION 3.21)

# Read in the project version
file(READ "VERSION" VERSION)
string(STRIP ${VERSION} VERSION)

# Setup CMake project
project(
    "Mafia"
    VERSION ${VERSION}
    DESCRIPTION "Mafia Game"
    LANGUAGES CXX
)

# Print the project banner
message(STATUS "--------------------------------------------------------------------------------")
message(STATUS "${PROJECT_NAME} v${PROJECT_VERSION}")
message(STATUS ${PROJECT_DESCRIPTION})
message(STATUS "--------------------------------------------------------------------------------")

# C++ configuration
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include additional CMake tools
include(cmake/clang_format.cmake)
include(cmake/cmake_format.cmake)
include(cmake/warnings.cmake)

# Configure project header
configure_file(cmake/project.hpp.in configured/example/project.hpp NEWLINE_STYLE LF)

# Specify ASIO include directory for Crow
set(ASIO_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/external/asio/asio/include")

# Create a CMake interface target for httplib
add_library(httplib INTERFACE)
target_include_directories(httplib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/external/cpp-httplib)

# Build additional dependencies
add_subdirectory(external/Catch2)
add_subdirectory(external/Crow)
add_subdirectory(external/json)
