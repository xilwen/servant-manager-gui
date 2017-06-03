#include "firsttimesetup.h"
#include "ServantBase.hpp"
#include "qtutilities.h"
#include "mainwindow.h"
#include <thread>

FirstTimeSetup *FirstTimeSetup::instance = nullptr;

FirstTimeSetup::FirstTimeSetup(QObject *parent) : QObject(parent)
{
    welcomePane = MainWindow::getUi()->findChild<QObject*>("welcomePane");
    perfMeterPane = MainWindow::getUi()->findChild<QObject*>("perfMeterPane");
    firstTimeFinishedPane = MainWindow::getUi()->findChild<QObject*>("firstTimeFinishedPane");
    welcomeIPPane =  MainWindow::getUi()->findChild<QObject*>("welcomeIPPane");
    connect(this, &FirstTimeSetup::readyToAssessHardware, this, &FirstTimeSetup::runHardwareAssessment);
    connect(this, &FirstTimeSetup::hardwareAssessmentFinished, this, &FirstTimeSetup::showFinishedScreen);
    connect(this, &FirstTimeSetup::triggerFirstTimeIPUpdate, this, &FirstTimeSetup::firstTimeIPUpdate);
    instance = this;
}

void FirstTimeSetup::setVisible(bool visible)
{
    QtUtilities::setVisible(welcomePane, visible);
}

void FirstTimeSetup::runHardwareAssessment()
{
    std::thread(&FirstTimeSetup::hardwareAssessmentRunner, this).detach();
}

void FirstTimeSetup::hardwareAssessmentRunner()
{
    FirstTimeUtilities::runProcessorTest();
    FirstTimeUtilities::runDiskTest();
    FirstTimeUtilities::runMemoryTest();
    PerformanceManager::getInstance()->writeDataToFile();
    ServantBase::getInstance()->getMallManager()->updateItemList();
    emit hardwareAssessmentFinished();
}

void FirstTimeSetup::showFinishedScreen()
{
    QtUtilities::setVisible(perfMeterPane, false);
    QtUtilities::setVisible(firstTimeFinishedPane, true);
}

void FirstTimeSetup::firstTimeIPUpdate()
{
    WindowsUtilities::ipconfigAndSave();
    welcomeIPPane->setProperty("ipconfigText", QString::fromLocal8Bit(WindowsUtilities::getIpconfig().c_str()));
}

FirstTimeSetup *FirstTimeSetup::getInstance()
{
    return instance;
}

FirstTimeSetup::~FirstTimeSetup()
{
    instance = nullptr;
}
