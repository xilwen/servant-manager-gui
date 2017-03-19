#include "perference.h"
#include "mainwindow.h"

Perference *Perference::instance = nullptr;

Perference::Perference(QObject *parent): QObject(parent)
{
    instance = this;
    aboutPane = MainWindow::getUi()->findChild<QObject*>("aboutPane");
    connect(this, &Perference::readyToUpdateAboutData, this, &Perference::updateAboutData);
}

void Perference::updateAboutData()
{
    if(aboutPane)
    {
        aboutPane->setProperty("vmxSupported", (PerformanceManager::getInstance()->getVirtualizationSupportStatus())? "Yes" : "No");
        aboutPane->setProperty("cpuRate", QString::fromStdString(std::to_string(PerformanceManager::getInstance()->getProcessorRate())));
        aboutPane->setProperty("ramRate", QString::fromStdString(std::to_string(PerformanceManager::getInstance()->getMemoryRate())));
        aboutPane->setProperty("diskRate", QString::fromStdString(std::to_string(PerformanceManager::getInstance()->getDiskRate())));
        aboutPane->setProperty("version", __DATE__);
    }
}

Perference::~Perference()
{
    instance = nullptr;
}

Perference *Perference::getInstance()
{
    return instance;
}
