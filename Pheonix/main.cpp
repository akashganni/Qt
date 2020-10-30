#include <QApplication>
#include <QWidget>
#include <QQuickView>
#include <QUrl>
#include <QIcon>
#include <QObject>
#include <QPushButton>

class Window
{
public:
	main();
	~main();

	void authenticate() {
		view.setSource(QUrl::fromLocalFile("home.qml"));
	}
	
};

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	Window win = new Window;
	QQuickView view;
	view.setSource(QUrl::fromLocalFile("login.qml"));
	view.rootContext().setContextProperty('con', win);
	view.setTitle("Pheonix");
	view.setMinimumHeight(600);
	view.setMaximumHeight(600);
	view.setMaximumWidth(950);
	view.setMinimumWidth(950);
	view.show();
	return app.exec();
}