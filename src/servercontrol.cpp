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
    connect(this, &ServerControl::startWebminTriggered, this, &ServerControl::startWebmin);
    connect(this, &ServerControl::stopWebminTriggered, this, &ServerControl::stopWebmin);
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
    serverInfoPane->setProperty("serverPortNumber", QString::fromStdString(std::to_string(machine->getCustomPortNumber())));
    QString serverManagementURLString;
    serverManagementURLString += "http://127.0.0.1";
    if(machine->getManagementPort() != 0)
    {
        serverInfoPane->setProperty("noManagementWebUI", false);
        serverManagementURLString += (":" + QString::fromStdString(std::to_string(machine->getManagementPort())));
    }
    else
    {
        serverInfoPane->setProperty("noManagementWebUI", true);
    }
    serverManagementURLString += "/";
    if(!machine->getManagementURL().empty())
    {
        serverManagementURLString += QString::fromUtf8(machine->getManagementURL().c_str());
    }
    serverInfoPane->setProperty("serverManagementURL", serverManagementURLString);
    QString serverShareURLString;
    if(!machine->getProtocol().empty())
    {
        serverShareURLString += (QString::fromUtf8(machine->getProtocol().c_str()) + "://") ;
    }
    serverShareURLString += (((machine->isUseLocalIP())?QString::fromUtf8(ConfigManager::getInstance()->getLocalIPAddress().c_str()) :
                                                        QString::fromStdString(DiagnosisUtilities::getInstance()->getIpFromIpify())));
    if(!machine->getProtocol().empty())
    {
        serverShareURLString += (":" + QString::fromStdString(std::to_string(machine->getPortNumber())) + "/" +
                                 QString::fromUtf8(machine->getShareURL().c_str()));
    }
    serverInfoPane->setProperty("serverShareURL", serverShareURLString);
    serverInfoPane->setProperty("serverIcon", QString::fromUtf8(machine->getIconPath().c_str()));
    serverInfoPane->setProperty("serverTipURL", QString::fromUtf8(machine->getTipURL().c_str()));
    if(DiagnosisUtilities::getInstance()->portIsUsing(10000)){
        if(machine->webminEnabled())
        {
            serverInfoPane->setProperty("webminStatus", 2);
        }
        else
        {
            serverInfoPane->setProperty("webminStatus", 1);
        }
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

void ServerControl::startWebmin(int itemIndex)
{
    PackageManager::getInstance()->getMachines()->at(itemIndex).enableWebmin();
}

void ServerControl::stopWebmin(int itemIndex)
{
    PackageManager::getInstance()->getMachines()->at(itemIndex).disableWebmin();
}
