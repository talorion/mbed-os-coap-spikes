cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

project(
    mbed-os-coap-spikes
    LANGUAGES CXX
    )

#########################################
## generate compile database
#########################################
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


#########################################
## Global compiler settings
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
#set(CMAKE_CXX_FLAGS "(${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic -Wshadow -Weffc++ -Wstrict-aliasing -Werror")
add_compile_options(
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Weffc++
    -Wstrict-aliasing
    -Werror
)

#########################################

#########################################
## SubProjects
add_subdirectory(mbed-os-coap-client)
#########################################

