#include "mainwindow.h"
#include "VirtualMachine.h"
#include <QDebug>
#include <QDir>

MainWindow::MainWindow(QObject *ui) : QObject(), ui(ui)
{
    loadingProgressBar = ui->findChild<QObject*>("loadingProgressBar");
    statusLabel = ui->findChild<QObject*>("statusLabel");
    pane1 = ui->findChild<QObject*>("pane1");
    progressBar2 = ui->findChild<QObject*>("progressBar2");
    button2= ui->findChild<QObject*>("button2");
    serverInfoPane =  ui->findChild<QObject*>("serverInfoPane");
    fileDialog = ui->findChild<QObject*>("fileDialog");
    bootButton =  ui->findChild<QObject*>("bootButton");
    machinePane1 =  ui->findChild<QObject*>("machinePane1");
    serverInfoName = ui->findChild<QObject*>("serverInfoName");
    downloadProgress = ui->findChild<QObject*>("downloadProgress");
    newServerButton = ui->findChild<QObject*>("newServerButton");
    welcomePane = ui->findChild<QObject*>("welcomePane");
    perfMeterPane = ui->findChild<QObject*>("perfMeterPane");
    firstTimeFinishedPane = ui->findChild<QObject*>("firstTimeFinishedPane");
    overviewPane = ui->findChild<QObject*>("overviewPane");
    startWebControlButton = ui->findChild<QObject*>("startWebControlButton");

    connect(this, &MainWindow::importStatusChanged, this, &MainWindow::updateImportBusy);

    statusLabel->setProperty("text", "初始化VirtualBox抽象層伺服器...");
    QGuiApplication::processEvents();
    try
    {
        holder = new vBoxWrapperHolder(QDir::homePath().toStdString() + "/SERVANT/vBoxWrapper.exe");
    }
    catch(std::exception &e)
    {
        if(holder)
            delete holder;
        qDebug() << QString::fromStdString("You should start vBoxWrapper by yourself\n" + std::string(e.what()));
    }
    if(holder)
    {
        holder->start();
    }

    statusLabel->setProperty("text", "初始化VirtualBox抽象層...");
    QGuiApplication::processEvents();
    client = new vBoxWrapperClient;
    while(client->message() == nullptr)
    {
        client->connect();
        QGuiApplication::processEvents();
    }
    client->handShake();
    statusLabel->setProperty("text", "初始化套件管理系統...");
    QGuiApplication::processEvents();
    pm = new packageManager(client->message()->message(L"get userHomePath"), client);
    if(pm->isFirstTime())
    {
        welcomePane->setProperty("visible", true);
    }
    else
    {
        serverInfoPane->setProperty("visible", false);
    }
    if(pm->getMachines()->empty())
    {
        machinePane1->setProperty("visible", false);
    }
    pane1->setProperty("visible", false);
    perfm = new PerformanceManager;
    QGuiApplication::processEvents();
}

void MainWindow::boot()
{
    bootButton->setProperty("visible", false);
    QGuiApplication::processEvents();
    progressBar2->setProperty("visible", true);
    QGuiApplication::processEvents();
    pm->getMachines()->back().launch();
    std::wcout << L"Waiting For Server Ready..." << std::endl;
    QGuiApplication::processEvents();
    client->waitForPortOpen();
    progressBar2->setProperty("visible", false);
    button2->setProperty("visible", true);
    startWebControlButton->setProperty("visible", true);
    QGuiApplication::processEvents();
}

void MainWindow::shutdown()
{
    std::wstring msg;
    pm->getMachines()->back().sendPowerOffSignal();
    button2->setProperty("visible", false);
    progressBar2->setProperty("visible", true);
    progressBar2->setProperty("indeterminate", true);
    QGuiApplication::processEvents();
    do
    {
        msg = client->message()->message(L"get machineState");
        QGuiApplication::processEvents();
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
    }
    while(msg != L"PoweredOff");
    std::wcout << L"Machine Powered Off!" << std::endl;
    progressBar2->setProperty("visible", false);
    bootButton->setProperty("visible", true);
    startWebControlButton->setProperty("visible", false);
    QGuiApplication::processEvents();
}

MainWindow::~MainWindow()
{
    if(holder)
        delete holder;
    if(perfm)
        delete perfm;
    if(pm)
        delete pm;
    if(client)
        delete client;
}

