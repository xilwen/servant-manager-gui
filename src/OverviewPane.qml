import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2
import QtQuick 2.0

Pane {
    id: overviewPane
    objectName: "overviewPane"
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    ServerObjectButton{
        id: machinePane1
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.top: parent.bottom
        anchors.topMargin: -458
        objectName: "machinePane1"
        onClicked: {
            overviewPane.visible = false
            serverInfoPane.visible = true
        }
        visible:false
    }
    OverviewModule_Info
    {
        id:overviewModuleInfo
        height: 210
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        visible:false
        //visible:true
        Label {
            id: label
            width: 61
            height: 35
            color: "#ffffff"
            text: qsTr("歡迎")
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.top: parent.top
            anchors.topMargin: 7
            styleColor: "#ffffff"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 22
            font.family: "Microsoft JhengHei UI"
            Material.accent:"#FFFFFF"
        }

        Label {
            id: label1
            x: 13
            width: 399
            height: 29
            color: "#ffffff"
            text: qsTr("從左方的「伺服器商城」下載並建立伺服器")
            anchors.top: label.bottom
            anchors.topMargin: 13
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
            Material.accent:"#FFFFFF"
        }

        Label {
            id: label2
            x: 13
            width: 490
            height: 31
            color: "#ffffff"
            text: qsTr("已經在VirtualBox上設定好伺服器?將造訪分享與備份")
            anchors.top: label1.bottom
            anchors.topMargin: 13
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
            Material.accent:"#FFFFFF"
        }


    }

    FileDialog {
        id: fileDialog
        objectName: "fileDialog"
        title: "選擇要匯入的VirtualBox虛擬機器包裝(*.ova)"
        nameFilters: [ "OVA (*.ova)" ]
        selectMultiple: false
        selectExisting: true
        selectFolder: false
        folder: shortcuts.home
        visible: false
        onAccepted: {
            mainWindow.importPackage()
        }
        onRejected: {
            console.log("Canceled")
        }
    }
    OverviewModule_Info
    {
        id:overviewModuleInfo1
        height: 175
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        //visible:false
        visible:true
        Label {
            id: label3
            width: 115
            height: 35
            text: qsTr("狀態良好")
            anchors.left: parent.left
            anchors.leftMargin: 13
            anchors.top: parent.top
            anchors.topMargin: 7
            color: "#ffffff"
            styleColor: "#ffffff"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 22
            font.family: "Microsoft JhengHei UI"
            Material.accent:"#FFFFFF"

        }

        Label {
            id: label4
            x: 13
            width: 288
            height: 30
            text: qsTr("目前服務都正常運作中")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.top: label3.bottom
            anchors.topMargin: 13
            color: "#ffffff"
            styleColor: "#ffffff"
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
            Material.accent:"#FFFFFF"
        }
    }
    OverviewModule_ServerQuickAction
    {
        id:  overviewModuleServerQuickAction
        x: 1
        anchors.top: overviewModuleInfo1.bottom
        anchors.topMargin: 40
        //visible:false
        visible:true

        Label {
            id: label5
            x: 86
            width: 96
            height: 30
            text: qsTr("FTPSvr_2")
            anchors.top: parent.top
            anchors.topMargin: 14
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }

        Label {
            id: label6
            x: 86
            y: 41
            width: 138
            height: 26
            text: qsTr("FTP伺服器")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 14
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            color:"#616161"
            font.family: "Microsoft JhengHei UI"
        }
    }

    OverviewModule_NewServerFloatingButton{
        id:button
        x: 730
        y: 499
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 13
        //visible:false
        visible:true
    }

    Label {
        id: label7
        x: 14
        y: 297
        width: 154
        height: 25
        text: qsTr("啟動伺服器")
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
        //visible:false
        visible:true
    }
}





