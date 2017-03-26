#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlComponent>
#include <iostream>
#include <thread>
#include <chrono>
#include <QQmlContext>
#include "mainwindow.h"
#include "firsttimesetup.h"
#include "temporarycommandsforqml.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_Use96Dpi);
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    QQmlComponent qQmlComponent(&engine, QUrl(QLatin1String("qrc:/main.qml")));
    QObject* ui = qQmlComponent.create();
    if(qQmlComponent.isError())
    {
        for(auto ptr = qQmlComponent.errors().begin(); ptr != qQmlComponent.errors().end(); ++ptr)
        {
            std::cout << ptr->toString().toStdString() << std::endl;
        }
    }
    MainWindow mainWindow(ui);
    TemporaryCommandsForQml tmpCmd;
    engine.rootContext()->setContextProperty("mainWindow", &mainWindow);    
    engine.rootContext()->setContextProperty("tmpCmd", &tmpCmd);
    return app.exec();
}
