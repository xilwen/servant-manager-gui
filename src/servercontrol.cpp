#include "servercontrol.h"
#include "mainwindow.h"
#include "VirtualMachine.hpp"
#include "qtutilities.h"

ServerControl *ServerControl::instance = nullptr;

ServerControl::ServerControl(QObject *parent) : QObject(parent)
{
    instance = this;
    serverInfoPane = MainWindow::getUi()->findChild<QObject*>("serverInfoPane");
    serverQuickControlPane_ON = MainWindow::getUi()->findChild<QObject*>("serverQuickControlPane_ON");
    serverQuickControlPane_OFF = MainWindow::getUi()->findChild<QObject*>("serverQuickControlPane_OFF");
    serverInfoPane_button_ON = MainWindow::getUi()->findChild<QObject*>("serverInfoPane_button_ON");
    serverInfoPane_button_OFF = MainWindow::getUi()->findChild<QObject*>("serverInfoPane_button_OFF");

    connect(this, &ServerControl::readyToUpdateServerControlUI, this, &ServerControl::updateServerControlUI);
    connect(this, &ServerControl::readyToDeleteServer, this, &ServerControl::deleteServer);
}

ServerControl *ServerControl::getInstance()
{
    return instance;
}

void ServerControl::updateServerControlUI(int itemIndex)
{
    auto machine = PackageManager::getInstance()->getMachines()->at(itemIndex).getInstance();
    if(machine->getStatus() == VirtualMachineState::PoweredOff)
    {
        QtUtilities::setVisible(serverQuickControlPane_OFF, true);
        QtUtilities::setVisible(serverQuickControlPane_ON, false);
        QtUtilities::setVisible(serverInfoPane_button_ON, true);
        QtUtilities::setVisible(serverInfoPane_button_OFF, false);
    }
    else if(machine->getStatus() == VirtualMachineState::Running)
    {
        QtUtilities::setVisible(serverQuickControlPane_OFF, false);
        QtUtilities::setVisible(serverQuickControlPane_ON, true);
        QtUtilities::setVisible(serverInfoPane_button_ON, false);
        QtUtilities::setVisible(serverInfoPane_button_OFF, true);
    }
    else
    {
        QtUtilities::setVisible(serverQuickControlPane_OFF, false);
        QtUtilities::setVisible(serverQuickControlPane_ON, false);
        QtUtilities::setVisible(serverInfoPane_button_ON, false);
        QtUtilities::setVisible(serverInfoPane_button_OFF, false);
    }

    serverInfoPane->setProperty("serverName", QString::fromStdWString(machine->getName()));
    serverInfoPane->setProperty("serverType", QString::fromUtf8(machine->getType().c_str()));
    serverInfoPane->setProperty("serverPortNumber", QString::fromStdString(std::to_string(machine->getPortNumber())));
    serverInfoPane->setProperty("serverManagementURL", QString::fromUtf8(machine->getManagementURL().c_str()));
    serverInfoPane->setProperty("serverShareURL", QString::fromUtf8(machine->getShareURL().c_str()));
    serverInfoPane->setProperty("serverIcon", QString::fromUtf8(machine->getIconPath().c_str()));
    serverInfoPane->setProperty("serverPortNumber", machine->getManagementPort());
    if(DiagnosisUtilities::getInstance()->portIsUsing(10000)){
        serverInfoPane->setProperty("webminStatus", 1);
    } else {
        serverInfoPane->setProperty("webminStatus", 0);
    }
}

void ServerControl::deleteServer(int itemIndex)
{
    PackageManager::getInstance()->DeleteMachine(PackageManager::getInstance()->getMachines()->at(itemIndex).getUuid());
    QObject *overviewPane = MainWindow::getUi()->findChild<QObject*>("overviewPane");
    overviewPane->setProperty("visible", true);
}
