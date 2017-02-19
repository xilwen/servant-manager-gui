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
    id:serverProductInfoPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName:"serverMallPane"
    Image {
        id: ftpimage
        y: 23
        width: 100
        height: 100
        anchors.left: parent.left
        anchors.leftMargin: 0
        source: "icon/ic_folder_black_48dp_2x.png"
    }

    Button {
        id:download
        y: 93
        width: 133
        height: 41
        text: qsTr("安裝")
        anchors.left: ftpimage.right
        anchors.leftMargin: 2
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
        Material.background: "#F57F17"
        Material.foreground: "#ffffff"
        Material.elevation:0
        onClicked:{
            download.visible=false
            mainWindow.startDownload()
        }
    }

    Label {
        id: ftplabel
        y: 41
        width: 115
        height: 25
        text: qsTr("FTP伺服器")
        anchors.left: ftpimage.right
        anchors.leftMargin: 1
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.family: qsTr("Microsoft JhengHei UI")
        font.pointSize: 16
    }
    
    Text {
        id: introductiontext
        x: 17
        width: 66
        height: 26
        text: qsTr("簡介")
        anchors.top: ftpimage.bottom
        anchors.topMargin: 29
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 16
    }
    
    Text {
        id: teamtext
        y: 67
        width: 120
        height: 26
        text: qsTr("SERVANT Team")
        anchors.left: ftpimage.right
        anchors.leftMargin: 1
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 12
    }

    BackButton{
        id:backButton
        height: 45
        anchors.top: parent.top
        anchors.topMargin: -12
        anchors.leftMargin: -12
        anchors.rightMargin: -12

    }


    Text {
        id: datetext
        y: 67
        width: 110
        height: 26
        text: qsTr("2017年1月8號")
        anchors.left: teamtext.right
        anchors.leftMargin: 20
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        font.family: "Microsoft JhengHei UI"
        color:"#616161"
    }

    Text {
        id: systemtext
        x: 17
        width: 155
        height: 26
        text: qsTr("系統需求")
        anchors.top: introductiontext.bottom
        anchors.topMargin: 80
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
    }

    Text {
        id: managetext
        x: 22
        width: 155
        height: 26
        text: qsTr("管理介面")
        anchors.top: systemtext.bottom
        anchors.topMargin: 119
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
    }

    Text {
        id: downloadtext
        x: 22
        y: 531
        width: 155
        height: 26
        text: qsTr("需下載")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -2
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
    }

    TextField {
        id: textField
        x: 86
        y: 538
        width: 91
        height: 26
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -9
        renderType: Text.NativeRendering
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
        Material.accent: Material.Blue
    }

    Text {
        id: mbtext
        x: 174
        y: 531
        width: 155
        height: 26
        text: qsTr("MB的檔案")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -2
        anchors.left: textField.right
        anchors.leftMargin: 1
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
    }

    Image {
        id: imagebackground1
        y: 300
        width: 94
        height: 71
        anchors.left: parent.left
        anchors.leftMargin: 16
        source: "icon/orangebackground.png"

        Text {
            id: cputext
            x: 13
            width: 71
            height: 22
            text: qsTr("所需處理器")
            anchors.top: parent.top
            anchors.topMargin: 70
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
        }
    }

    Image {
        id: imagebackground2
        y: 300
        width: 94
        height: 71
        anchors.left: imagebackground1.right
        anchors.leftMargin: 17
        source: "icon/orangebackground.png"

        Image {
            id: memory
            x: 25
            y: 13
            width: 44
            height: 46
            source: "icon/ic_memory_white_24dp_2x.png"
        }

        Text {
            id: memorytext
            x: 6
            width: 83
            height: 22
            text: qsTr("所需記憶體")
            anchors.top: parent.top
            anchors.topMargin: 70
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
        }
    }

    Image {
        id: imagebackground3
        y: 300
        width: 94
        height: 71
        anchors.left: imagebackground2.right
        anchors.leftMargin: 17
        source: "icon/orangebackground.png"

        Text {
            id: chiptext
            x: 13
            width: 71
            height: 22
            text: qsTr("所需硬碟")
            anchors.top: parent.top
            anchors.topMargin: 70
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
        }
    }
    ProgressBar {
           id: progressBar
           objectName: "downloadProgress"
           Material.accent: Material.Orange
           y: 111
           anchors.left: parent.left
           anchors.leftMargin: 102
           anchors.right: parent.right
           anchors.rightMargin: 58
           visible:false
           value: 0.5
       }
    Button {
            id: button2
            y: 3
            height: 41
            text: qsTr("建立伺服器")
            font.pointSize: 14
            anchors.left: download.right
            anchors.leftMargin: 323
            objectName: "newServerButton"
            visible: false
            Material.elevation: 0
            Material.background: "#F57F17"
            Material.foreground: "#ffffff"
            anchors.topMargin: 93
            font.family: "Microsoft JhengHei UI"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 29
            onClicked: {
                overviewPane.visible = true
                serverInfoPane.visible = false
                serverProductInfoPane.visible = false
                serverMallPane.visible = false
                mainWindow.importPackageDownloaded();
            }
        }
}


