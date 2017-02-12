import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Pane {
    id: serverInfoPane
    visible: true

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
    objectName:"serverInfoPane"

    Pane {
        id: banner
        height: 45
        rightPadding: 0
        bottomPadding: 0
        leftPadding: 0
        topPadding: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.background: Material.BlueGrey
        Material.foreground: "#ffffff"
        Material.elevation: 5

        Label {
            id: label
            text: qsTr(" 伺服器狀態")
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
            anchors.left: button.right
            anchors.leftMargin: 0
            anchors.verticalCenter: parent.verticalCenter
        }

        Button {
            id: button
            width: 47
            height: 48
            text: qsTr("     ")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.verticalCenter: parent.verticalCenter
            Material.elevation: 0
            Image{
                width: 24
                height: 24
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "icon/ic_arrow_back_white_24dp_1x.png"
            }
            onClicked: {
                overviewPane.visible = true
                serverInfoPane.visible = false
            }
        }
    }

    Label {
        id: label4
        objectName: "serverInfoName"
        text: "ServerName"
        font.family: "Microsoft JhengHei UI"
        anchors.left: parent.left
        anchors.leftMargin: 21
        anchors.top: parent.top
        anchors.topMargin: 60
        font.pointSize: 24

        Label {
            id: label5
            text: "FTP 檔案伺服器"
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            anchors.top: parent.top
            anchors.topMargin: 40

            ProgressBar {
                id: progressBar2
                objectName: "progressBar2"
                indeterminate: true
                visible: false
                anchors.right: parent.right
                anchors.rightMargin: -400
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 40
                value: 0.5
            }

            Button {
                id: button2
                x: 0
                y: 40
                width: 300
                objectName: "button2"
                text: "關機"
                font.family: "Microsoft JhengHei UI"
                visible: false
                onClicked: mainWindow.shutdown()
                Material.background: Material.BlueGrey
                Material.foreground: "#ffffff"
                Material.elevation: 0
            }

            Button {
                id: button7
                objectName: "bootButton"
                width: 300
                text: "開機"
                font.family: "Microsoft JhengHei UI"
                visible: true
                anchors.left: button2.left
                anchors.leftMargin: 0
                anchors.top: button2.top
                anchors.topMargin: 0
                onClicked: mainWindow.boot()
                Material.background: Material.BlueGrey
                Material.foreground: "#ffffff"
                Material.elevation: 0
            }

            Button {
                id: button8
                objectName: "startWebControlButton"
                x: 0
                y: 112
                width: 300
                text: "啟動Web管理介面"
                visible: false
                font.family: "Microsoft JhengHei UI"
                Material.foreground: "#ffffff"
                anchors.top: button2.top
                anchors.left: button2.left
                anchors.topMargin: 56
                anchors.leftMargin: 313
                Material.background: Material.BlueGrey
                Material.elevation: 0
                onClicked: mainWindow.startWebmin()
            }

            Button {
                id: button9
                x: 1
                y: 119
                width: 300
                text: "刪除伺服器"
                visible: true
                font.family: "Microsoft JhengHei UI"
                Material.foreground: "#ffffff"
                anchors.top: button2.top
                anchors.left: button2.left
                anchors.topMargin: 56
                Material.background: Material.BlueGrey
                anchors.leftMargin: 0
                Material.elevation: 0
                onClicked: mainWindow.deleteVM()
            }
        }
    }


}
