#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QGuiApplication>
#include <QQmlComponent>
#include <QQmlProperty>
#include <thread>
#include "ServantBase.hpp"
#include "loadingscreen.h"
#include "firsttimesetup.h"
#include "mall.h"
#include "myserver.h"

class MainWindow : public QObject
{
    Q_OBJECT
public:
    explicit MainWindow(QObject *ui);
    ~MainWindow();
    static QObject *getUi();

signals:
    void servantBaseIsReady();
public slots:
    void initialServantManager();
private:
    static QObject *ui;
    QObject *controlPane;
    void initialServantBase();
    LoadingScreen *loadingScreen = nullptr;
    FirstTimeSetup *firstTimeSetup = nullptr;
    Mall *mall = nullptr;
    MyServer *myServer = nullptr;

};

#endif // MAINWINDOW_H
