cmake_minimum_required(VERSION 3.10)
project(libKeyFinder CXX)

if (NOT MSVC)
	message( FATAL_ERROR "Platform not implemented")
endif()

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
set(CMAKE_DEBUG_POSTFIX d)

option (BUILD_SHARED_LIBS "Build shared libraries" ON)

option(ENABLE_STATIC_RUNTIME "Link with runtime statically" ON)
if (ENABLE_STATIC_RUNTIME)
	foreach(flag CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELWITHDEBINFO)
		string(REPLACE "/MD" "/MT" ${flag} "${${flag}}")
	endforeach()
endif()

find_path(FFTW3_H fftw3.h)
find_library(FFTW3_LIB fftw3.lib)
include_directories(src ${FFTW3_H})

set(SOURCES
	src/audiodata.cpp
	src/chromagram.cpp
	src/chromatransform.cpp
	src/chromatransformfactory.cpp
	src/constants.cpp
	src/fftadapter.cpp
	src/keyclassifier.cpp
	src/keyfinder.cpp
	src/lowpassfilter.cpp
	src/lowpassfilterfactory.cpp
	src/spectrumanalyser.cpp
	src/temporalwindowfactory.cpp
	src/toneprofiles.cpp
	src/windowfunctions.cpp
	src/workspace.cpp
)

add_library(libKeyFinder ${SOURCES})

target_link_libraries(libKeyFinder PUBLIC
	${FFTW3_LIB}
)

install(
	TARGETS libKeyFinder
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

install(
	DIRECTORY src/
	DESTINATION include/libKeyFinder
	FILES_MATCHING 
	PATTERN "*.h"
)