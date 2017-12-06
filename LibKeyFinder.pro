#*************************************************************************
#
# Copyright 2011-2014 Ibrahim Sha'ath
#
# This file is part of LibKeyFinder.
#
# LibKeyFinder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# LibKeyFinder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with LibKeyFinder.  If not, see <http://www.gnu.org/licenses/>.
#
#*************************************************************************

cache()

QT -= gui
CONFIG -= qt

TARGET = keyfinder
TEMPLATE = lib

VERSION = 2.2.1

CONFIG += c++11
QMAKE_CXXFLAGS += -std=c++11

DEFINES += LIBKEYFINDER_LIBRARY

HEADERS += \
    src/audiodata.h \
    src/binode.h \
    src/chromagram.h \
    src/chromatransform.h \
    src/chromatransformfactory.h \
    src/constants.h \
    src/exception.h \
    src/fftadapter.h \
    src/keyclassifier.h \
    src/keyfinder.h \
    src/lowpassfilter.h \
    src/lowpassfilterfactory.h \
    src/spectrumanalyser.h \
    src/temporalwindowfactory.h \
    src/toneprofiles.h \
    src/windowfunctions.h \
    src/workspace.h

SOURCES += \
    src/audiodata.cpp \
    src/chromagram.cpp \
    src/chromatransform.cpp \
    src/chromatransformfactory.cpp \
    src/fftadapter.cpp \
    src/keyclassifier.cpp \
    src/keyfinder.cpp \
    src/lowpassfilter.cpp \
    src/lowpassfilterfactory.cpp \
    src/spectrumanalyser.cpp \
    src/temporalwindowfactory.cpp \
    src/toneprofiles.cpp \
    src/windowfunctions.cpp \
    src/workspace.cpp \
    src/constants.cpp

OTHER_FILES += README

macx{
  LIBS += -stdlib=libc++
  QMAKE_CXXFLAGS += -stdlib=libc++
  QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.7
  QMAKE_MAC_SDK = macosx10.12
  CONFIG -= ppc ppc64 x86
  CONFIG += x86_64

  # installation of headers and the shared object
  target.path = /usr/local/lib
  headers.path = /usr/local/include/$$TARGET
  QMAKE_LFLAGS_SONAME = -Wl,-install_name,/usr/local/lib/
}

unix:!macx{
  target.path = /usr/lib
  headers.path = /usr/include/$$TARGET
}

unix{
  INCLUDEPATH += /usr/local/include
  LIBS += -L/usr/local/lib/
  LIBS += -lfftw3

  INSTALLS += target headers
  headers.files = $$HEADERS
}

win32{
  INCLUDEPATH += C:/minGW32/local/include
  DEPENDPATH += C:/minGW32/local/bin
  LIBS += -LC:/minGW32/local/bin
  LIBS += -LC:/minGW32/local/lib
  LIBS += -lfftw3-3
}
