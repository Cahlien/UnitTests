cmake_minimum_required(VERSION 3.23)
project(closer_tests VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(CTest)

#find_program(QMLTESTRUNNER_BIN NAMES qmltestrunner)

GET_TESTS(${CMAKE_CURRENT_SOURCE_DIR})

#add_test(NAME ui_tests COMMAND ${QMLTESTRUNNER_BIN} -input ${CMAKE_CURRENT_SOURCE_DIR}/ui/pages/main/tst_main.qml)