import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: serverMallPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName:"serverMallPane"


    Button {
        id: ftpserverbutton
        width: 345
        height: 84
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: label.bottom
        anchors.topMargin: 10
        Material.elevation: 6
        highlighted: true
        Material.background: "#FFFFFF"
        onClicked:{
            serverMallPane.visible=false
            serverProductInfoPane.visible=true
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }

        Label {
            id: ftplabel
            y: 26
            height: 32
            text: qsTr("FTP 伺服器")
            anchors.left: dataimage1.right
            anchors.leftMargin: 10
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Microsoft JhengHei UI";
            font.pointSize:12
            Material.foreground: "#000000"
        }
        
        Image {
            id: dataimage1
            width: 65
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            source: "icon/ic_folder_black_48dp_2x.png"
        }
    }

    Button {
        id: refreshListButton
        x: 20
        width: 200
        height: 48
        text: qsTr(" 更新伺服器清單")
        font.family: "Microsoft JhengHei UI"
        font.pointSize:12
        anchors.top: parent.top
        anchors.topMargin: 10
        Material.background: "#81c784"
    }

    Button {
        id: wishListButton
        width: 200
        height: 48
        text: qsTr("願望清單")
        font.family: "Microsoft JhengHei UI"
        font.pointSize:12
        anchors.left: refreshListButton.right
        anchors.leftMargin: 20
        anchors.top: refreshListButton.top
        anchors.topMargin: 0
        Material.background: "#bcaaa4"
    }

    Label {
        id: label
        text: qsTr("檔案伺服器")
        anchors.left: refreshListButton.left
        anchors.leftMargin: 0
        anchors.top: refreshListButton.bottom
        anchors.topMargin: 20
        font.bold: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 24
    }
}







