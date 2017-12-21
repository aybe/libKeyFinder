cmake_minimum_required(VERSION 3.10)
project(libKeyFinder CXX)

if (NOT MSVC)
	message( FATAL_ERROR "Platform not implemented")
endif()

# option(WINDOWS_EXPORT_ALL_SYMBOLS OFF)
# set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ${WINDOWS_EXPORT_ALL_SYMBOLS})
option(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS "Windows export all symbols" OFF)

set(DEBUG_POSTFIX "d" CACHE STRING "Debug postfix")
set(CMAKE_DEBUG_POSTFIX ${DEBUG_POSTFIX})

option(BUILD_C_WRAPPER "Build C wrapper" ON)
option (BUILD_SHARED_LIBS "Build shared libraries" ON)

# option(INSTALL_PDBS "Install PDBs" OFF)

# option(ENABLE_STATIC_RUNTIME "Link with runtime statically" OFF)
# if (ENABLE_STATIC_RUNTIME)
	# foreach(flag CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELWITHDEBINFO)
		# string(REPLACE "/MD" "/MT" ${flag} "${${flag}}")
	# endforeach()
# endif()

set(SOURCES
	src/audiodata.cpp
	src/audiodata.h
	src/chromagram.cpp
	src/chromagram.h
	src/chromatransform.cpp
	src/chromatransform.h
	src/chromatransformfactory.cpp
	src/chromatransformfactory.h
	src/constants.cpp
	src/constants.h
	src/fftadapter.cpp
	src/fftadapter.h
	src/keyclassifier.cpp
	src/keyclassifier.h
	src/keyfinder.cpp
	src/keyfinder.h
	src/lowpassfilter.cpp
	src/lowpassfilter.h
	src/lowpassfilterfactory.cpp
	src/lowpassfilterfactory.h
	src/spectrumanalyser.cpp
	src/spectrumanalyser.h
	src/temporalwindowfactory.cpp
	src/temporalwindowfactory.h
	src/toneprofiles.cpp
	src/toneprofiles.h
	src/windowfunctions.cpp
	src/windowfunctions.h
	src/workspace.cpp
	src/workspace.h
)

if (BUILD_C_WRAPPER)
	list(APPEND SOURCES 
		src/wrapper.cpp
		src/wrapper.h
	)
endif()

add_library(libKeyFinder ${SOURCES})

find_package(fftw3 REQUIRED)
#find_path(FFTW3_H fftw3.h)
# find_library(FFTW3_LIB fftw3.lib)
include_directories(src ${FFTW3_INCLUDE_DIRS})
target_link_libraries(libKeyFinder PRIVATE FFTW3::fftw3)

# target_link_libraries(libKeyFinder PUBLIC
	# ${FFTW3_LIB}
# )

# if (INSTALL_PDBS)
	# install(FILES $<TARGET_PDB_FILE:${PROJECT_NAME}> DESTINATION bin OPTIONAL)
# endif()

install(
	TARGETS libKeyFinder
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

install(
	DIRECTORY src/
	DESTINATION include
	FILES_MATCHING 
	PATTERN "*.h"
)