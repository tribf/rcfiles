

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(LIBS ${LIBS} m jsoncpp)

set(SOURCE_FILES main.cpp)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME} ${LIBS})

## Installation and packaging
include(GNUInstallDirs)

install(
        TARGETS ${PROJECT_NAME}
        COMPONENT runtime
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}/static"
        INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)
