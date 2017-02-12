#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlComponent>
#include <QQmlProperty>
#include <thread>
#include <chrono>
#include <iostream>
#include "servantBase.h"

class MainWindow : public QObject
{
    Q_OBJECT
public:
    explicit MainWindow(QObject *ui);
    ~MainWindow();
    Q_INVOKABLE void shutdown();
    Q_INVOKABLE void importPackage();
    Q_INVOKABLE void boot();
    Q_INVOKABLE void setName0();
    Q_INVOKABLE void setName1();
    Q_INVOKABLE void startDownload();
    Q_INVOKABLE void importPackageDownloaded();
    Q_INVOKABLE void runFirstTimeWorker();
    Q_INVOKABLE void deleteVM();
    Q_INVOKABLE void startWebmin();
signals:
    void importStatusChanged(int progress);
public slots:
    void updateImportBusy(int progress);
private:
    QObject *ui;
    QObject *loadingProgressBar,
    *statusLabel,
    *pane1,
    *progressBar2,
    *button2,
    *overviewPane,
    *serverInfoPane,
    *fileDialog,
    *bootButton,
    *machinePane1,
    *serverInfoName,
    *downloadProgress,
    *newServerButton,
    *welcomePane,
    *perfMeterPane,
    *firstTimeFinishedPane,
    *startWebControlButton
    ;
    vBoxWrapperClient *client = nullptr;
    packageManager *pm = nullptr;
    vBoxWrapperHolder *holder = nullptr;
    PerformanceManager *perfm = nullptr;
    void importListener();
};

#endif // MAINWINDOW_H
