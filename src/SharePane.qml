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
    id: sharePane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    Label {
        id: sharelabel
        width: 133
        height: 36
        text: qsTr("分享與匯入")
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: parent.top
        anchors.topMargin: 11
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 22
        font.family: "Microsoft JhengHei UI"
    }

    Button {
        id: pushServerbutton
        width: 345
        height: 84
        anchors.top: sharelabel.bottom
        anchors.topMargin: 9
        anchors.left: parent.left
        anchors.leftMargin: 22
        checkable: true
        Material.elevation: 8
        highlighted: true
        Material.background: "White"
        Image {
            id: pushServerimage
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.left: parent.left
            anchors.leftMargin: 10
            source: "icon/ic_reorder_black_24dp_2x.png"
        }

        Label {
            id: pushServerlabel
            text: qsTr("匯出伺服器")
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.left: pushServerimage.right
            anchors.leftMargin: 8
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: virtualboxstylelabel
            x: 68
            width: 132
            height: 26
            text: qsTr("以VurtualBox格式")
            anchors.top: pushServerlabel.bottom
            anchors.topMargin: 0
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 12
            color:"#616161"
        }


    }

    Button {
        id: pushvirtualboxbutton
        y: 56
        width: 345
        height: 84
        anchors.left: pushServerbutton.right
        anchors.leftMargin: 36
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: pushvirtualboximage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            anchors.top: parent.top
            anchors.topMargin: 17
            source: "qrc:/qtquickplugin/images/template_image.png"
        }

        Label {
            id: pushvirtualboxlabel
            text: qsTr("從VirtualBox匯入")
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.left: pushvirtualboximage.right
            anchors.leftMargin: 8
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
        }
    }

    Label {
        id: backuplabel
        width: 133
        height: 36
        text: qsTr("備份")
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.top: pushServerbutton.bottom
        anchors.topMargin: 9
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    Button {
        id: camerabutton
        width: 345
        height: 84
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: backuplabel.bottom
        anchors.topMargin: 9
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: cameraimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            source: "icon/ic_camera_enhance_2x.png"
        }

        Label {
            id: cameralabel
            text: qsTr("為所有機器建立快照")
            anchors.left: cameraimage.right
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    Button {
        id: backupMachinebutton
        y: 194
        width: 345
        height: 84
        anchors.left: camerabutton.right
        anchors.leftMargin: 36
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: backupMachineimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            source: "icon/ic_file_upload_2x.png"
        }

        Label {
            id: backupMachinelabel
            width: 120
            height: 26
            text: qsTr("備份所有機器")
            anchors.left: backupMachineimage.right
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }
    Pane {
        id: pane
        width: 823
        anchors.right: parent.right
        anchors.rightMargin: -12
        anchors.left: parent.left
        anchors.leftMargin: -12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -12
        anchors.top: parent.top
        anchors.topMargin: -12
        //visible:true
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
}







