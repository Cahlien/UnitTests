cmake_minimum_required(VERSION 3.23)

project(UI VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

ADD_QT_MODULES(Core Quick)
CONFIGURE_QT(${PROJECT_NAME})

GET_FILES(${PROJECT_NAME}_QML_FILES pzgds "*.qml")

message(STATUS "${PROJECT_NAME}_QML_FILES: ${${PROJECT_NAME}_QML_FILES}")
qt_add_library(${PROJECT_NAME} STATIC)
qt_add_qml_module(${PROJECT_NAME}
        URI "dev.crowell.${PROJECT_NAME}"
        VERSION 0.1.0
        QML_FILES ${${PROJECT_NAME}_QML_FILES} pages/HelloWorld.qml
        OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/dev/crowell/UI
        )