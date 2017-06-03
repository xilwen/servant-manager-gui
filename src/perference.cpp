#include "perference.h"
#include "mainwindow.h"

Perference *Perference::instance = nullptr;

Perference::Perference(QObject *parent): QObject(parent)
{
    instance = this;
    aboutPane = MainWindow::getUi()->findChild<QObject*>("aboutPane");
    settingPane = MainWindow::getUi()->findChild<QObject*>("settingPane");
    connect(this, &Perference::readyToUpdateAboutData, this, &Perference::updateAboutData);
    connect(this, &Perference::settingPaneUpdateTriggered, this, &Perference::updateSettingPane);
}

void Perference::updateAboutData()
{
    if(aboutPane)
    {
        aboutPane->setProperty("vmxSupported", PerformanceManager::getInstance()->getVirtualizationSupportStatus());
        aboutPane->setProperty("cpuRate", QString::fromStdString(std::to_string(PerformanceManager::getInstance()->getProcessorRate())));
        aboutPane->setProperty("ramRate", QString::fromStdString(std::to_string(PerformanceManager::getInstance()->getMemoryRate())));
        aboutPane->setProperty("diskRate", QString::fromStdString(std::to_string(PerformanceManager::getInstance()->getDiskRate())));
        aboutPane->setProperty("version", __DATE__);
    }
}

void Perference::updateSettingPane()
{
    settingPane->setProperty("localIPAddress", QString::fromStdString(ConfigManager::getInstance()->getLocalIPAddress()));
    settingPane->setProperty("repoUrl", QString::fromStdString(ConfigManager::getInstance()->getRemoteServiceHost()));
}

Perference::~Perference()
{
    instance = nullptr;
}

Perference *Perference::getInstance()
{
    return instance;
}
