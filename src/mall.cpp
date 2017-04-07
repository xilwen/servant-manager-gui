#include "mall.h"
#include <thread>
#include <ServantBase.hpp>
#include <mainwindow.h>

Mall *Mall::instance = nullptr;

Mall::Mall(QObject *parent) : QObject(parent)
{
    instance = this;
    connect(this, &Mall::readyToDownloadPackage, this, &Mall::downloadPackage);
    connect(this, &Mall::downloadProgressChanged, this, &Mall::updateDownloadProgressUI);
    connect(this, &Mall::downloadCompleted, this, &Mall::showDownloadCompleteUI);
    serverProductInfoPane = MainWindow::getUi()->findChild<QObject*>("serverProductInfoPane");
}

Mall::~Mall()
{
    instance = nullptr;
}

Mall *Mall::getInstance()
{
    return instance;
}

void Mall::downloadPackage(int itemIndex)
{
    this->itemIndex = itemIndex;
    std::thread(&Mall::downloadRunner, this).detach();
}

void Mall::downloadRunner()
{
    HtmlFileDownloader htmlFileDownloader;
    if(itemIndex == 0)
    {
        htmlFileDownloader.startDownload("http://localhost/FTPSvr.ova", ServantBase::getInstance()->getProfileManager()->getUserDataDirString() + "/FTPSvr.ova");
    }
    else
    {
        htmlFileDownloader.startDownload("http://localhost/joomlaSvr.ova", ServantBase::getInstance()->getProfileManager()->getUserDataDirString() + "/joomlaSvr.ova");
    }
    while(htmlFileDownloader.isDownloading())
    {
        downloadProgressChanged(htmlFileDownloader.downloadProgress());
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
    }
    emit downloadCompleted();
}

void Mall::updateDownloadProgressUI(int downloadProgress)
{
    serverProductInfoPane->setProperty("progressBarValue", static_cast<double>(downloadProgress) / 100.0);
    serverProductInfoPane->setProperty("progressText", QString::fromStdString(std::to_string(downloadProgress) + " %"));
}

void Mall::showDownloadCompleteUI()
{
    serverProductInfoPane->setProperty("succeedPaneVisible", true);
}


