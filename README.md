# UnitTests
### This module contains unit tests for C++ and QML in Qt6.

## Environment Variables
```bash
QML_IMPORT_PATH=<absolute path to qml module folder>
QT_ASSUME_STDERR_HAS_CONSOLE=1
QT_QML_DEBUG=1
```

## Issues with Qt6
- [x] use MSVC toolchain, not Clang-CL toolchain
- [x] add compiler option: /Zc:__cplusplus for MSVC 17.3+