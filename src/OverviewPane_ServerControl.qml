import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: serverInfoPane
    objectName: "serverInfoPane"
    width: 800
    height: 600
    visible: true
    property int itemIndex: 0
    property string serverName: ""
    property string serverType: ""
    property string serverIcon: ""
    property string serverPortNumber: ""
    property string serverManagementURL: ""
    property string serverShareURL: ""
    property string serverTipURL: ""
    //webmin status. 0 = disabled, 1 = force disabled, 2 = enabled
    property int webminStatus: 0
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
    onVisibleChanged: {
        if(visible){
            tmpCmd.updateServerControlUI(itemIndex)
            controlPane.indicatorPointer = 0
        }
    }

    BackButton {
        id: backButton
        pageName: qsTr("管理伺服器")
        z:3
        button.onClicked: {
            serverInfoPane.visible = false
            overviewPane_Normal.visible = true
        }
    }

    Flickable {
        id: flickable
        anchors.top: backButton.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        maximumFlickVelocity: 1500
        flickDeceleration: 2500
        contentHeight: serverQuickInfo.height + secondPanelHeight + mainInfoPane.height + 50
        property int secondPanelHeight: 0
        ScrollBar.vertical: ScrollBar { id: vbar; active: vbar.active }

        OverviewModule_ServerQuickInfo{
            id: serverQuickInfo
            width: 765
            anchors.horizontalCenterOffset: -5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: mainInfoPane.bottom
            anchors.topMargin: 15
        }

        OverviewModule_ServerQuickControl_ON {
            id: serverQuickControlPane_ON
            width: 765
            height: 125
            anchors.horizontalCenterOffset: -5
            anchors.horizontalCenter: parent.horizontalCenter
            objectName: "serverQuickControlPane_ON"
            anchors.top: serverQuickInfo.bottom
            anchors.topMargin: 15
            visible: false
            onVisibleChanged: {
                if(visible){
                    flickable.secondPanelHeight = serverQuickControlPane_ON.height
                }
            }
        }

        OverviewModule_ServerQuickControl_OFF {
            id: serverQuickControlPane_OFF
            width: 765
            height: 210
            anchors.horizontalCenterOffset: -5
            anchors.horizontalCenter: parent.horizontalCenter
            objectName: "serverQuickControlPane_OFF"
            anchors.top: serverQuickInfo.bottom
            anchors.topMargin: 15
            visible: false
            onVisibleChanged: {
                if(visible){
                    flickable.secondPanelHeight = serverQuickControlPane_OFF.height
                }
            }
        }

        Pane {
            id: mainInfoPane
            height: 130
            padding: 5
            leftPadding: 5
            rightPadding: 5
            topPadding: 5
            bottomPadding: 5
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 0
            Material.elevation: 0

            Image {
                id: serverIconImage
                width: 100
                height: 100
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 15
                source: serverIcon
            }

            Label {
                id: serverNameLabel
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 20
                text: serverName
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: serverIconImage.right
                anchors.leftMargin: 10
            }

            Label {
                id: serverTypeLabel
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                text: serverType
                anchors.top: serverNameLabel.bottom
                anchors.topMargin: 5
                anchors.left: serverNameLabel.left
                anchors.leftMargin: 0
            }

            ServerStateChangingPane{
                id: serverStateChangingPane
                x: 687
                width: 240
                height: 46
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 5
                visible: false
            }

            Button {
                id: button_ON
                objectName: "serverInfoPane_button_ON"
                x: 687
                width: 220
                height: 48
                text: qsTr("啟動伺服器")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
                anchors.rightMargin: 15
                Material.elevation: 2
                Material.background: "#4caf50"
                Material.foreground: "white"
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
                objectName: "serverInfoPane_button_OFF"
                x: 687
                width: 220
                height: 48
                text: qsTr("停止伺服器")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
                anchors.rightMargin: 15
                Material.elevation: 2
                Material.background: "#f44336"
                Material.foreground: "white"
                onClicked: {
                    serverQuickControlPane_OFF.visible = false
                    serverQuickControlPane_ON.visible = true
                    serverStateChangingPane.visible = true
                    button_OFF.visible = false
                    button_ON.visible = true
                    tmpCmd.shutdownServer(itemIndex)
                }
            }
        }
    }
}
