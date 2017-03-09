#include "myserver.h"
#include "mainwindow.h"
MyServer *MyServer::instance = nullptr;

MyServer::MyServer(QObject *parent) : QObject(parent)
{
    instance = this;
    packageManager = ServantBase::getInstance()->getPackageManager();
    connect(this, &MyServer::readyToInstallPackage, this, &MyServer::installPackage);
    connect(this, &MyServer::installProgressChanged, this, &MyServer::updateInstallUI);
    connect(this, &MyServer::installFinished, this, &MyServer::updateAfterInstall);
    connect(this, &MyServer::readyToBootServer, this, &MyServer::bootServer);
    connect(this, &MyServer::readyToShutdownServer, this, &MyServer::shutdownServer);
    connect(this, &MyServer::modifyFinished, this, &MyServer::closeModifyUI);
    addingServerPane = MainWindow::getUi()->findChild<QObject*>("addingServerPane");
    serverInfoPane = MainWindow::getUi()->findChild<QObject*>("serverInfoPane");
    overviewModuleServerQuickAction0 = MainWindow::getUi()->findChild<QObject*>("overviewModuleServerQuickAction0");
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
    std::wstring pathwstring = packageManager->getUserDataDirWstring() + ((itemIndex == 0)? L"/FTPSvr.ova" : L"/joomlaSvr.ova");
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
    if(packageManager->getMachines()->back().getName().find(L"FTP") != std::wstring::npos)
    {
        overviewModuleServerQuickAction0->setProperty("type", "FTP");
        overviewModuleServerQuickAction0->setProperty("imageSource", "qrc:///icon/ic_folder_black_48dp_2x.png");
        serverInfoPane->setProperty("itemIndex", 0);
    }
    else
    {
        overviewModuleServerQuickAction0->setProperty("type", "Joomla");
        overviewModuleServerQuickAction0->setProperty("imageSource", "qrc:///icon/Joomla-flat-logo-en.png");
        serverInfoPane->setProperty("itemIndex", 1);
    }
    overviewModuleServerQuickAction0->setProperty("name", QString::fromStdWString(packageManager->getMachines()->back().getName()));
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
    emit modifyFinished();
}

void MyServer::closeModifyUI()
{
    serverStateChangingPane->setProperty("visible", false);
}
