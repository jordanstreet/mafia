# Setup default warnings for C++ compilers
if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
    # MSVC warnings
    message(STATUS "Applying developer warning configuration for MSVC")
    add_compile_options(/W4 /permissive- /WX)
elseif(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    # GCC warnings
    message(STATUS "Applying developer warning configuration for GCC")
    add_compile_options(-Wall -Wextra -Wpedantic -Werror)
else()
    message(STATUS "Unrecognized compiler - no warning flags applied")
endif()
