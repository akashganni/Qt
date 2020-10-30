# This Python file uses the following encoding: utf-8
import sys
import os

from PyQt5.QtWidgets import QApplication, QMessageBox
from PyQt5.QtQuick import QQuickView
from PyQt5.QtCore import QUrl, QObject, pyqtSignal as Signal, pyqtSlot as Slot


class Main(QObject):
    def __init__(self):
        super().__init__()
        self.app = QApplication(sys.argv)
        self.login = Login(self)
        self.home = Home(self)
        self.view = QQuickView()
        self.view.setSource(QUrl.fromLocalFile('main.qml'))
        self.view.setMinimumWidth(950)
        self.view.setMaximumWidth(950)
        self.view.setMinimumHeight(600)
        self.view.setMaximumHeight(600)
        self.root = self.view.rootObject()
        self.con = self.view.rootContext().setContextProperty('con', self.login)
        self.view.show()
        self.app.exec_()

    sig = Signal()

    @Slot()
    def change(self, source, engine):
        print('cone')
        self.sig.connect(self.root.change)
        self.root.change("Home.qml")
        self.con = self.view.rootContext().setContextProperty('con', engine)


class Login(QObject):
    def __init__(self, main):
        super().__init__()
        self.main = main

    li = {'akashganni1610@gmail.com': '1akashchinnu',
              'saradaganni1610@gmail.com': 'akashchinnu',
              'ssivaraonemani@gmial.com': 'akashabhi', 'c': 'c'}

    @Slot(str, str)
    def authenticate(self, user, password):
        msg = QMessageBox()

        if user.strip() == '' or password.strip() == '':
            flag = 'Enter both username and password'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Information)
            self.main.sig.connect(self.main.root.checkUser)
            self.main.root.checkUser('Icons/wrong.png', 1)
            self.main.sig.connect(self.main.root.checkPassword)
            self.main.root.checkPassword('Icons/wrong.png', 1)
            msg.exec()

        elif user not in self.li:
            flag = 'No Account is present. Do you want one?'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Question)
            msg.setStandardButtons(QMessageBox.Ok | QMessageBox.No)
            self.main.sig.connect(self.main.root.checkUser)
            self.main.root.checkUser('Icons/wrong.png', 1)
            x = msg.exec()
            if x == 1024:
                pass

        elif password != self.li[user]:
            flag = 'Invalid password. Login Failed'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Warning)
            self.main.sig.connect(self.main.root.checkPassword)
            self.main.root.checkPassword('Icons/wrong.png', 1)
            self.main.sig.connect(self.main.root.checkUser)
            self.main.root.checkUser('Icons/ok.png', 1)
            msg.exec()

        elif password == self.li[user]:
            flag = 'User Authenticated. Login Sucess'
            msg.setText(flag)
            msg.setIcon(QMessageBox.Information)
            self.main.sig.connect(self.main.root.checkPassword)
            self.main.root.checkPassword('Icons/ok.png', 1)
            self.main.sig.connect(self.main.root.checkUser)
            self.main.root.checkUser('Icons/ok.png', 1)
            x = msg.exec()
            self.main.change('Home.qml', self.main.home)


class Home(QObject):
    def __init__(self, main):
        super().__init__()
        self.main = main


    @Slot()
    def go(self):
        sys.exit()


if __name__ == "__main__":
    main = Main()
