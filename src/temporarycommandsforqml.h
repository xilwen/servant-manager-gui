#ifndef TEMPORARYCOMMANDSFORQML_H
#define TEMPORARYCOMMANDSFORQML_H

#include <QObject>

class TemporaryCommandsForQml : public QObject
{
    Q_OBJECT
public:
    explicit TemporaryCommandsForQml(QObject *parent = 0);
    Q_INVOKABLE void runHardwareAssessment();
    Q_INVOKABLE void runDownloader(int itemIndex);
    Q_INVOKABLE void runInstaller(int itemIndex);
    Q_INVOKABLE void bootServer(int itemIndex);
    Q_INVOKABLE void shutdownServer(int itemIndex);
    Q_INVOKABLE void updateServerControlUI(int itemIndex);
    Q_INVOKABLE void deleteServer(int itemIndex);
    Q_INVOKABLE void updateAboutPane();
    Q_INVOKABLE void triggerMallItemViewUpdate();
    Q_INVOKABLE void triggerMallDetailViewUpdate();
    Q_INVOKABLE void triggerRepositoryUpdate();
    Q_INVOKABLE void triggerCancelDownload();
    Q_INVOKABLE void triggerMallRepoUrlUpdate(QString qstring);
    Q_INVOKABLE void triggerGetMallRepoUrl();
    Q_INVOKABLE void triggerUpdateServerQuickAction();
    Q_INVOKABLE void triggerIpify();
    Q_INVOKABLE void triggerNetworkInfo();
    Q_INVOKABLE void triggerWebsitePulse();
    Q_INVOKABLE void triggerStartURI(QString uri);
};

#endif // TEMPORARYCOMMANDSFORQML_H
