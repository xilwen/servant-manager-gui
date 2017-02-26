import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id:serverProductInfoPane
    width: 823
    height: 579
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName:"serverMallPane"
    Image {
        id: ftpimage
        width: 100
        height: 100
        anchors.top: backButton.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: "icon/ic_folder_black_48dp_2x.png"
    }

    Label {
        id: ftplabel
        width: 115
        height: 25
        text: qsTr("FTP伺服器")
        anchors.top: backButton.bottom
        anchors.topMargin: 22
        anchors.left: ftpimage.right
        anchors.leftMargin: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.family: "Microsoft JhengHei UI";
        font.pointSize: 16
    }
    
    Text {
        id: teamtext
        width: 120
        height: 26
        text: qsTr("SERVANT Team")
        anchors.top: ftplabel.bottom
        anchors.topMargin: 10
        anchors.left: ftpimage.right
        anchors.leftMargin: 15
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 12
    }

    BackButton{
        id:backButton
        height: 45
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        pageName: qsTr("FTP 伺服器")
        button.onClicked:{
            serverProductInfoPane.visible = false
            serverMallPane.visible = true
        }
    }


    Text {
        id: datetext
        width: 110
        height: 26
        text: qsTr("2017年1月8號")
        anchors.top: teamtext.top
        anchors.topMargin: 0
        anchors.left: teamtext.right
        anchors.leftMargin: 20
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        font.family: "Microsoft JhengHei UI"
        color:"#616161"
    }

    Pane {
        id: pane
        width: 364
        height: 329
        anchors.top: ftpimage.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        padding: 0
        Material.elevation: 3
        Button {
            id: button
            height: 75
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            Material.background: "white"
            Material.elevation: 0

            Label {
                id: label
                text: qsTr("作業系統")
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
            }

            Label {
                id: label1
                text: qsTr("Ubuntu Server 16.04")
                anchors.left: label.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 18
            }
        }
        Button {
            id: button1
            height: 75
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: button.bottom
            anchors.topMargin: -5
            Material.background: "white"
            Material.elevation: 0
            Label {
                id: label2
                text: qsTr("控制介面")
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
            }

            Label {
                id: label3
                text: qsTr("Webmin + Samba")
                anchors.left: label2.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 18
            }

            Label {
                id: label5
                x: 8
                y: 1
                text: qsTr("簡介")
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.left: parent.left
                anchors.topMargin: 83
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
            }

            Label {
                id: label6
                x: 9
                y: -6
                text: qsTr("具備基礎功能的FTP Server。\n預設為公開讀取設定檔。")
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.left: parent.left
                font.family: "Microsoft JhengHei UI"
                anchors.topMargin: 115
                font.pointSize: 14
            }
        }
    }
    Button {
        id: button2
        width: 375
        height: 110
        anchors.left: pane.right
        anchors.leftMargin: 10
        anchors.top: pane.top
        anchors.topMargin: -5
        Material.background: "white"

        Label {
            id: label4
            text: qsTr("硬體檢查")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
        }

        Label {
            id: label15
            text: qsTr("您的電腦符合此伺服器\n的硬體需求。")
            anchors.left: label4.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 18
        }
    }

    Pane {
        id: bottomPane
        height: 50
        padding: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.elevation: 3
        Material.background: "white"

        Button {
            id: button3
            x: 687
            width: 145
            height: 48
            text: qsTr("下載 (738MB)")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
        }

        Button {
            id: button4
            x: 681
            y: 5
            width: 145
            height: 48
            text: qsTr("加入願望清單")
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 20
            font.family: "Microsoft JhengHei UI"
            anchors.right: button3.left
            Material.background: "white"
            font.pointSize: 14
            Material.elevation: 0
        }
    }
}


