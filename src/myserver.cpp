#include "myserver.h"
#include "mainwindow.h"
MyServer *MyServer::instance = nullptr;

MyServer::MyServer(QObject *parent) : QObject(parent)
{
    instance = this;
    connect(this, &MyServer::readyToInstallPackage, this, &MyServer::installPackage);
    connect(this, &MyServer::installProgressChanged, this, &MyServer::updateInstallUI);
    connect(this, &MyServer::installFinished, this, &MyServer::updateAfterInstall);
    connect(this, &MyServer::readyToBootServer, this, &MyServer::bootServer);
    connect(this, &MyServer::readyToShutdownServer, this, &MyServer::shutdownServer);
    connect(this, &MyServer::modifyFinished, this, &MyServer::closeModifyUI);
    connect(this, &MyServer::updateServerQuickActionTriggered, this, &MyServer::updateServerQuickActionSlot);
    connect(this, &MyServer::networkInfoTriggered, this, &MyServer::openNetworkInfo);
    connect(this, &MyServer::setupLocalIPTriggered, this, &MyServer::setupLocalIP);
    connect(this, &MyServer::readyToExportPackage, this, &MyServer::exportPackage);
    connect(this, &MyServer::exportProgressChanged, this, &MyServer::updateExportProgress);
    connect(this, &MyServer::exportFinished, this, &MyServer::closeExportUI);
    packageManager = ServantBase::getInstance()->getPackageManager();
    addingServerPane = MainWindow::getUi()->findChild<QObject*>("addingServerPane");
    serverInfoPane = MainWindow::getUi()->findChild<QObject*>("serverInfoPane");
    serverStateChangingPane = MainWindow::getUi()->findChild<QObject*>("serverStateChangingPane");
    controlPane = MainWindow::getUi()->findChild<QObject*>("controlPane");
    for(unsigned int i = 0; i < overviewModuleServerQuickActionAmount; ++i)
    {
        QObject *overviewModuleServerQuickAction = MainWindow::getUi()->findChild<QObject*>(QString::fromStdString(std::string("overviewModuleServerQuickAction" + std::to_string(i))));
        overviewModuleServerQuickActions.push_back(overviewModuleServerQuickAction);
    }
}

MyServer::~MyServer()
{
    instance = nullptr;
}

MyServer *MyServer::getInstance()
{
    return instance;
}

void MyServer::installPackage(int itemIndex)
{
    addingServerPane->setProperty("visible", true);
    auto items(ServantBase::getInstance()->getMallManager()->getItemList());
    std::wstring filewstring = QString::fromStdString(items->at(itemIndex).getVboxImageFile()).toStdWString();
    std::wstring pathwstring = ServantBase::getInstance()->getProfileManager()->getUserDataDirWstring() + L"/" + filewstring;
    this->itemIndex = itemIndex;
    packageManager->importOVA(pathwstring);
    std::thread(&MyServer::packageInstallRunner, this).detach();
}

void MyServer::packageInstallRunner()
{
    while(!packageManager->OVAImportCompleted())
    {
        installProgressChanged(packageManager->OVAImportProgress());
        std::this_thread::sleep_for(std::chrono::milliseconds(250));
    }
    if(!packageManager->OVAImportSucceeded())
    {
        return;
    }
    auto items(ServantBase::getInstance()->getMallManager()->getItemList());
    items->at(itemIndex).installAdditionalInfoToLastInstalledMachine();
    QObject *serverProductInfoPane = MainWindow::getUi()->findChild<QObject*>("serverProductInfoPane");
    if(!serverProductInfoPane->property("newServerName").toString().isEmpty())
    {
        packageManager->getMachines()->back().rename(
                    serverProductInfoPane->property("newServerName").toString().toStdWString());
    }
    packageManager->getMachines()->back().setCPUAmount(
                serverProductInfoPane->property("newServerCPU").toInt());
    packageManager->getMachines()->back().setRAMAmount(
                serverProductInfoPane->property("newServerRAM").toInt());
    packageManager->getMachines()->back().saveCustomPort(serverProductInfoPane->property("newServerPort").toInt());
    packageManager->getMachines()->back().addPortForwardingRule(
                serverProductInfoPane->property("itemMainPort").toInt(),
                serverProductInfoPane->property("newServerPort").toInt());
    packageManager->getMachines()->back().saveUseLocalIP(
                serverProductInfoPane->property("onlyLANAccess").toBool());
    installProgressChanged(100);
    emit installFinished();
}

void MyServer::updateInstallUI(int progress)
{
    addingServerPane->setProperty("progressText", QString::fromStdString(std::to_string(progress) + " %"));
}

void MyServer::updateAfterInstall()
{
    updateServerQuickAction();
    auto items(ServantBase::getInstance()->getPackageManager()->getMachines());
    serverInfoPane->setProperty("itemIndex", items->size() - 1);
    addingServerPane->setProperty("visible", false);
    serverInfoPane->setProperty("visible", true);

}

