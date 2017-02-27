import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

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
        x: 23
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
        font.family: "Microsoft JhengHei UI";
    }
    ServerObjectButton{
        id: pushServerbutton
        anchors.top: sharelabel.bottom
        anchors.topMargin: 9
        anchors.left: parent.left
        anchors.leftMargin: 22
        serverTitle: qsTr("匯出伺服器")
        serverSubtitle:qsTr("以VirtualBox格式")
        serverImageSource: "icon/ic_reorder_black_24dp_2x.png"
    }
    ServerObjectButton{
        id: pushvirtualboxbutton
        y: 56
        anchors.left: pushServerbutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("從VirtualBox匯入")
        serverImageSource: "qrc:/qtquickplugin/images/template_image.png"
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
    ServerObjectButton{
        id: camerabutton
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: backuplabel.bottom
        anchors.topMargin: 9
        serverTitle: qsTr("為所有機器建立快照")
        serverImageSource: "icon/ic_camera_enhance_2x.png"
    }
    ServerObjectButton{
        id: backupMachinebutton
        y: 194
        anchors.left: camerabutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("備份所有機器")
        serverImageSource: "icon/ic_file_upload_2x.png"
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







