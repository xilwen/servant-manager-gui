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
    void readyToShutdownServer(int itemIndex);
    void modifyFinished();
    void updateServerQuickActionTriggered();
    void networkInfoTriggered();
    void serverQuickInfoUpdateTriggered(int itemIndex);
    void setupLocalIPTriggered(QString ipAddress);
    void readyToExportPackage(int itemIndex, QString filePath);
    void exportProgressChanged(int progress);
    void exportFinished();
public slots:
    void installPackage(int itemIndex);
    void updateInstallUI(int progress);
    void updateAfterInstall();
    void bootServer(int itemIndex);
    void shutdownServer(int itemIndex);
    void closeModifyUI();
    void updateServerQuickActionSlot();
    void openNetworkInfo();
    void setupLocalIP(QString ipAddress);
    void exportPackage(int itemIndex, QString filePath);
    void updateExportProgress(int progress);
    void closeExportUI();

private:
    QObject *addingServerPane;
    QObject *serverInfoPane;
    QObject *controlPane;
    std::vector<QObject*> overviewModuleServerQuickActions;
    QObject *serverStateChangingPane;
    PackageManager *packageManager;
    static MyServer *instance;
    int itemIndex = 0;
    const unsigned int overviewModuleServerQuickActionAmount = 10;
    void packageInstallRunner();
    void bootServerRunner();
    void shutdownServerRunner();
    void exportServerRunner();
};

#endif // MYSERVER_H
