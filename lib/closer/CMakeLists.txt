cmake_minimum_required(VERSION 3.23)
project(closer VERSION 0.1.0)

include(${CMAKE_SOURCE_DIR}/util/utilities.cmake)
include(CTest)

set(CMAKE_CXX_STANDARD 20)
set(${PROJECT_NAME}_SOURCES
    src/caller/caller.cpp
    include/src/caller/caller.h
    )
set(${PROJECT_NAME}_INCLUDE_DIRS
    include/src
)

set(${PROJECT_NAME}_DEFINITIONS
    CLOSER_EXPORTS
)

ADD_QT_MODULES(${PROJECT_NAME} Core Quick)
CONFIGURE_QT(${PROJECT_NAME})

qt_add_library(${PROJECT_NAME} SHARED)

target_sources(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_LIBS})
target_compile_definitions(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_DEFINITIONS})

add_subdirectory(test)