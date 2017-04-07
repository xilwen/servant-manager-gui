#ifndef MYSERVER_H
#define MYSERVER_H

#include <QObject>
#include "ServantBase.hpp"

class MyServer : public QObject
{
    Q_OBJECT
public:
    explicit MyServer(QObject *parent = 0);
    virtual ~MyServer();
    static MyServer *getInstance();
    void updateServerQuickAction();
signals:
    void readyToInstallPackage(int itemIndex);
    void installProgressChanged(int progress);
    void installFinished();
    void readyToBootServer(int itemIndex);
    void readyToShutdownServer();
    void modifyFinished();
public slots:
    void installPackage(int itemIndex);
    void updateInstallUI(int progress);
    void updateAfterInstall();
    void bootServer(int itemIndex);
    void shutdownServer();
    void closeModifyUI();
private:
    QObject *addingServerPane;
    QObject *serverInfoPane;
    QObject *overviewModuleServerQuickAction0,
    *overviewModuleServerQuickAction1,
    *overviewModuleServerQuickAction2;
    QObject *serverStateChangingPane;
    PackageManager *packageManager;
    static MyServer *instance;
    int itemIndex = 0;
    void packageInstallRunner();
    void bootServerRunner();
    void shutdownServerRunner();
};

#endif // MYSERVER_H
