cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

enable_testing()

#########################################
## Cpputest
#########################################
# Look for installed version of CppUTest
if(DEFINED ENV{CPPUTEST_HOME})
    message(STATUS "Using CppUTest home: $ENV{CPPUTEST_HOME}")
    set(CPPUTEST_INCLUDE_DIRS $ENV{CPPUTEST_HOME}/include)
    set(CPPUTEST_LIBRARIES $ENV{CPPUTEST_HOME}/lib)
    set(CPPUTEST_LDFLAGS CppUTest CppUTestExt)
else()
    pkg_search_module(CPPUTEST REQUIRED cpputest>=3.8)
    message(STATUS "Found CppUTest version ${CPPUTEST_VERSION}")
    message(STATUS "Using CppUTest home: $ENV{CPPUTEST_HOME}")
endif()

#Specify directories in which the linker will look for libraries.
#link_directories(
#${CPPUTEST_LIBRARIES}
#)

#include_directories(
#    ${CPPUTEST_INCLUDE_DIRS}
#)

####################
# UNIT TESTS
####################

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DUNITTEST")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DUNITTEST")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" )
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weffc++")
SET(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )

# Set include dirs.
set(unittest-includes-base
    ${CPPUTEST_INCLUDE_DIRS}
    )

# Create a list for test suites.
set(TEST_SUITES)

# Get all matched tests.
file(GLOB_RECURSE unittest-file-list
      "unittest.cmake"
      )

if ("${unittest-file-list}" STREQUAL "")
      message(FATAL_ERROR "No tests found. Exiting...")
  endif()

# Create unit test targets
foreach(testfile ${unittest-file-list})
    ####################
    # DEFINE TARGETS
    ####################

    # Init file lists.
    set(unittest-includes ${unittest-includes-base})
    set(unittest-sources)
    set(unittest-test-sources)

    # Get source files
    include("${testfile}")

    get_filename_component(TEST_SUITE_DIR ${testfile} DIRECTORY)

    file(RELATIVE_PATH
        TEST_SUITE_NAME # output
        ${PROJECT_SOURCE_DIR} # root
        ${TEST_SUITE_DIR} #abs dirpath
    )

    string(REGEX REPLACE "/|\\\\" "-" TEST_SUITE_NAME ${TEST_SUITE_NAME})

    set(TEST_SUITES ${TEST_SUITES} ${TEST_SUITE_NAME})

    #set(LIBS_TO_BE_LINKED ${CPPUTEST_LDFLAGS})

    # Build directories list
    set(BUILD_DIRECTORIES)

    if (unittest-sources)
        # Create the testable static library.
        add_library("${TEST_SUITE_NAME}.${LIB_NAME}" STATIC ${unittest-sources})
        target_include_directories("${TEST_SUITE_NAME}.${LIB_NAME}" PRIVATE
        ${unittest-includes})
        set(LIBS_TO_BE_LINKED ${LIBS_TO_BE_LINKED} "${TEST_SUITE_NAME}.${LIB_NAME}")

        # Append lib build directory to list
        list(APPEND BUILD_DIRECTORIES "./CMakeFiles/${TEST_SUITE_NAME}.${LIB_NAME}.dir")
    endif(unittest-sources)

    if (unittest-test-sources)
        # Create the executable.
        add_executable(${TEST_SUITE_NAME}.out ${unittest-test-sources})
        #target_include_directories(${TEST_SUITE_NAME}.out
        #SYSTEM
        #PUBLIC
        #BEFORE
        #${CPPUTEST_LDFLAGS}
        #)
        target_include_directories(${TEST_SUITE_NAME}.out PRIVATE
        ${unittest-includes})

        # Link the executable with the libraries.
        target_link_libraries(${TEST_SUITE_NAME}.out ${LIBS_TO_BE_LINKED} ${CPPUTEST_LDFLAGS})

        #Specify directories in which the linker will look for libraries.
        #target_link_directories(
        #${CPPUTEST_LIBRARIES}
        #)

        add_test(
            NAME "${TEST_SUITE_NAME}"
            COMMAND ${TEST_SUITE_NAME}.out -c
        )

        # Append test build directory to list
        list(APPEND BUILD_DIRECTORIES "./CMakeFiles/${TEST_SUITE_NAME}.dir")
    else()
        message(WARNING "No test source files found for ${TEST_SUITE_NAME}.\n")
    endif(unittest-test-sources)
endforeach(testfile)


