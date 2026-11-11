# Building

Requires Qt and a C++17 compiler.

The project files include code from other repositories,
which must be cloned next to this one:

- [DotMatrix](https://github.com/richelbilderbeek/DotMatrix)
- [GSL](https://github.com/Microsoft/GSL)
- [RibiClasses](https://github.com/richelbilderbeek/RibiClasses)
- [RibiLibraries](https://github.com/richelbilderbeek/RibiLibraries)

The script `download_other_githubs` clones these.

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
It needs only DotMatrix and RibiClasses,
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
