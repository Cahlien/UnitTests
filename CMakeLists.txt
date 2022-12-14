cmake_minimum_required(VERSION 3.23)

project(UnitTests VERSION 0.1.0 LANGUAGES CXX)

include(CTest)
include(util/utilities.cmake)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(${PROJECT_NAME}_PROPERTIES "")
set(${PROJECT_NAME}_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/include)
GET_FILES(${PROJECT_NAME}_SOURCES ${CMAKE_SOURCE_DIR}/src "*.cpp")

ADD_QT_MODULES(${PROJECT_NAME} Core Quick)
CONFIGURE_QT(${PROJECT_NAME})

add_subdirectory(lib)
list(APPEND ${PROJECT_NAME}_LIBS ${LIB_LIBRARIES})
list(APPEND ${PROJECT_NAME}_INCLUDE_DIRS ${LIB_INCLUDE_DIRS})

if($ENV{DEPENDENCY_MANAGEMENT} STREQUAL "Conan")
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup(TARGETS)
endif()

set(RESOURCE_FILES
        resource/collections/ui.qrc
        )
list(APPEND ${PROJECT_NAME}_SOURCES ${RESOURCE_FILES})

set(SRC_FILES
        )
list(APPEND ${PROJECT_NAME}_SOURCES ${SRC_FILES})

set(Q_OBJECT_HEADERS

        )
list(APPEND ${PROJECT_NAME}_SOURCES ${Q_OBJECT_HEADERS})

qt_add_executable(${PROJECT_NAME})

add_subdirectory(ui)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        AUTOMOC ON
        AUTORCC ON
        AUTOUIC ON
        WIN32_EXECUTABLE TRUE
        ANDROID TRUE
        )
else()
    set_target_properties(${PROJECT_NAME} PROPERTIES
        AUTOMOC ON
        AUTORCC ON
        AUTOUIC ON
        ANDROID TRUE
        MACOSX_BUNDLE_GUI_IDENTIFIER ${PROJECT_NAME}.crowell.dev
        MACOSX_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLESHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE TRUE
        )
endif()

target_sources(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_SOURCES})

target_include_directories(${PROJECT_NAME}
        PRIVATE
        ${${PROJECT_NAME}_INCLUDE_DIRS}
        )

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        ${${PROJECT_NAME}_LIBS}
        )

install(TARGETS ${PROJECT_NAME}
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        )

add_subdirectory(test)