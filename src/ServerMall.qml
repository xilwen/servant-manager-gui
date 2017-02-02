import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Pane {
    id: serverMallPane
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
    objectName:"serverMallPane"

    Pane {
        id: serverMallBanner
        height: 156
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        Material.theme: Material.Dark
        Material.elevation: 3

        Label {
            id: label1
            x: -4
            y: -1
            text: qsTr("伺服器商城")
            anchors.verticalCenterOffset: -20
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 28
            anchors.leftMargin: 10
            anchors.left: parent.left
            font.family: "Microsoft JhengHei UI"
        }
        Label {
            id: label
            text: qsTr("探索並取得您需要的伺服器")
            font.pointSize: 14
            anchors.top: label1.bottom
            anchors.topMargin: 10
            anchors.left: label1.left
            anchors.leftMargin: 0
            font.family: "Microsoft JhengHei UI"
        }

        Button {
            id: button
            x: 470
            y: 111
            width: 126
            height: 40
            text: qsTr(" 線上服務設定")
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.family: "Microsoft JhengHei UI"
        }
    }

    Label {
        id: label2
        text: qsTr("檔案伺服器")
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: serverMallBanner.bottom
        anchors.topMargin: 25
        font.pointSize: 22
        font.family: "Microsoft JhengHei UI"
        Button {
            id: serverButton
            width: 110
            height: 170
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.bottom
            anchors.topMargin: 15
            Material.elevation: 3
            Material.background: "#ffffff"
            onClicked: {
                serverMallPane.visible = false
                serverProductInfoPane.visible = true
            }

            Image {
                id: image
                width: 85
                height: 85
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 15
                source: "icons/ic_folder_black_48dp_2x.png"
            }

            Label {
                id: label3
                text: qsTr("FTP 伺服器")
                anchors.top: image.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pointSize: 12
                font.family: "Microsoft JhengHei UI"

            }

            Label {
                id: label4
                text: qsTr("SERVANT")
                anchors.left: label3.left
                anchors.leftMargin: 0
                anchors.top: label3.bottom
                anchors.topMargin: 0
                Material.accent: Material.Grey
                font.pointSize: 10
                font.family: "Microsoft JhengHei UI"

            }
        }

    }
}
