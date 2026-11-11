# Pylos, Qt 6 desktop GUI version, also used to build the WebAssembly version
#
# Requires these repositories next to this one (see 'download_other_githubs'):
#  - DotMatrix
#  - RibiClasses
#
# Desktop:
#
#   qmake6 PylosWebAssembly.pro && make
#
# WebAssembly (with Emscripten active):
#
#   [path to Qt for WebAssembly]/bin/qmake PylosWebAssembly.pro && make
#
# Unlike PylosDesktop.pro, this project uses no gcov, gprof, UBSAN
# or GCC-only flags, as these do not work with Emscripten

include(../RibiClasses/CppAbout/CppAbout.pri)
include(../RibiClasses/CppFileIo/CppFileIo.pri)
include(../RibiClasses/CppHelp/CppHelp.pri)
include(../RibiClasses/CppMenuDialog/CppMenuDialog.pri)
include(../RibiClasses/CppQtAboutDialog/CppQtAboutDialog.pri)
include(../RibiClasses/CppQtHideAndShowDialog/CppQtHideAndShowDialog.pri)
include(../RibiClasses/CppCanvas/CppCanvas.pri)
include(../DotMatrix/DotMatrix.pri)
include(Pylos.pri)
include(../RibiClasses/CppTextCanvas/CppTextCanvas.pri)
include(PylosDesktop.pri)
include(QtPylos.pri)

SOURCES += qtmain.cpp

TARGET = pylos

CONFIG += c++17 release
DEFINES += NDEBUG GSL_UNENFORCED_ON_CONTRACT_VIOLATION

QT += core gui widgets

wasm|emscripten {
  # Boost is header-only here, use the Emscripten port
  QMAKE_CXXFLAGS += -sUSE_BOOST_HEADERS=1
  QMAKE_LFLAGS += -sUSE_BOOST_HEADERS=1
}
