#ifndef MALL_H
#define MALL_H

#include <QObject>

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
public slots:
    void downloadPackage(int itemIndex);
    void updateDownloadProgressUI(int downloadProgress);
    void showDownloadCompleteUI();
private:
    static Mall *instance;
    QObject *serverProductInfoPane;
    void downloadRunner();
    int itemIndex;
};

#endif // MALL_H
