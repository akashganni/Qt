import sys
from PyQt5.QtCore import QObject, QUrl, pyqtSignal as Signal, pyqtSlot as Slot
from PyQt5.QtGui import QIcon
from PyQt5.QtWidgets import QMessageBox, QApplication
from PyQt5.QtQuick import QQuickView


class Window(QObject):
    x = 0
    x2 = 0

    rad = Signal()

    li = {"c": "c", "akashganni1610@gmail.com": "akashchinnu",
          "saradaganni1610@gmail.com": "akashchinnu",
          "ssivaraonemani@gmail.com": "akashabhi"}

    @Slot()
    def cout(self):
        if self.x == 0:
            self.rad.connect(root.ct)
            root.ct()
        self.x += 1

    @Slot()
    def cout2(self):
        if self.x2 == 0:
            self.rad.connect(root.ct2)
            root.ct2()
        self.x2 += 1

    @Slot(str, str)
    def authenticate(self, user, passw):
        self.x = 0
        self.x2 = 0
        print(user)
        print(passw)
        user = user.strip()
        msg = QMessageBox()
        passw = passw.strip()
        if user == "" or passw == "":
            msg.setText("Enter both Username and Password to login")
            msg.setIcon(QMessageBox.Warning)
            x = msg.exec()
            return x
        if user not in self.li:
            flag = "No Account is present. Do you want one?"
            msg.setText(flag)
            msg.setStandardButtons(QMessageBox.Yes | QMessageBox.No)
            msg.setDefaultButton(QMessageBox.Yes)
            msg.setIcon(QMessageBox.Question)
            x = msg.exec()
        elif self.li[user] == passw:
            flag = " Login Sucessful                       "
            msg.setText(flag)
            self.x = 1
            self.x2 = 1
            msg.setIcon(QMessageBox.Information)
            x = msg.exec()
            view.setSource(QUrl('side.qml'))

        else:
            flag = " Login Failed                          "
            msg.setText(flag)
            msg.setIcon(QMessageBox.Warning)
            x = msg.exec()
        print(x)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    app.setWindowIcon(QIcon('back.jpg.gif'))

    view = QQuickView()

    view.setSource(QUrl('main.qml'))

    root = view.rootObject()
    win = Window()

    con = view.rootContext().setContextProperty('con', win)

    view.setResizeMode(QQuickView.SizeRootObjectToView)
    view.setTitle("App")

    view.show()

    app.exec_()
