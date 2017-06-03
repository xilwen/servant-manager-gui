#include "temporarycommandsforqml.h"
#include "firsttimesetup.h"
#include "mall.h"
#include "myserver.h"
#include "servercontrol.h"
#include "perference.h"

TemporaryCommandsForQml::TemporaryCommandsForQml(QObject *parent) : QObject(parent)
{

}

void TemporaryCommandsForQml::runHardwareAssessment()
{
    emit FirstTimeSetup::getInstance()->readyToAssessHardware();
}

void TemporaryCommandsForQml::runDownloader(int itemIndex)
{
    emit Mall::getInstance()->readyToDownloadPackage(itemIndex);
}

void TemporaryCommandsForQml::runInstaller(int itemIndex)
{
    emit MyServer::getInstance()->installPackage(itemIndex);
}

void TemporaryCommandsForQml::bootServer(int itemIndex)
{
    emit MyServer::getInstance()->readyToBootServer(itemIndex);
}

void TemporaryCommandsForQml::shutdownServer(int itemIndex)
{
    emit MyServer::getInstance()->readyToShutdownServer(itemIndex);
}

void TemporaryCommandsForQml::updateServerControlUI(int itemIndex)
{
    emit ServerControl::getInstance()->readyToUpdateServerControlUI(itemIndex);
}

void TemporaryCommandsForQml::deleteServer(int itemIndex)
{
    emit ServerControl::getInstance()->readyToDeleteServer(itemIndex);
}

void TemporaryCommandsForQml::updateAboutPane()
{
    emit Perference::getInstance()->readyToUpdateAboutData();
}

void TemporaryCommandsForQml::triggerMallItemViewUpdate()
{
    emit Mall::getInstance()->updateMallItemViewTriggered();
}

void TemporaryCommandsForQml::triggerMallDetailViewUpdate()
{
    emit Mall::getInstance()->updateMallDetailView();
}

void TemporaryCommandsForQml::triggerRepositoryUpdate()
{
    emit Mall::getInstance()->updateRepositoryButtonClicked();
}

void TemporaryCommandsForQml::triggerCancelDownload()
{
    emit Mall::getInstance()->cancelDownloadTriggered();
}

void TemporaryCommandsForQml::triggerMallRepoUrlUpdate(QString qstring)
{
    emit Mall::getInstance()->updateMallRepoUrlTriggered(qstring);
}

void TemporaryCommandsForQml::triggerGetMallRepoUrl()
{
    emit Mall::getInstance()->getMallRepoUrlTriggered();
}

void TemporaryCommandsForQml::triggerUpdateServerQuickAction()
{
    emit MyServer::getInstance()->updateServerQuickActionTriggered();
}

void TemporaryCommandsForQml::triggerIpify()
{
    emit Mall::getInstance()->getIpifyTriggered();
}

void TemporaryCommandsForQml::triggerNetworkInfo()
{
    emit MyServer::getInstance()->networkInfoTriggered();
}

void TemporaryCommandsForQml::triggerWebsitePulse()
{
    emit Mall::getInstance()->websitePulseTriggered();
}

void TemporaryCommandsForQml::triggerStartURI(QString uri)
{
    emit Mall::getInstance()->startURITriggered(uri);
}

void TemporaryCommandsForQml::triggerFirstTimeIP()
{
    emit FirstTimeSetup::getInstance()->triggerFirstTimeIPUpdate();
}

void TemporaryCommandsForQml::triggerSetupLocalIP(QString ipAddress)
{
    emit MyServer::getInstance()->setupLocalIPTriggered(ipAddress);
}

void TemporaryCommandsForQml::triggerSettingPaneUpdate()
{
    emit Perference::getInstance()->settingPaneUpdateTriggered();
}


