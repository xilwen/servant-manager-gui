import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: sharePane
    width: 823
    height: 579
    leftPadding: 0
    rightPadding: 0
    bottomPadding: 0
    topPadding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    OpBannerPane {
        id: opBannerPane
        x: 244
        anchors.top: parent.top
        anchors.topMargin: 0
        pageIcon: "icon/ic_share_white_48dp_2x.png"
        pageName: "匯出與備份"
        backgroundColor: "#2f3e9e"
        haveDesciprtion: false
    }

    Pane {
        id: pane
        width: 823
        padding: 0
        leftPadding: 0
        rightPadding: 0
        bottomPadding: 0
        topPadding: 0
        anchors.right: parent.right
        anchors.rightMargin: -12
        anchors.left: parent.left
        anchors.leftMargin: -12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -12
        anchors.top: parent.top
        anchors.topMargin: -12
        visible:false
        Image {
            id: loadingimage
            x: 367
            width: 65
            height: 65
            anchors.top: parent.top
            anchors.topMargin: 150
            source: "icon/ic_access_time_2x.png"
        }

        ProgressBar {
            id: progressBar
            x: 271
            width: 256
            height: 16
            anchors.top: loadingimage.bottom
            anchors.topMargin: 3
            value: 0.5
            indeterminate: true
            Material.accent:"#2196F3"
        }

        Label {
            id: label
            x: 372
            width: 91
            height: 28
            text: qsTr("正在...")
            anchors.top: progressBar.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
        }
    }

    Pane {
        id: pane1
        x: -1
        width: 700
        height: 175
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
        anchors.top: opBannerPane.bottom
        Material.background: "white"
        Label {
            id: perpareForNewServerLabel1
            height: 45
            text: "匯出伺服器"
            font.pointSize: 18
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 5
            font.bold: false
            font.family: "Microsoft JhengHei UI"
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.leftMargin: 80
        }

        Label {
            id: perpareForNewServerLabel2
            x: 3
            height: 45
            text: "將伺服器以 Open Virtual Appliance (*.ova) 格式匯出。\n其他電腦上若有支援的軟體(如 Virtualbox )即可直接匯入伺服器，Amazon Web Service 等服務提供商亦支援直接匯入 OVA 檔案。"
            font.pointSize: 14
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 0
            font.family: "Microsoft JhengHei UI"
            anchors.rightMargin: 10
            anchors.top: perpareForNewServerLabel1.bottom
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            anchors.left: perpareForNewServerLabel1.left
            anchors.leftMargin: 0
            anchors.right: parent.right
        }

        Image {
            id: image
            y: 0
            width: 45
            height: 45
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 18
            source: "icon/ic_call_made_black_24dp_2x.png"
        }

        Button {
            id: button
            x: 558
            y: 127
            width: 132
            height: 48
            text: qsTr("開始匯出")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 10
            font.family: "Microsoft JhengHei UI"
            Material.elevation: 0
            font.pointSize: 14
            Material.background: "#2f3e9e"
            Material.foreground: "white"
        }
        Material.elevation: 3
        padding: 0
    }

    Pane {
        id: pane2
        x: 0
        width: 700
        height: 175
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: pane1.bottom
        Material.background: "white"
        Label {
            id: perpareForNewServerLabel3
            height: 45
            text: "開啟虛擬機器存放資料夾"
            font.pointSize: 18
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 5
            font.bold: false
            font.family: "Microsoft JhengHei UI"
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.leftMargin: 80
        }

        Label {
            id: perpareForNewServerLabel4
            x: 3
            height: 45
            text: "SERVANT 所建立的所有伺服器虛擬機器都位於此資料夾。\n由於 SERVANT 以系統服務執行，虛擬機器的儲存資料夾可能與一般執行時不同，直接備份這個資料夾就可以完整備份伺服器。"
            font.pointSize: 14
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 0
            anchors.rightMargin: 10
            font.family: "Microsoft JhengHei UI"
            anchors.top: perpareForNewServerLabel3.bottom
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            anchors.left: perpareForNewServerLabel3.left
            anchors.leftMargin: 0
            anchors.right: parent.right
        }

        Image {
            id: image1
            y: 0
            width: 45
            height: 45
            source: "icon/ic_search_black_48dp_2x.png"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 18
        }

        Button {
            id: button1
            x: 558
            y: 127
            width: 132
            height: 48
            text: qsTr(" 檢視資料夾")
            font.pointSize: 14
            Material.background: "#2f3e9e"
            Material.foreground: "white"
            anchors.rightMargin: 10
            font.family: "Microsoft JhengHei UI"
            Material.elevation: 0
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 5
            onClicked: {
                tmpCmd.triggerStartURI("%windir%\\System32\\config\\systemprofile")
            }
        }
        Material.elevation: 3
        padding: 0
    }


}







