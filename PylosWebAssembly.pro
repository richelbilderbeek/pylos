# Pylos, Qt 6 desktop GUI version, also used to build the WebAssembly version
#
# Requires this repository next to this one (see 'download_other_githubs'):
#  - DotMatrix
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

include($$PWD/ribi_classes/CppAbout/CppAbout.pri)
include($$PWD/ribi_classes/CppFileIo/CppFileIo.pri)
include($$PWD/ribi_classes/CppHelp/CppHelp.pri)
include($$PWD/ribi_classes/CppMenuDialog/CppMenuDialog.pri)
include($$PWD/ribi_classes/CppQtAboutDialog/CppQtAboutDialog.pri)
include($$PWD/ribi_classes/CppQtHideAndShowDialog/CppQtHideAndShowDialog.pri)
include($$PWD/ribi_classes/CppCanvas/CppCanvas.pri)
include(../DotMatrix/DotMatrix.pri)
include(Pylos.pri)
include($$PWD/ribi_classes/CppTextCanvas/CppTextCanvas.pri)
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
