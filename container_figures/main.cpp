#include <classes.h>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTime>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	// init qrand for random color for each figure
	QTime midnight(0,0,0);
	qsrand(midnight.secsTo(QTime::currentTime()));

	QGuiApplication app(argc, argv);

	qmlRegisterType<Circle>("CustomClass.Figures", 1, 0, "Circle");
	qmlRegisterType<Triangle>("CustomClass.Figures", 1, 0, "Triangle");
	qmlRegisterType<Square>("CustomClass.Figures", 1, 0, "Square");
	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
