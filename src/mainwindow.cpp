#include "mainwindow.h"
#include "VirtualMachine.hpp"
#include <QDebug>
#include <QDir>

QObject *MainWindow::ui = nullptr;

MainWindow::MainWindow(QObject *ui) : QObject()
{
    connect(this, &MainWindow::servantBaseIsReady, this, &MainWindow::hideLoadingUI);
    MainWindow::ui = ui;
    loadingScreen = new LoadingScreen;
    loadingScreen->setVisible(true);
    loadingScreen->setStatusText(L"Now Loading");
    std::thread(&MainWindow::initSERVANTBaseRunner, this).detach();
}

MainWindow::~MainWindow()
{
    if(loadingScreen)
        delete loadingScreen;
}

QObject *MainWindow::getUi()
{
    return ui;
}

void MainWindow::initSERVANTBaseRunner()
{
    ServantBase::getInstance()->initialWithLocalWrapper();
    emit servantBaseIsReady();
}

void MainWindow::hideLoadingUI()
{
    loadingScreen->setVisible(false);
}


