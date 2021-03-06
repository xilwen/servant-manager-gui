#ifndef MALL_H
#define MALL_H

#include <QObject>
#include <vector>

class Mall : public QObject
{
    Q_OBJECT
public:
    explicit Mall(QObject *parent = 0);
    virtual ~Mall();
    static Mall *getInstance();
signals:
    void readyToDownloadPackage(int itemIndex);
    void downloadProgressChanged(int downloadProgress);
    void downloadCompleted();
    void updateRepositoryButtonClicked();
    void updateMallItemViewTriggered();
    void updateMallDetailViewTriggered();
    void cancelDownloadTriggered();
    void updateMallRepoUrlTriggered(QString qstring);
    void getMallRepoUrlTriggered();
    void getIpifyTriggered();
    void websitePulseTriggered();
    void startURITriggered(QString uri);
public slots:
    void downloadPackage(int itemIndex);
    void updateDownloadProgressUI(int downloadProgress);
    void showDownloadCompleteUI();
    void updateRepository();
    void updateMallItemView();
    void updateMallDetailView();
    void cancelDownload();
    void updateMallRepoUrl(QString qstring);
    void getIpify();
    void triggerWebsitePulse();
    void startURI(QString uri);
private:
    static Mall *instance;
    QObject *serverProductInfoPane;
    std::vector<QObject*> serverObjectButtons;
    void downloadRunner();
    int itemIndex;
    const int serverObjectButtonsAmount = 10;
};

#endif // MALL_H
