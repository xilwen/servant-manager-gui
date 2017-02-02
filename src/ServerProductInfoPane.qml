import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Pane {
    id: serverProductInfoPane
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
        Material.theme: Material.Dark
        Material.elevation: 5

        Label {
            id: label
            text: qsTr(" FTP 伺服器")
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
                source: "./icons/ic_arrow_back_white_24dp_2x.png"
            }
            onClicked:{
                serverProductInfoPane.visible = false
                serverMallPane.visible = true
            }
        }
    }

    Label {
        id: label1
        x: 136
        y: 76
        width: 141
        height: 28
        text: qsTr("FTP 伺服器")
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
    }

    Image {
        id: image
        x: 24
        y: 69
        width: 100
        height: 100
        Material.elevation:2
        source: "icons/ic_folder_black_48dp_2x.png"
    }

    Label {
        id: label2
        x: 136
        y: 117
        font.family: "Microsoft JhengHei UI"
        text: qsTr("SERVANT Team\n2016 年 11 月 21 日")
    }

    Button {
        id: button1
        x: 400
        width: 212
        height: 45
        font.family: "Microsoft JhengHei UI"
        Material.background: "#ff9800"
        Material.elevation: 0
        text: qsTr("下載")
        anchors.top: parent.top
        anchors.topMargin: 185
        anchors.right: parent.right
        anchors.rightMargin: 28
        onClicked:{
            button1.visible=false
            mainWindow.startDownload()
        }
    }

    Image {
        id: image1
        x: 24
        y: 245
        width: 246
        height: 192
        source: "icons/ftpPreview0.png"
    }

    Label {
        id: label3
        x: 299
        y: 275
        font.family: "Microsoft JhengHei UI"

        text: qsTr("0.7 GB")
        font.pointSize: 20
    }

    Label {
        id: label4
        x: 299
        y: 257
        font.family: "Microsoft JhengHei UI"
        text: qsTr("需下載")
    }

    Label {
        id: label5
        x: 299
        y: 325
        text: qsTr("執行時記憶體需求")
        font.family: "Microsoft JhengHei UI"
    }

    Label {
        id: label6
        x: 299
        y: 343
        text: qsTr("384 MB")
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 20
    }

    ProgressBar {
        id: progressBar
        objectName: "downloadProgress"
        Material.accent: Material.Orange
        y: 206
        anchors.left: parent.left
        anchors.leftMargin: 130
        anchors.right: parent.right
        anchors.rightMargin: 30
        visible: false
        value: 0.5
    }

    Button {
        id: button2
        x: 401
        y: 3
        width: 212
        height: 45
        text: qsTr("建立伺服器")
        objectName: "newServerButton"
        visible: false
        Material.elevation: 0
        Material.background: "#ff9800"
        anchors.topMargin: 185
        font.family: "Microsoft JhengHei UI"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 28
        onClicked: {
            overviewPane.visible = true
            serverInfoPane.visible = false
            serverProductInfoPane.visible = false
            serverMallPane.visible = false
            mainWindow.importPackageDownloaded();
        }
    }


}
