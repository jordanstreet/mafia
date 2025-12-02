# Create a CMake-format target
find_program(CMAKE_FORMAT cmake-format)
if(CMAKE_FORMAT)
    # Indicate CMake-format was found
    message(STATUS "Creating cmake-format target from ${CMAKE_FORMAT}")

    # Build the CMake source list
    set(CMAKE_FORMAT_DIRS cmake include src tests)
    foreach(DIR IN LISTS CMAKE_FORMAT_DIRS)
        file(GLOB_RECURSE FILES ${DIR}/*.cmake ${DIR}/CMakeLists.txt)
        list(APPEND CMAKE_FORMAT_FILES ${FILES})
    endforeach()
    file(GLOB FILES *.cmake CMakeLists.txt)
    list(APPEND CMAKE_FORMAT_FILES ${FILES})

    # Create a custom target to run CMake-format
    add_custom_target(
        cmake-format
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/print_files.cmake ${CMAKE_FORMAT_FILES}
        COMMAND cmake-format -i ${CMAKE_FORMAT_FILES}
        COMMENT "Running CMake-format:"
    )
endif()