void MyServer::updateServerQuickAction()
{    
    packageManager->refreshMachines();

    if(packageManager->getMachines()->empty())
    {
        controlPane->setProperty("noMachineCreated", true);
    }
    else
    {
        controlPane->setProperty("noMachineCreated", false);
    }

    for(unsigned int i = 0; i < overviewModuleServerQuickActionAmount; ++i)
    {
        if(packageManager->getMachines()->size() > i)
        {
            overviewModuleServerQuickActions.at(i)->setProperty("name", QString::fromStdWString(packageManager->getMachines()->at(i).getName()));
            overviewModuleServerQuickActions.at(i)->setProperty("imageSource", QString::fromUtf8(packageManager->getMachines()->at(i).getIconPath().c_str()));
            overviewModuleServerQuickActions.at(i)->setProperty("type", QString::fromUtf8(packageManager->getMachines()->at(i).getType().c_str()));
            overviewModuleServerQuickActions.at(i)->setProperty("visible", true);
        }
        else
        {
            overviewModuleServerQuickActions.at(i)->setProperty("visible", false);
        }
    }

}

void MyServer::bootServer(int itemIndex)
{
    this->itemIndex = itemIndex;
    if(DiagnosisUtilities::getInstance()->portIsUsing(PackageManager::getInstance()->getMachines()->at(itemIndex).getCustomPortNumber()) ||
            DiagnosisUtilities::getInstance()->portIsUsing(PackageManager::getInstance()->getMachines()->at(itemIndex).getManagementPort()) ||
            DiagnosisUtilities::getInstance()->portIsUsing(PackageManager::getInstance()->getMachines()->at(itemIndex).getSingletonPort())                                               )
    {
        serverInfoPane->setProperty("portIsUsed", true);
        return;
    }
    else
    {
        std::thread(&MyServer::bootServerRunner, this).detach();
    }
}

void MyServer::shutdownServer(int itemIndex)
{
    this->itemIndex = itemIndex;
    std::thread(&MyServer::shutdownServerRunner, this).detach();
}

void MyServer::bootServerRunner()
{
    packageManager->getMachines()->at(itemIndex).launch();
    //TODO Real Port!
    int port = 80;
    ServantBase::getInstance()->getVBoxWrapperClient()->waitForPortOpen(port);
    emit ServerControl::getInstance()->readyToUpdateServerControlUI(itemIndex);
    emit modifyFinished();
}

void MyServer::shutdownServerRunner()
{
    packageManager->getMachines()->at(itemIndex).sendPowerOffSignal();
    std::wstring msg;
    unsigned int waitMillisecond = 0;
    do
    {
        msg = ServantBase::getInstance()->getVBoxWrapperClient()->message()->message(L"get machineState");
        std::this_thread::sleep_for(std::chrono::milliseconds(200));
        waitMillisecond += 200;
        if(waitMillisecond > 5000)
        {
            packageManager->getMachines()->at(itemIndex).sendPowerOffSignal();
            waitMillisecond = 0;
        }
    }
    while(msg != L"PoweredOff");

    emit ServerControl::getInstance()->readyToUpdateServerControlUI(itemIndex);
    emit modifyFinished();
}

void MyServer::exportServerRunner()
{
    while(!packageManager->OVAImportCompleted())
    {
        exportProgressChanged(packageManager->OVAImportProgress());
        std::this_thread::sleep_for(std::chrono::milliseconds(250));
    }
    emit exportFinished();
}

void MyServer::closeModifyUI()
{
    serverStateChangingPane->setProperty("visible", false);
}

void MyServer::updateServerQuickActionSlot()
{
    updateServerQuickAction();
}

void MyServer::openNetworkInfo()
{
    WindowsUtilities::ipconfigAndSave();
    WindowsUtilities::startURI("C:\\SERVANT\\ipconfig.txt");
}

void MyServer::setupLocalIP(QString ipAddress)
{
    ConfigManager::getInstance()->setLocalIPAddress(ipAddress.toStdString());
}

void MyServer::exportPackage(int itemIndex, QString filePath)
{
    auto filePathWString(filePath.toStdWString());
    //substf file:///
    PackageManager::getInstance()->getMachines()->at(itemIndex).exportMachine(filePathWString.substr(8));
    std::thread(&MyServer::exportServerRunner, this).detach();
}

void MyServer::updateExportProgress(int progress)
{
    QObject *exportOVAStatusPane = MainWindow::getUi()->findChild<QObject*>("exportOVAStatusPane");
    exportOVAStatusPane->setProperty("precentage", progress);
}

void MyServer::closeExportUI()
{
    QObject *exportOVAStatusPane = MainWindow::getUi()->findChild<QObject*>("exportOVAStatusPane");
    exportOVAStatusPane->setProperty("visible", false);
}

