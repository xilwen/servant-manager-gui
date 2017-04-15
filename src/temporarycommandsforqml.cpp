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

void TemporaryCommandsForQml::shutdownServer()
{
    emit MyServer::getInstance()->readyToShutdownServer();
}

void TemporaryCommandsForQml::updateServerControlUI(const QString &machineName)
{
    emit ServerControl::getInstance()->readyToUpdateServerControlUI(machineName);
}

void TemporaryCommandsForQml::deleteServer(const QString &machineName)
{
    emit ServerControl::getInstance()->readyToDeleteServer(machineName);
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
