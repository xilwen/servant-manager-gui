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
    connect(this, &Mall::updateRepositoryButtonClicked, this, &Mall::updateRepository);
    connect(this, &Mall::updateMallItemViewTriggered, this ,&Mall::updateMallItemView);
    connect(this, &Mall::updateMallDetailViewTriggered, this, &Mall::updateMallDetailView);
    connect(this, &Mall::cancelDownloadTriggered, this, &Mall::cancelDownload);
    connect(this, &Mall::updateMallRepoUrlTriggered, this, &Mall::updateMallRepoUrl);
    connect(this, &Mall::getIpifyTriggered, this, &Mall::getIpify);
    connect(this, &Mall::websitePulseTriggered, this, &Mall::triggerWebsitePulse);
    connect(this, &Mall::startURITriggered, this, &Mall::startURI);
    serverProductInfoPane = MainWindow::getUi()->findChild<QObject*>("serverProductInfoPane");
    for(auto i = 0; i < serverObjectButtonsAmount; ++i)
    {
        QObject *newServerObjectButton = MainWindow::getUi()->findChild<QObject*>(QString::fromStdString(std::string("serverObjectButton" + std::to_string(i))));
        serverObjectButtons.push_back(newServerObjectButton);
    }
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
    HtmlFileDownloader *htmlFileDownloader = HtmlFileDownloader::getInstance();
    auto items(ServantBase::getInstance()->getMallManager()->getItemList());
    std::string remoteFile(ConfigManager::getInstance()->getRemoteServiceHost() +
                           "/" + items->at(itemIndex).getVboxImageFile());
    std::string localFile(ServantBase::getInstance()->getProfileManager()->getUserDataDirString() +
                          "/"  + items->at(itemIndex).getVboxImageFile());
    htmlFileDownloader->startDownload(remoteFile, localFile);
    while(htmlFileDownloader->isDownloading())
    {
        downloadProgressChanged(htmlFileDownloader->downloadProgress());
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
    }
    if(htmlFileDownloader->succeededLastTime())
    {
        items->at(itemIndex).downloadAdditionalFiles();
        emit downloadCompleted();
    }
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

void Mall::updateRepository()
{
    ServantBase::getInstance()->getMallManager()->updateItemList();
    emit updateMallItemViewTriggered();
}

void Mall::updateMallItemView()
{
    auto items(ServantBase::getInstance()->getMallManager()->getItemList());
    for(int i = 0; i < serverObjectButtonsAmount; ++i)
    {
        if(i < items->size())
        {
            serverObjectButtons.at(i)->setProperty("visible", true);
            serverObjectButtons.at(i)->setProperty("serverTitle", QString::fromUtf8(items->at(i).getName().c_str()));
            serverObjectButtons.at(i)->setProperty("serverSubtitle", QString::fromUtf8(items->at(i).getDescription().c_str()));
            std::string imageSource(ConfigManager::getInstance()->getRemoteServiceHost() + "/" + items->at(i).getIconPath());
            serverObjectButtons.at(i)->setProperty("serverImageSource", QString::fromUtf8(imageSource.c_str()));
        }
        else
        {
            serverObjectButtons.at(i)->setProperty("visible", false);
        }
    }
}

void Mall::updateMallDetailView()
{
    auto items(ServantBase::getInstance()->getMallManager()->getItemList());
    itemIndex = QQmlProperty::read(serverProductInfoPane, "itemIndex").toInt();
    serverProductInfoPane->setProperty("itemName", QString::fromUtf8(items->at(itemIndex).getName().c_str()));
    serverProductInfoPane->setProperty("itemDescription", QString::fromUtf8(items->at(itemIndex).getDescription().c_str()));
    serverProductInfoPane->setProperty("itemProducer", QString::fromUtf8(items->at(itemIndex).getProducer().c_str()));
    std::string imageSource(ConfigManager::getInstance()->getRemoteServiceHost() + "/" + items->at(itemIndex).getIconPath());
    serverProductInfoPane->setProperty("itemIcon", QString::fromUtf8(imageSource.c_str()));
    serverProductInfoPane->setProperty("itemUpdateDate", QString::fromUtf8(items->at(itemIndex).getUpdateDate().c_str()));
    serverProductInfoPane->setProperty("itemOperatingSystem", QString::fromUtf8(items->at(itemIndex).getOperatingSystem().c_str()));
    serverProductInfoPane->setProperty("itemManagementUI", QString::fromUtf8(items->at(itemIndex).getManagementUI().c_str()));
    serverProductInfoPane->setProperty("itemIntroduction", QString::fromUtf8(items->at(itemIndex).getIntroduction().c_str()));
    serverProductInfoPane->setProperty("itemFileSize", QString::fromUtf8(items->at(itemIndex).getFileSize().c_str()));
    serverProductInfoPane->setProperty("introductionURL", QString::fromUtf8(items->at(itemIndex).getIntroductionURL().c_str()));
    serverProductInfoPane->setProperty("itemProfile0CPU", items->at(itemIndex).getProfile0CPU());
    serverProductInfoPane->setProperty("itemProfile0RAM", items->at(itemIndex).getProfile0RAM());
    serverProductInfoPane->setProperty("itemProfile1CPU", items->at(itemIndex).getProfile1CPU());
    serverProductInfoPane->setProperty("itemProfile1RAM", items->at(itemIndex).getProfile1RAM());
    serverProductInfoPane->setProperty("itemProfile2CPU", items->at(itemIndex).getProfile2CPU());
    serverProductInfoPane->setProperty("itemProfile2RAM", items->at(itemIndex).getProfile2RAM());
    serverProductInfoPane->setProperty("itemMainPort", items->at(itemIndex).getPort());
}

void Mall::cancelDownload()
{
    HtmlFileDownloader::getInstance()->cancelCurrentDownload();
}

void Mall::updateMallRepoUrl(QString qstring)
{
    ServantBase::getInstance()->getConfigManager()->setRemoteServiceHost(qstring.toUtf8().data());
    emit updateRepositoryButtonClicked();
}

void Mall::getIpify()
{
    QObject *diagnosisPaneIpifyLabel = MainWindow::getUi()->findChild<QObject*>(QString::fromStdString("diagnosisPaneIpifyLabel"));
    diagnosisPaneIpifyLabel->setProperty("label2", QString::fromUtf8(DiagnosisUtilities::getInstance()->getIpFromIpify().c_str()));
}

void Mall::triggerWebsitePulse()
{
    WindowsUtilities::startURI("https://www.websitepulse.com/tools/server-test");
}

void Mall::startURI(QString uri)
{
    WindowsUtilities::startURI(uri.toStdString());
}