void MainWindow::importPackage()
{   
    QString path = fileDialog->property("fileUrl").toString();
    std::wstring pathwstring = path.toStdWString();
    //TODO supress file:/// by Qt stuff
    pathwstring = pathwstring.substr(8);
    std::wcout << pathwstring << std::endl;
    machinePane1->setProperty("visible", true);
    machinePane1->setProperty("serverSubtitle", QString::fromStdWString(L"正在安裝..."));
    machinePane1->setProperty("importProgressVisible", true);
    std::wcout << pm->importOVA(pathwstring) << std::endl;
    std::thread importThread(&MainWindow::importListener, this);
    importThread.detach();
}

void MainWindow::importPackageDownloaded()
{
    std::wstring pathwstring = pm->getUserDataDirWstring() + L"/FTPSvr.ova";
    machinePane1->setProperty("visible", true);
    machinePane1->setProperty("serverSubtitle", QString::fromStdWString(L"正在安裝..."));
    machinePane1->setProperty("importProgressVisible", true);
    std::wcout << pm->importOVA(pathwstring) << std::endl;
    std::thread importThread(&MainWindow::importListener, this);
    importThread.detach();
}

void MainWindow::importListener()
{

    while(!pm->OVAImportCompleted())
    {
        std::wcout << pm->OVAImportProgress() << "...";
        importStatusChanged(pm->OVAImportProgress());
        std::this_thread::sleep_for(std::chrono::milliseconds(250));
    }
    importStatusChanged(100);
}

void MainWindow::updateImportBusy(int progress)
{
    machinePane1->setProperty("importProgressValue", (double)progress / 100);
    if(progress > 0){
        machinePane1->setProperty("importProgressIndeterminate", false);
    }
    else
    {
        machinePane1->setProperty("importProgressIndeterminate", true);
    }
    if(progress == 100)
    {
        machinePane1->setProperty("importProgressVisible", false);
        if(pm->OVAImportSucceeded())
        {
            machinePane1->setProperty("serverTitle", QString::fromStdWString(pm->getMachines()->back().getName()));
            machinePane1->setProperty("serverSubtitle", QString::fromStdWString(L"FTP伺服器"));
        }
    }
}

void MainWindow::setName0()
{
    if(!pm->getMachines()->empty())
    {
        serverInfoName->setProperty("text", QString::fromStdWString(pm->getMachines()->front().getName()));
    }
}

void MainWindow::setName1()
{
    serverInfoName->setProperty("text", QString::fromStdWString(pm->getMachines()->back().getName()));
}

void MainWindow::startDownload()
{
    downloadProgress->setProperty("visible", true);
    htmlFileDownloader hfd;
    hfd.startDownload("http://localhost/FTPSvr.ova", pm->getUserDataDir() + "/FTPSvr.ova");
    while(hfd.isDownloading())
    {
        downloadProgress->setProperty("value", (double)hfd.downloadProgress() / 100);
        QGuiApplication::processEvents();
    }
    if(hfd.succeededLastTime())
    {
        downloadProgress->setProperty("visible", false);
        newServerButton->setProperty("visible", true);
    }
}

void MainWindow::runFirstTimeWorker()
{
    welcomePane->setProperty("visible", false);
    perfMeterPane->setProperty("visible", true);
    QGuiApplication::processEvents();
    std::this_thread::sleep_for(std::chrono::milliseconds(250));
    qDebug() << "VMX Status " << perfm->getVirtualizationSupportStatus();
    QGuiApplication::processEvents();
    firstTimeUtilities::runMemoryTest();
    QGuiApplication::processEvents();
    firstTimeUtilities::runDiskTest();
    firstTimeUtilities::runProcessorTest();
    perfMeterPane->setProperty("visible", false);
    firstTimeFinishedPane->setProperty("visible", true);
}

void MainWindow::deleteVM()
{
    pm->DeleteMachine(pm->getMachines()->back().getUuid());
    machinePane1->setProperty("visible", false);
    serverInfoPane->setProperty("visible", false);
    overviewPane->setProperty("visible", true);
}

void MainWindow::startWebmin()
{
    //TODO dirty, really dirty!
    system("start http://127.0.0.1:10000");
}
