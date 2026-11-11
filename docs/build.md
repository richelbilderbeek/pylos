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
`PylosConsole.pro`       | The game, console version
`TestPylosDesktop.pro`   | Tests, with a Qt desktop GUI
`PylosConsoleTest.pro`   | Tests, console version

To build a project, run `qmake` on its project file, then `make`:

```bash
qmake PylosDesktop.pro
make
```
