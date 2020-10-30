import sys
from PyQt5.QtCore import QObject, QUrl, pyqtSignal as Signal, pyqtSlot as Slot
from PyQt5.QtGui import QIcon, QGuiApplication
from PyQt5.QtWidgets import QMessageBox, QApplication
from PyQt5.QtQuick import QQuickView

class Login(QObject):

    def __init__(self):
        super().__init__()
        self.app = QApplication(sys.argv)
        self.app.setWindowIcon(QIcon('back.jpg.gif'))

        self.view = QQuickView()
        self.view.setSource(QUrl('main.qml'))
        self.view.setTitle("Login")

        self.root = self.view.rootObject()

        self.view.setMinimumWidth(850)
        self.view.setMaximumWidth(850)
        self.view.setMaximumHeight(500)
        self.view.setMinimumHeight(500)
    
        self.con = self.view.rootContext().setContextProperty('con', self)

        self.view.show()

        self.app.exec_()
    x = 0
    x2 = 0

    rad = Signal()

    li = {"c":"c", "akashganni1610@gmail.com":"akashchinnu", "saradaganni1610@gmail.com":"akashchinnu", "ssivaraonemani@gmail.com":"akashabhi"}

    @Slot()
    def cout(self):
        if self.x == 0:
            self.rad.connect(self.root.ct)
            self.root.ct()
        self.x += 1

    @Slot()
    def cout2(self):
        if self.x2 == 0:
            self.rad.connect(self.root.ct2)
            self.root.ct2()
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
            self.main = Main(self)

        else:
            flag = " Login Failed                          "
            msg.setText(flag)
            msg.setIcon(QMessageBox.Warning)
            x = msg.exec()
        print(x)
        return x

class  Main(QObject):
    def __init__(self, login):
        super().__init__()
        self.view = QQuickView()
        self.view.setSource(QUrl('side.qml'))
        self.view.setTitle("Main")

        self.root = self.view.rootObject()
        login.view.hide() 

        self.view.setMinimumWidth(850)
        self.view.setMaximumWidth(850)
        self.view.setMaximumHeight(500)
        self.view.setMinimumHeight(500)
    
        self.con = self.view.rootContext().setContextProperty('con', self)


        self.view.show()

Lg  = Login()