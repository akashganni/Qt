import sys
from PyQt5.QtCore import QUrl, QObject, pyqtSlot as Slot, pyqtSignal as Signal
from PyQt5.QtQuick import QQuickView
from PyQt5.QtWidgets import QApplication, QMessageBox
from PyQt5.QtGui import QIcon, QGuiApplication


class Window(QObject):
    def __init__(self):
        super().__init__()

    sig = Signal()

    li = {'akashganni1610@gmail.com': '1akashchinnu',
          'saradaganni1610@gmail.com': 'akashchinnu',
          'ssivaraonemani@gmial.com': 'akashabhi', 'c': 'c'}

    @Slot(str, str, ret=int)
    def authenticate(self):
        msg = QMessageBox()

        if user.strip() == '' or password.strip() == '':
            flag = 'Enter both username and password'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Information)
            self.sig.connect(root.checkUser)
            root.checkUser('Icons/wrong.png', 1)
            self.sig.connect(root.checkPassword)
            root.checkPassword('Icons/wrong.png', 1)
            msg.exec()

        elif user not in self.li:
            flag = 'No Account is present. Do you want one?'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Question)
            msg.setStandardButtons(QMessageBox.Ok | QMessageBox.No)
            self.sig.connect(root.checkUser)
            root.checkUser('Icons/wrong.png', 1)
            x = msg.exec()
            if x == 1024:
                pass

        elif password != self.li[user]:
            flag = 'Invalid password. Login Failed'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Warning)
            self.sig.connect(root.checkPassword)
            root.checkPassword('Icons/wrong.png', 1)
            self.sig.connect(root.checkUser)
            root.checkUser('Icons/ok.png', 1)
            msg.exec()

        elif password == self.li[user]:
            flag = 'User Authenticated. Login Sucess'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Information)
            self.sig.connect(root.checkPassword)
            root.checkPassword('Icons/ok.png', 1)
            self.sig.connect(root.checkUser)
            root.checkUser('Icons/ok.png', 1)
            x = msg.exec()
            #self.change()
            
    @Slot()
    def change(self):
        view.setSource(QUrl.fromLocalFile('home.qml'))


if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = Window()
    app.setWindowIcon(QIcon('Icons\\icon.png'))
    view = QQuickView()
    print(id(view))
    view.setSource(QUrl('login.qml'))
    view.setTitle("Pheonix")

    con = view.rootContext().setContextProperty('con', win)
    root = view.rootObject()

    view.setMinimumHeight(600)
    view.setMaximumHeight(600)
    view.setMaximumWidth(950)
    view.setMinimumWidth(950)
    view.setResizeMode(QQuickView.SizeViewToRootObject)
    view.show()
    app.exec_()
