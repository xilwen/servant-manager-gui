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
    Label {
        id: serverlabel
        width: 234
        height: 34
        text: qsTr("已經安裝的伺服器")
        anchors.top: parent.top
        anchors.topMargin: 18
        anchors.left: parent.left
        anchors.leftMargin: 18
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22

        ServerObjectButton{
            id: machinePane1
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.bottom
            anchors.topMargin: 20
            objectName: "machinePane1"
            onClicked: {
                overviewPane.visible = false
                serverInfoPane.visible = true
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
        Button {
            id: serverbutton
            width: 345
            height: 84
            anchors.top: parent.bottom
            anchors.topMargin: 32
            anchors.left: serverlabel.left
            anchors.leftMargin: 0
            checkable: true
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 17
            Material.elevation: 8
            highlighted: true
            Material.background: "White"
            visible:false

            Image {
                id: serverimage1
                width: 65
                height: 65
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: serverbutton.left
                anchors.leftMargin: 10
                source: "icon/ic_folder_black_48dp_2x.png"
            }
            Text {
                id: nametext1
                y: 13
                width: 152
                height: 19
                text: qsTr("伺服器名稱")
                anchors.left: serverimage1.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: typetext1
                y: 33
                width: 152
                height: 19
                text: qsTr("伺服器類型")
                anchors.left: serverimage1.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: statext1
                y: 53
                width: 152
                height: 19
                text: qsTr("伺服器狀態")
                anchors.left: serverimage1.right
                anchors.leftMargin: 10
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Image {
                id: settingimage1
                x: 291
                width: 32
                height: 32
                anchors.right: parent.right
                anchors.rightMargin: 22
                anchors.top: parent.top
                anchors.topMargin: 14
                source: "icon/ic_menu_black_24dp_2x.png"

            }


        }
        Button {
            id: serverbutton2
            y: 66
            width: 345
            height: 84
            anchors.left: serverbutton.right
            anchors.leftMargin: 50
            checkable: true
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 17
            Material.elevation: 8
            highlighted: true
            Material.background: "White"
            visible:false

            Image {
                id: serverimage2
                width: 65
                height: 65
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                source: "icon/ic_folder_black_48dp_2x.png"
            }
            Text {
                id: nametext2
                y: 13
                width: 152
                height: 19
                text: qsTr("伺服器名稱")
                anchors.left: serverimage2.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: typetext2
                y: 33
                width: 152
                height: 19
                text: qsTr("伺服器類型")
                anchors.left: serverimage2.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: statext2
                y: 53
                width: 152
                height: 19
                text: qsTr("伺服器狀態")
                anchors.left: serverimage2.right
                anchors.leftMargin: 10
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Image {
                id: settingimage2
                x: 291
                width: 32
                height: 32
                anchors.right: parent.right
                anchors.rightMargin: 22
                anchors.top: parent.top
                anchors.topMargin: 14
                source: "icon/ic_menu_black_24dp_2x.png"

            }


        }
        Button {
            id: serverbutton3
            width: 345
            height: 84
            anchors.top: serverbutton.bottom
            anchors.topMargin: 40
            checkable: true
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 17
            Material.elevation: 8
            highlighted: true
            Material.background: "White"
            visible:false

            Image {
                id: serverimage3
                width: 65
                height: 65
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                source: "icon/ic_folder_black_48dp_2x.png"
            }
            Text {
                id: nametext3
                y: 13
                width: 152
                height: 19
                text: qsTr("伺服器名稱")
                anchors.left: serverimage3.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: typetext3
                y: 33
                width: 152
                height: 19
                text: qsTr("伺服器類型")
                anchors.left: serverimage3.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: statext3
                y: 53
                width: 152
                height: 19
                text: qsTr("伺服器狀態")
                anchors.left: serverimage3.right
                anchors.leftMargin: 10
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Image {
                id: settingimage3
                x: 291
                width: 32
                height: 32
                anchors.right: parent.right
                anchors.rightMargin: 22
                anchors.top: parent.top
                anchors.topMargin: 14
                source: "icon/ic_menu_black_24dp_2x.png"

            }


        }
        Button {
            id: serverbutton4
            y: 190
            width: 345
            height: 84
            anchors.left: serverbutton3.right
            anchors.leftMargin: 50
            checkable: true
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 17
            Material.elevation: 8
            highlighted: true
            Material.background: "White"
            visible:false
            //onClicked:fileDialog.open()
            Image {
                id: serverimage4
                width: 65
                height: 65
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                source: "icon/ic_folder_black_48dp_2x.png"
            }
            Text {
                id: nametext4
                y: 13
                width: 152
                height: 19
                text: qsTr("伺服器名稱")
                anchors.left: serverimage4.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: typetext4
                y: 33
                width: 152
                height: 19
                text: qsTr("伺服器類型")
                anchors.left: serverimage4.right
                anchors.leftMargin: 10
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Text {
                id: statext4
                y: 53
                width: 152
                height: 19
                text: qsTr("伺服器狀態")
                anchors.left: serverimage4.right
                anchors.leftMargin: 10
                font.pointSize: 12
                font.family:"Microsoft JhengHei UI"
            }

            Image {
                id: settingimage4
                x: 291
                width: 32
                height: 32
                anchors.right: parent.right
                anchors.rightMargin: 22
                anchors.top: parent.top
                anchors.topMargin: 14
                source: "icon/ic_menu_black_24dp_2x.png"

            }
        }
    }
}






