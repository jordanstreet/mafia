# Print each file on a new line
foreach(INDEX RANGE 3 ${CMAKE_ARGC})
    if(NOT ${CMAKE_ARGV${INDEX}} STREQUAL "")
        message(STATUS ${CMAKE_ARGV${INDEX}})
    endif()
endforeach()
