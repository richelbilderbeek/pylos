# Building

Requires Qt and a C++17 compiler.

The code the game uses from other repositories is copied into this one:

- [DotMatrix](https://github.com/richelbilderbeek/DotMatrix), in the `dot_matrix` folder
- [RibiClasses](https://github.com/richelbilderbeek/RibiClasses), in the `ribi_classes` folder

There are multiple projects:

Project file             | Description
-------------------------|-------------------------------
`PylosDesktop.pro`       | The game, with a Qt desktop GUI
`PylosWebAssembly.pro`   | The game, for Qt 6 desktop and WebAssembly
`PylosConsole.pro`       | The game, console version
`TestPylosDesktop.pro`   | Tests, with a Qt desktop GUI
`PylosConsoleTest.pro`   | Tests, console version

To build a project, run `qmake` on its project file, then `make`:

```bash
qmake PylosDesktop.pro
make
```

## WebAssembly

`PylosWebAssembly.pro` builds the version that can be
[played online](play.md).
It needs only the `dot_matrix` and `ribi_classes` folders
and the Boost headers.

Use the `qmake` from a single-threaded Qt for WebAssembly
installation, with the matching
[Emscripten](https://doc.qt.io/qt-6/wasm.html) version:

```bash
[path to Qt for WebAssembly]/bin/qmake PylosWebAssembly.pro
make
```

[GitHub Actions](https://github.com/richelbilderbeek/pylos/blob/main/.github/workflows/create_zensical_website.yaml)
builds the WebAssembly version and puts it on this website.
