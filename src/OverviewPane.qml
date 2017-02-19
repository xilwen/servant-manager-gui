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
            text: qsTr("已經在VirtualBox上設定好伺服器?請造訪分享與備份")
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
        visible:false
        //visible:true
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
        visible:false
        //visible:true

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
        visible:false
        //visible:true
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
        visible:false
        //visible:true
    }
    BackButton{
        id:backButton
        height: 45
        anchors.top: parent.top
        anchors.topMargin: -12
        anchors.rightMargin: -12
        anchors.leftMargin: -12
        visible:true
        //visible:false
        Label {
            id: label8
            y: 8
            width: 127
            height: 29
            text: qsTr("伺服器名稱")
            anchors.left: parent.left
            anchors.leftMargin: 47
            font.pointSize: 14
            color:"White"
            font.family: "Microsoft JhengHei UI"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

    }
    Pane {
        id: overviewModuleInfo2
        x: 24
        width: 350
        height: 380
        anchors.top: parent.top
        anchors.topMargin: 54
        Material.background: "White"
        Material.elevation:3
        Material.accent:"#FFFFFF"
        visible:true
        //visible:false
        Label {
            id: label9
            width: 144
            height: 36
            text: qsTr("伺服器資訊")
            anchors.left: parent.left
            anchors.leftMargin: 13
            anchors.top: parent.top
            anchors.topMargin: 7
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 22
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: button1
            width: 142
            height: 81
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 217
            anchors.right: button2.left
            anchors.rightMargin: 19
            anchors.top: parent.top
            anchors.topMargin: 55
            anchors.left: parent.left
            anchors.leftMargin: 10
            Material.elevation:3
            Material.background: "White"
            Label {
                id: label10
                width: 65
                height: 24
                text: qsTr("連接埠")
                anchors.left: parent.left
                anchors.leftMargin: 7
                anchors.top: parent.top
                anchors.topMargin: 13
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
                color:"#616161"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Label {
                id: label11
                x: 7
                width: 65
                height: 31
                text: qsTr("21")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
                anchors.top: label10.bottom
                anchors.topMargin: 0
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: button2
            x: 174
            y: 55
            width: 142
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 218
            anchors.top: parent.top
            anchors.topMargin: 57
            anchors.right: parent.right
            anchors.rightMargin: 10
            Material.elevation:3
            Material.background: "White"
            Label {
                id: label12
                width: 65
                height: 24
                text: qsTr("服務")
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
                color:"#616161"
                anchors.left: parent.left
                anchors.leftMargin: 7
                anchors.top: parent.top
                anchors.topMargin: 13
            }

            Label {
                id: label13
                x: 7
                width: 65
                text: qsTr("FTP")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
                anchors.top: label12.bottom
                anchors.topMargin: 0
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
            }
        }

        Button {
            id: button3
            height: 81
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 127
            anchors.right: parent.right
            anchors.rightMargin: 173
            anchors.top: button1.bottom
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 11
            Material.elevation:3
            Material.background: "White"
            Label {
                id: label14
                width: 65
                height: 24
                text: qsTr("運作中")
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
                color:"#616161"
                anchors.left: parent.left
                anchors.leftMargin: 7
                anchors.top: parent.top
                anchors.topMargin: 13
                verticalAlignment: Text.AlignVCenter
            }

            Label {
                id: label15
                x: 7
                width: 65
                text: qsTr("是")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
                anchors.top: label14.bottom
                anchors.topMargin: 0
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
            }
        }

        Label {
            id: label16
            y: 334
            height: 24
            text: qsTr("SERVANT Watchdog未運作")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -2
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 37
            anchors.left: parent.left
            anchors.leftMargin: 37
            verticalAlignment: Text.AlignVCenter
            font.family: "Microsoft JhengHei UI"
            color:"#616161"
            font.pointSize: 14
        }

    }
    Pane {
        id: overviewModuleInfo3
        x: 422
        width: 350
        height: 380
        anchors.top: parent.top
        anchors.topMargin: 54
        Material.background: "White"
        Material.elevation:3
        Material.accent:"#FFFFFF"
        visible:true
        //visible:false
        Label {
            id: label17
            width: 144
            height: 36
            text: qsTr("快速控制")
            anchors.left: parent.left
            anchors.leftMargin: 13
            anchors.top: parent.top
            anchors.topMargin: 7
            verticalAlignment: Text.AlignVCenter
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 22
        }

        Button {
            id: button4
            height: 81
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 55
            Material.background:"White"
            Material.elevation:3
            Label {
                id: label18
                width: 167
                height: 24
                text: qsTr("開啟伺服器檔案")
                anchors.left: parent.left
                anchors.leftMargin: 67
                anchors.top: parent.top
                anchors.topMargin: 20
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Label {
                id: label19
                x: 67
                width: 63
                height: 24
                text: qsTr("Z:/")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.top: label18.bottom
                anchors.topMargin: 0
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
            }

            Image {
                id: image
                x: 5
                width: 55
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.top: parent.top
                anchors.topMargin: 15
                source: "icon/ic_folder_black_48dp_2x.png"
            }
        }

        Button {
            id: button5
            height: 81
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: button4.bottom
            anchors.topMargin: 8
            Material.background:"White"
            Material.elevation:3
            Label {
                id: label20
                height: 24
                text: qsTr("開啟管理介面")
                anchors.left: parent.left
                anchors.leftMargin: 67
                anchors.top: parent.top
                anchors.topMargin: 20
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
            }

            Label {
                id: label21
                x: 67
                y: 45
                width: 94
                height: 24
                text: qsTr("Localhost")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: button6
            height: 81
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 33
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: button5.bottom
            anchors.topMargin: 8
            Material.background:"White"
            Material.elevation:3
            Label {
                id: label22
                width: 167
                height: 24
                text: qsTr("開啟VirtualBox")
                anchors.left: parent.left
                anchors.leftMargin: 67
                anchors.top: parent.top
                anchors.topMargin: 20
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
            }
        }

    }
    Button {
        id: button7
        x: 730
        y: 499
        width: 56
        height: 56
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 13
        Material.background: "White"
        Material.elevation:0
        //visible:true
        visible:false
        Image {
            id: image1
            y: 8
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            source: "icon/ic_power_settings_new_2x.png"
        }

        Label {
            id: label23
            x: -45
            y: 13
            width: 41
            height: 31
            text: qsTr("關機")
            anchors.right: button7.left
            anchors.rightMargin: 4
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
        }
    }
    BackButton{
        id:backButton1
        height: 45
        anchors.top: parent.top
        anchors.topMargin: -12
        anchors.rightMargin: -12
        anchors.leftMargin: -12
        visible:true
        //visible:false
        Label {
            id: label24
            y: 8
            width: 127
            height: 29
            text: qsTr("FTPSVr1")
            anchors.left: parent.left
            anchors.leftMargin: 47
            font.pointSize: 14
            color:"White"
            font.family: "Microsoft JhengHei UI"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

    }
    Pane {
        id: overviewModuleInfo5
        x: 24
        width: 350
        height: 290
        anchors.top: parent.top
        anchors.topMargin: 54
        Material.background: "White"
        Material.elevation:3
        Material.accent:"#FFFFFF"
        //visible:true
        visible:false
        Label {
            id: labe25
            width: 144
            height: 36
            text: qsTr("伺服器資訊")
            anchors.left: parent.left
            anchors.leftMargin: 13
            anchors.top: parent.top
            anchors.topMargin: 7
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 22
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: button8
            width: 142
            height: 81
            anchors.right: button2.left
            anchors.rightMargin: 19
            anchors.top: parent.top
            anchors.topMargin: 55
            anchors.left: parent.left
            anchors.leftMargin: 10
            Material.elevation:3
            Material.background: "White"
            Label {
                id: label50
                width: 65
                height: 24
                text: qsTr("連接埠")
                anchors.left: parent.left
                anchors.leftMargin: 7
                anchors.top: parent.top
                anchors.topMargin: 13
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
                color:"#616161"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Label {
                id: label26
                x: 7
                width: 65
                text: qsTr("21")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
                anchors.top: label10.bottom
                anchors.topMargin: 0
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            id: button9
            x: 175
            width: 142
            height: 81
            anchors.top: parent.top
            anchors.topMargin: 55
            anchors.right: parent.right
            anchors.rightMargin: 10
            Material.elevation:3
            Material.background: "White"
            Label {
                id: label27
                width: 65
                height: 24
                text: qsTr("服務")
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 14
                color:"#616161"
                anchors.left: parent.left
                anchors.leftMargin: 7
                anchors.top: parent.top
                anchors.topMargin: 13
            }

            Label {
                id: label28
                x: 7
                width: 65
                text: qsTr("FTP")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
                anchors.top: label12.bottom
                anchors.topMargin: 0
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
            }
        }

    }
    Pane {
        id: overviewModuleInfo6
        x: 422
        y: 54
        width: 350
        height: 290
        Material.background: "White"
        Material.elevation:3
        Material.accent:"#FFFFFF"
        //visible:true
        visible:false
        Label {
            id: label44
            width: 144
            height: 36
            text: qsTr("機器選項")
            anchors.left: parent.left
            anchors.leftMargin: 13
            anchors.top: parent.top
            anchors.topMargin: 7
            verticalAlignment: Text.AlignVCenter
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 22
        }

        Button {
            id: button45
            x: 21
            width: 306
            height: 81
            anchors.horizontalCenter: overviewModuleInfo6.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 55
            Material.background:"White"
            Material.elevation:3
            Label {
                id: label46
                width: 167
                height: 24
                text: qsTr("刪除伺服器")
                anchors.left: parent.left
                anchors.leftMargin: 67
                anchors.top: parent.top
                anchors.topMargin: 20
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Image {
                id: image12
                x: 5
                width: 55
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.top: parent.top
                anchors.topMargin: 15
                source: "icon/ic_folder_black_48dp_2x.png"
            }
        }

        Button {
            id: button23
            x: 21
            width: 306
            height: 81
            anchors.horizontalCenter: overviewModuleInfo6.horizontalCenter
            anchors.top: button45.bottom
            anchors.topMargin: 8
            Material.background:"White"
            Material.elevation:3
            Label {
                id: label53
                width: 167
                height: 24
                text: qsTr("開啟VirtualBox")
                anchors.left: parent.left
                anchors.leftMargin: 67
                anchors.top: parent.top
                anchors.topMargin: 20
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
            }
        }

    }

    Pane {
        id: openpane
        y: 522
        height: 45
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -12
        anchors.right: parent.right
        anchors.rightMargin: -12
        anchors.left: parent.left
        anchors.leftMargin: -12
        Material.background: "#2196F3"
        Button {
            id: openbutton
            x: 679
            y: -16
            width: 132
            height: 53
            anchors.right: parent.right
            anchors.rightMargin: -12
            Material.background: "#2196F3"
            Material.elevation:0
            //visible:true
            visible:false
            Image {
                id: openimage
                x: 71
                y: 7
                width: 40
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 21
                source: "icon/ic_power_settings_new_white_2x.png"
            }

            Label {
                id: openlabel
                y: 11
                width: 41
                height: 31
                text: qsTr("開機")
                anchors.left: parent.left
                anchors.leftMargin: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Microsoft JhengHei UI"
                font.pointSize: 16
                color:"White"
            }
        }
    }
}
