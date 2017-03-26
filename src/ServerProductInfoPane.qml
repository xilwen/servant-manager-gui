import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id:serverProductInfoPane
    width: 823
    height: 579
    padding: 0
    property int itemIndex: 0
    property alias progressBarValue : progressBar.value
    property alias progressText : label7.text
    property alias succeedPaneVisible : downloadSucceedPane.visible
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName:"serverProductInfoPane"
    onVisibleChanged: {
        progressbarpane.visible = false
        downloadSucceedPane.visible = false
        bottomPane.visible = true
    }

    Image {
        id: ftpimage
        width: 100
        height: 100
        anchors.top: backButton.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: (itemIndex == 0) ? "icon/ic_folder_black_48dp_2x.png" : "icon/Joomla-flat-logo-en.png"
    }

    Label {
        id: ftplabel
        width: 115
        height: 25
        text: (itemIndex == 0) ? qsTr("FTP伺服器") : qsTr("Joomla! 伺服器")
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
        pageName: (itemIndex == 0) ?qsTr("FTP 伺服器") : qsTr("Joomla! 伺服器")
        button.onClicked:{
            serverProductInfoPane.visible = false
            serverMallPane.visible = true
            succeedPaneVisible = false
            progressbarpane.visible = false
            bottomPane.visible = true
        }
    }


    Text {
        id: datetext
        width: 110
        height: 26
        text: qsTr("2017年2月28號")
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

        ServerProductInfoModule_DetailCard {
            id: button
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: -6
            title:qsTr("作業系統")
            subtitle:qsTr("Ubuntu Server 16.04")
            introduction: qsTr("")
            detail: qsTr("")
        }
        ServerProductInfoModule_DetailCard {
            id: button1
            y: 64
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: button.bottom
            anchors.topMargin: -5
            title:qsTr("控制介面")
            subtitle:(itemIndex == 0) ? qsTr("Webmin + Samba") : qsTr("Joomla!")
            introduction: qsTr("簡介")
            detail: (itemIndex == 0) ? qsTr("具備基礎功能的FTP Server。\n預設為公開讀取設定檔。"):qsTr("Joomla!是一套自由、開放原始碼的內容管理系統，以PHP撰寫。\n通常被用來搭建商業網站、個人部落格、資訊管理系統、Web 服務等，還可以進行二次開發以擴充使用範圍。")
        }
    }
    ServerProductInfoModule_DetailCard  {
        id: button2
        height: 110
        anchors.left: pane.right
        anchors.leftMargin: 10
        anchors.top: pane.top
        anchors.topMargin: -5
        title:qsTr("硬體檢查")
        subtitle:qsTr("您的電腦符合此伺服器\n的硬體需求。")
        introduction: qsTr("")
        detail: qsTr("")
    }

    BottomPane {
        id: bottomPane
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        visible:true

        ServerProductInfoModule_Button {
            id: button3
            x: 687
            title: (itemIndex == 0) ? qsTr("下載 (738MB)"):  qsTr("下載 (807MB)")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            visible:true
            onClicked: {
                bottomPane.visible=false
                progressbarpane.visible=true
                tmpCmd.runDownloader(itemIndex)
            }
        }

        ServerProductInfoModule_Button {
            id: button4
            x: 681
            y: 5
            title: qsTr("加入願望清單")
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 20
            anchors.right: button3.left
            visible:true
        }
    }
    Pane {
        id: progressbarpane
        y: 529
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Material.elevation: 3
        Material.background: "white"
        visible:false

        ProgressBar {
            id: progressBar
            y: 3
            height: 20
            anchors.right: parent.right
            anchors.rightMargin: 365
            anchors.left: parent.left
            anchors.leftMargin: 8
            value: 0
            visible: true
            indeterminate: false
            Material.accent:Material.Blue
        }

        ServerProductInfoModule_Button {
            id: cancelbutton
            x: 644
            y: -11
            title: qsTr("取消")
            anchors.right: parent.right
            anchors.rightMargin: 10
            onClicked: {
                bottomPane.visible=true
                progressbarpane.visible=false
            }
        }

        Label {
            id: label7
            x: 455
            y: -1
            width: 145
            height: 29
            text: qsTr("~ / 738 MB")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
            anchors.right: parent.right
            anchors.rightMargin: 199
        }
    }
    BottomPane {
        id: downloadSucceedPane
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        visible: false

        ServerProductInfoModule_Button {
            id: installButton
            x: 687
            title: qsTr("安裝")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            visible:true
            onClicked: {
                serverProductInfoPane.visible = false
                tmpCmd.runInstaller(itemIndex)
            }
        }
    }
}
