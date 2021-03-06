cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

enable_testing()

option(COMPILE_TESTS "Compile the tests" OFF)

project(
    mbed-os-coap-spikes
    LANGUAGES C CXX ASM
    )

#########################################
## the `pkg_check_modules` function is created with this call
#########################################
find_package(PkgConfig REQUIRED)

include("./common_compiler_settings.cmake")

#########################################
## global include dirs
include_directories(
    mbed-os/features/frameworks/
    mbed-os/features/frameworks/mbed-coap # make mbed-coap global
    mbed-os/features/frameworks/nanostack-libservice/mbed-client-libservice
    mbed-os/features/frameworks/mbed-trace
    mbed-os/features/frameworks/mbed-client-randlib/mbed-client-randlib
)

#########################################
## add mbed coap as static library
file(
    GLOB
    mbed-coap.src "mbed-os/features/frameworks/mbed-coap/source/*.c"
)
add_library(
    mbed-coap
    STATIC
    ${mbed-coap.src}
)
target_include_directories(
    mbed-coap
    PUBLIC
    mbed-os/features/frameworks/mbed-coap/source/include
)

#########################################
## SubProjects
add_subdirectory(mbed-os-coap-client)
#########################################

