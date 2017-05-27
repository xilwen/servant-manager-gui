import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: overviewPane_Normal
    objectName: "overviewPane"
    width: 800
    height: 600
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    onVisibleChanged: {
        if(visible){
            tmpCmd.triggerUpdateServerQuickAction();
            if(controlPane.noMachineCreated)
            {
                visible = false
                overviewPane_Empty.visible = true
            }
            controlPane.indicatorPointer = 0
        }
    }

    function showServerInfoPane(itemIndex)
    {
        overviewPane_Normal.visible = false
        serverInfoPane.itemIndex = itemIndex
        serverInfoPane.visible = true
    }

    OverviewModule_Info{
        id:overviewModuleInfo
        height: 160
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        titleText: qsTr("一切正常")
        infoText: qsTr("目前 SERVANT 服務正常運作中。")
        imageSource: "icon/MyServerPane.png"
        z:2
    }

    Flickable {
        id: flickable
        anchors.rightMargin: 0
        anchors.bottomMargin: 51
        anchors.leftMargin: 0
        anchors.topMargin: 160
        anchors.fill: parent
        maximumFlickVelocity: 1500
        flickDeceleration: 2500
        contentHeight: machinesPane.height
        ScrollBar.vertical: ScrollBar { id: vbar; active: vbar.active }
        Pane{
            id: machinesPane
            width: overviewModuleServerQuickAction0.x + (overviewModuleServerQuickAction0.width * 2) + (overviewModuleServerQuickAction1.anchors.leftMargin * 2)
            height: overviewModuleServerQuickAction1.y + (overviewModuleServerQuickAction0.height * 5) + (overviewModuleServerQuickAction2.anchors.topMargin * 5)
            anchors.horizontalCenterOffset: -5
            anchors.horizontalCenter: parent.horizontalCenter
            OverviewModule_ServerQuickAction
            {
                id:  overviewModuleServerQuickAction0
                objectName: "overviewModuleServerQuickAction0"
                x: 14
                width: 345
                height: 84
                anchors.top: parent.top
                anchors.topMargin: 25
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionName: qsTr("管理伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(0)
                }
                onClicked: {
                    showServerInfoPane(0)
                }
            }
            OverviewModule_ServerQuickAction
            {
                id:  overviewModuleServerQuickAction1
                objectName: "overviewModuleServerQuickAction1"
                y: 25
                width: 345
                height: 84
                anchors.left: overviewModuleServerQuickAction0.right
                anchors.leftMargin: 36
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionName: qsTr("管理伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(1)
                }
                onClicked: {
                    showServerInfoPane(1)
                }
            }
            OverviewModule_ServerQuickAction
            {
                id:  overviewModuleServerQuickAction2
                objectName: "overviewModuleServerQuickAction2"
                x: 14
                width: 345
                height: 84
                anchors.top: overviewModuleServerQuickAction0.bottom
                anchors.topMargin: 54
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionName: qsTr("管理伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(2)
                }
                onClicked: {
                    showServerInfoPane(2)
                }
            }

            OverviewModule_ServerQuickAction {
                id: overviewModuleServerQuickAction3
                objectName: "overviewModuleServerQuickAction3"
                width: 345
                height: 84
                anchors.left: overviewModuleServerQuickAction2.right
                anchors.leftMargin: 36
                anchors.top: overviewModuleServerQuickAction1.bottom
                anchors.topMargin: 54
                quickActionName: qsTr("管理伺服器")
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(3)
                }
                onClicked: {
                    showServerInfoPane(3)
                }
            }

            OverviewModule_ServerQuickAction {
                id: overviewModuleServerQuickAction4
                objectName: "overviewModuleServerQuickAction4"
                x: 14
                width: 345
                height: 84
                anchors.top: overviewModuleServerQuickAction2.bottom
                anchors.topMargin: 54
                quickActionName: qsTr("管理伺服器")
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(4)
                }
                onClicked: {
                    showServerInfoPane(4)
                }
            }

            OverviewModule_ServerQuickAction {
                id: overviewModuleServerQuickAction5
                objectName: "overviewModuleServerQuickAction5"
                y: 301
                width: 345
                height: 84
                anchors.left: overviewModuleServerQuickAction4.right
                anchors.leftMargin: 36
                quickActionName: qsTr("管理伺服器")
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(5)
                }
                onClicked: {
                    showServerInfoPane(5)
                }
            }

            OverviewModule_ServerQuickAction {
                id: overviewModuleServerQuickAction6
                objectName: "overviewModuleServerQuickAction6"
                x: 14
                width: 345
                height: 84
                anchors.top: overviewModuleServerQuickAction4.bottom
                anchors.topMargin: 54
                quickActionName: qsTr("管理伺服器")
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(6)
                }
                onClicked: {
                    showServerInfoPane(6)
                }
            }

            OverviewModule_ServerQuickAction {
                id: overviewModuleServerQuickAction7
                objectName: "overviewModuleServerQuickAction7"
                y: 439
                width: 345
                height: 84
                anchors.left: overviewModuleServerQuickAction6.right
                anchors.leftMargin: 36
                quickActionName: qsTr("管理伺服器")
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(7)
                }
                onClicked: {
                    showServerInfoPane(7)
                }
            }

            OverviewModule_ServerQuickAction {
                id: overviewModuleServerQuickAction8
                objectName: "overviewModuleServerQuickAction8"
                x: 14
                width: 345
                height: 84
                anchors.top: overviewModuleServerQuickAction6.bottom
                anchors.topMargin: 54
                quickActionName: qsTr("管理伺服器")
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(8)
                }
                onClicked: {
                    showServerInfoPane(8)
                }
            }

            OverviewModule_ServerQuickAction {
                id: overviewModuleServerQuickAction9
                objectName: "overviewModuleServerQuickAction9"
                y: 577
                width: 345
                height: 84
                anchors.left: overviewModuleServerQuickAction8.right
                anchors.leftMargin: 36
                quickActionName: qsTr("管理伺服器")
                imageSource: "icon/ic_folder_black_48dp_2x.png"
                type: qsTr("FTP伺服器")
                quickActionButton.onClicked: {
                    showServerInfoPane(9)
                }
                onClicked: {
                    showServerInfoPane(9)
                }
            }
        }
    }

    AddServerPane{
        id: addServerPane
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        visible:false
    }

    Pane {
        id: bottomPane
        y: 550
        height: 50
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        padding: 12
        Material.elevation: 3
        Material.background: "white"

        Button {
            id: button3
            x: 687
            width: 220
            height: 48
            text: qsTr("新增伺服器")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            onClicked: {
                overviewPane_Normal.visible = false
                serverMallPane.visible = true
                controlPane.indicatorPointer = 1
            }
        }
    }
}
