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
                text:  (itemIndex == 0) ? qsTr("Webmin + Samba") : qsTr("Joomla!")
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
                width: 346
                height: 139
                text: (itemIndex == 0) ? qsTr("具備基礎功能的FTP Server。\n預設為公開讀取設定檔。"):qsTr("Joomla!是一套自由、開放原始碼的內容管理系統，以PHP撰寫。\n通常被用來搭建商業網站、個人部落格、資訊管理系統、Web 服務等，還可以進行二次開發以擴充使用範圍。")
                wrapMode: Text.WordWrap
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
        visible:true

        Button {
            id: button3
            x: 687
            width: 145
            height: 48
            text: (itemIndex == 0) ? qsTr("下載 (738MB)"):  qsTr("下載 (807MB)")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            visible:true
            onClicked: {
                bottomPane.visible=false
                progressbarpane.visible=true
                tmpCmd.runDownloader(itemIndex)
            }
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

        Button {
            id: cancelbutton
            x: 644
            y: -11
            width: 145
            text: qsTr("取消")
            anchors.right: parent.right
            anchors.rightMargin: 10
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
            Material.background: "white"
            Material.elevation:0
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
    Pane {
        id: downloadSucceedPane
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
        visible: false

        Button {
            id: installButton
            x: 687
            width: 145
            height: 48
            text: qsTr("安裝")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            visible:true
            onClicked: {
                serverProductInfoPane.visible = false
                tmpCmd.runInstaller(itemIndex)
            }
        }
    }
}
