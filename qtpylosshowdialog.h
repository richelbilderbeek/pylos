#ifndef QTPYLOSSHOWDIALOG_H
#define QTPYLOSSHOWDIALOG_H

#include <functional>

#include "qthideandshowdialog.h"

namespace ribi {
namespace pylos {

/// Hide the parent and show the child, without blocking.
///
/// When the child is closed, it is deleted and 'on_close' is called.
/// By default, 'on_close' shows the parent again.
///
/// This replaces QtHideAndShowDialog::ShowChild,
/// which uses QDialog::exec, which does not work on WebAssembly,
/// see https://doc.qt.io/qt-6/wasm.html#asyncify
inline void ShowChildDialog(
  QtHideAndShowDialog * const parent,
  QtHideAndShowDialog * const child,
  std::function<void()> on_close = {}
)
{
  if (!on_close) on_close = [parent]() { parent->show(); };
  child->setAttribute(Qt::WA_DeleteOnClose);
  QObject::connect(child, &QtHideAndShowDialog::close_me, parent, on_close);
  parent->hide();
  child->show();
}

} //~namespace pylos
} //~namespace ribi

#endif // QTPYLOSSHOWDIALOG_H
