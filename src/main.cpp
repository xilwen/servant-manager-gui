#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlComponent>
#include <thread>
#include <chrono>
#include <QQmlContext>
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    QObject* ui = QQmlComponent(&engine, QUrl(QLatin1String("qrc:/main.qml"))).create();

    MainWindow mainWindow(ui);
    engine.rootContext()->setContextProperty("mainWindow", &mainWindow);
    return app.exec();
}
