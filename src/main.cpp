#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlComponent>
#include <thread>
#include <chrono>
#include <QQmlContext>
#include "mainwindow.h"
#include "firsttimesetup.h"
#include "temporarycommandsforqml.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    QObject* ui = QQmlComponent(&engine, QUrl(QLatin1String("qrc:/main.qml"))).create();

    MainWindow mainWindow(ui);
    TemporaryCommandsForQml tmpCmd;
    engine.rootContext()->setContextProperty("mainWindow", &mainWindow);    
    engine.rootContext()->setContextProperty("tmpCmd", &tmpCmd);
    return app.exec();
}
