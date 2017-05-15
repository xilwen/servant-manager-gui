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
    if(packageManager->OVAImportSucceeded())
    {
        auto items(ServantBase::getInstance()->getMallManager()->getItemList());
        items->at(itemIndex).installAdditionalInfoToLastInstalledMachine();
        installProgressChanged(100);
        emit installFinished();
    }
}

void MyServer::updateInstallUI(int progress)
{
    addingServerPane->setProperty("progressText", QString::fromStdString(std::to_string(progress) + " %"));
}

void MyServer::updateAfterInstall()
{
    addingServerPane->setProperty("visible", false);
    serverInfoPane->setProperty("visible", true);
    updateServerQuickAction();
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
    std::thread(&MyServer::bootServerRunner, this).detach();
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
    do
    {
        msg = ServantBase::getInstance()->getVBoxWrapperClient()->message()->message(L"get machineState");
        std::this_thread::sleep_for(std::chrono::milliseconds(200));
    }
    while(msg != L"PoweredOff");
    emit ServerControl::getInstance()->readyToUpdateServerControlUI(itemIndex);
    emit modifyFinished();
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
