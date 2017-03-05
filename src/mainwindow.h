#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QGuiApplication>
#include <QQmlComponent>
#include <QQmlProperty>
#include <thread>
#include "ServantBase.hpp"
#include "loadingscreen.h"

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
    void hideLoadingUI();
private:
    static QObject *ui;
    void initSERVANTBaseRunner();
    LoadingScreen *loadingScreen;

};

#endif // MAINWINDOW_H
