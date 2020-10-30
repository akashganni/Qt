import sys
from PyQt5.QtCore import QUrl, pyqtSlot as Slot, QObject, pyqtSignal as Signal
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQuick import QQuickView


class Window(QObject):

	sig = Signal()
	@Slot()
	def authenticate(self):
		self.sig.connect(root.change)
		root.change()
	@Slot()
	def check(self):
		self.sig.connect(root.check)
		root.check()

app = QApplication(sys.argv)
win = Window()
print(Window)
view = QQuickView()
view.setSource(QUrl('trainer.qml'))
root = view.rootObject()
con = view.rootContext().setContextProperty('con', win)
view.show()
app.exec_()
