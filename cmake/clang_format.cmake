# Create a Clang-format target
find_program(CLANG_FORMAT clang-format)
if(CLANG_FORMAT)
    # Indicate Clang-format was found
    message(STATUS "Creating clang-format target from ${CLANG_FORMAT}")

    # Build the project source list
    set(CLANG_FORMAT_DIRS include src tests)
    foreach(DIR IN LISTS CLANG_FORMAT_DIRS)
        file(GLOB_RECURSE FILES ${DIR}/*.h ${DIR}/*.hpp ${DIR}/*.c ${DIR}/*.cpp)
        list(APPEND CLANG_FORMAT_FILES ${FILES})
    endforeach()

    # Create a custom target to run Clang-format
    add_custom_target(
        clang-format
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/print_files.cmake ${CLANG_FORMAT_FILES}
        COMMAND clang-format -i ${CLANG_FORMAT_FILES}
        COMMENT "Running Clang-format:"
    )
endif()
