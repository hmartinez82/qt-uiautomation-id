cmake_minimum_required(VERSION 3.16)

project(Test LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick Widgets)

qt_add_executable(testuiautomationid
    form.ui
    form.cpp
    main.cpp
)

qt_add_qml_module(testuiautomationid
    URI Test
    VERSION 1.0
    QML_FILES Main.qml
    SOURCES form.h form.cpp
    RESOURCES form.ui
)

set_target_properties(testuiautomationid PROPERTIES
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(testuiautomationid
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Widgets
)

include(GNUInstallDirs)
install(TARGETS testuiautomationid
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
