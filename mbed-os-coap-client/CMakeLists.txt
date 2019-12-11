cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

project(
    mbed-os-coap-client
    LANGUAGES CXX
    )

#########################################

add_executable(
    mbed-os-coap-client
    main.cpp
    )

#if(COMPILE_TESTS)
    add_subdirectory(UNITTESTS)
#endif(COMPILE_TESTS)

