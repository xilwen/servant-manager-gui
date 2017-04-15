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
    packageManager = ServantBase::getInstance()->getPackageManager();
    addingServerPane = MainWindow::getUi()->findChild<QObject*>("addingServerPane");
    serverInfoPane = MainWindow::getUi()->findChild<QObject*>("serverInfoPane");
    overviewModuleServerQuickAction0 = MainWindow::getUi()->findChild<QObject*>("overviewModuleServerQuickAction0");
    overviewModuleServerQuickAction1 = MainWindow::getUi()->findChild<QObject*>("overviewModuleServerQuickAction1");
    overviewModuleServerQuickAction2 = MainWindow::getUi()->findChild<QObject*>("overviewModuleServerQuickAction2");
    serverStateChangingPane = MainWindow::getUi()->findChild<QObject*>("serverStateChangingPane");
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
    packageManager->OVAImportSucceeded();
    installProgressChanged(100);
    emit installFinished();
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
    std::vector<QObject*> qobjectsToUpdate = {overviewModuleServerQuickAction0, overviewModuleServerQuickAction1,
                                             overviewModuleServerQuickAction2};

    for(unsigned int i = 0; i < 3; ++i)
    {
        if(packageManager->getMachines()->size() > i)
        {
            if(packageManager->getMachines()->at(i).getName().find(L"FTP") != std::wstring::npos)
            {
                qobjectsToUpdate.at(i)->setProperty("type", "FTP");
                qobjectsToUpdate.at(i)->setProperty("imageSource", "qrc:///icon/ic_folder_black_48dp_2x.png");
                serverInfoPane->setProperty("itemIndex", 0);
            }
            else
            {
                qobjectsToUpdate.at(i)->setProperty("type", "Joomla");
                qobjectsToUpdate.at(i)->setProperty("imageSource", "qrc:///icon/Joomla-flat-logo-en.png");
                serverInfoPane->setProperty("itemIndex", 1);
            }
             qobjectsToUpdate.at(i)->setProperty("name", QString::fromStdWString(packageManager->getMachines()->at(i).getName()));
        }
        else
        {
            qobjectsToUpdate.at(i)->setProperty("visible", false);
        }
    }

}

void MyServer::bootServer(int itemIndex)
{
    this->itemIndex = itemIndex;
    std::thread(&MyServer::bootServerRunner, this).detach();
}

void MyServer::shutdownServer()
{
    std::thread(&MyServer::shutdownServerRunner, this).detach();
}

void MyServer::bootServerRunner()
{
    packageManager->getMachines()->back().launch();
    int port = (itemIndex == 0)? 21 : 80;
    ServantBase::getInstance()->getVBoxWrapperClient()->waitForPortOpen(port);
    emit ServerControl::getInstance()->readyToUpdateServerControlUI("DEMOONLY");
    emit modifyFinished();
}

void MyServer::shutdownServerRunner()
{
    packageManager->getMachines()->back().sendPowerOffSignal();
    std::wstring msg;
    do
    {
        msg = ServantBase::getInstance()->getVBoxWrapperClient()->message()->message(L"get machineState");
        std::this_thread::sleep_for(std::chrono::milliseconds(200));
    }
    while(msg != L"PoweredOff");
    emit ServerControl::getInstance()->readyToUpdateServerControlUI("DEMOONLY");
    emit modifyFinished();
}

void MyServer::closeModifyUI()
{
    serverStateChangingPane->setProperty("visible", false);
}
