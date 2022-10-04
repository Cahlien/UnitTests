cmake_minimum_required(VERSION 3.23)
project(greeter VERSION 0.1.0)

include(${CMAKE_SOURCE_DIR}/util/utilities.cmake)
include(CTest)

set(CMAKE_CXX_STANDARD 20)
set(LIBRARY_SOURCES
    src/generator/generator.cpp
    include/src/generator/generator.h
    )
set(LIBRARY_INCLUDE_DIRS
    include/src
    ${Qt6Core_INCLUDE_DIRS}
)
set(LIBRARY_LIBS ${Qt6Core_LIBRARIES})

set(TEST_SOURCES test/generator/generator.cpp)
set(TEST_INCLUDE_DIRS ${LIBRARY_INCLUDE_DIRS} ${EXECUTABLE_INCLUDE_DIRS})
set(TEST_LIBRARIES ${LIBRARY_LIBS} ${EXECUTABLE_LIBRARIES})

qt_add_library(${PROJECT_NAME} STATIC)
target_sources(${PROJECT_NAME} PRIVATE ${LIBRARY_SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE ${LIBRARY_INCLUDE_DIRS})

add_subdirectory(test)