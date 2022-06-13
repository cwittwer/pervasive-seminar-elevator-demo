cmake_minimum_required(VERSION 3.16)

project(ElevatorPrototype VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appElevatorPrototype
    main.cpp
    server_test.cpp
    server_test.h
)

qt_add_qml_module(appElevatorPrototype
    URI ElevatorPrototype
    VERSION 1.0
    QML_FILES main.qml
        FloorButtonCircleFill.qml
        FloorButtonCircleBorderFill.qml
        FloorButtonArcFilling.qml
        FloorClusterCircle.qml
        FloorClusterCircle_central.qml
        Elevator1_Fill.qml
        Elevator1_Arc.qml
    RESOURCES
        images/exclamation.png
        images/play.png
)

set_target_properties(appElevatorPrototype PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appElevatorPrototype
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appElevatorPrototype
    PRIVATE Qt6::Quick)
