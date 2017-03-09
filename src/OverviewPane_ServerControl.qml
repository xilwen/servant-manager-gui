import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: serverInfoPane
    width: 800
    height: 600
    visible: true
    property int itemIndex: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    topPadding: 0
    anchors.fill: parent
    Layout.columnSpan: 2
    Layout.fillHeight: true
    Layout.fillWidth: true
    objectName: "serverInfoPane"

    BackButton {
        id: backButton
        pageName: qsTr("管理伺服器")
        button.onClicked: {
            serverInfoPane.visible = false
            overviewPane_Normal.visible = true
        }
    }

    OverviewModule_ServerQuickInfo {
        id: serverQuickInfoPane
        anchors.top: backButton.bottom
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 15
    }

    OverviewModule_ServerQuickControl_ON {
        id: serverQuickControlPane_ON
        anchors.left: serverQuickInfoPane.right
        anchors.leftMargin: 15
        anchors.top: serverQuickInfoPane.top
        anchors.topMargin: 0
    }

    OverviewModule_ServerQuickControl_OFF {
        id: serverQuickControlPane_OFF
        anchors.left: serverQuickInfoPane.right
        anchors.leftMargin: 15
        anchors.top: serverQuickInfoPane.top
        anchors.topMargin: 0
    }

    Pane {
        id: pane
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Material.elevation: 3

        Button {
            id: button_ON
            width: 128
            text: qsTr("啟動伺服器")
            z: 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            Material.elevation: 0
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI";
            onClicked: {
                serverQuickControlPane_OFF.visible = false
                serverQuickControlPane_ON.visible = true
                serverStateChangingPane.visible = true
                button_OFF.visible = true
                button_ON.visible = false
                tmpCmd.bootServer(itemIndex)
            }
        }

        Button {
            id: button_OFF
            width: 128
            text: qsTr("停止伺服器")
            z: 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            Material.elevation: 0
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
            visible: false
            onClicked: {
                serverQuickControlPane_OFF.visible = false
                serverQuickControlPane_ON.visible = true
                serverStateChangingPane.visible = true
                button_OFF.visible = false
                button_ON.visibe = true
                tmpCmd.shutdownServer();
            }
        }
    }

    ServerStateChangingPane {
        id: serverStateChangingPane
        visible: false
    }
}
