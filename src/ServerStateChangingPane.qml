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
    id: serverStateChangingPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    Button {
        id: backbutton
        height: 58
        visible: false
        anchors.top: parent.top
        anchors.topMargin: -18
        anchors.left: parent.left
        anchors.leftMargin: -12
        anchors.right: parent.right
        anchors.rightMargin: -12
        Material.background: "#424242"
        onClicked: {
            overviewPane.visible=false
            serverMallPane.visible=true
            serverProductInfoPane.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }

        Image {
            id: backimage
            y: 15
            width: 31
            height: 29
            anchors.left: parent.left
            anchors.leftMargin: 20
            source: "icon/ic_arrow_back_white_24dp_1x.png"
        }

        Text {
            id: ftptext
            y: 15
            width: 132
            height: 28
            text: qsTr("FTP伺服器")
            anchors.left: backimage.right
            anchors.leftMargin: 22
            verticalAlignment: Text.AlignVCenter
            font.family: qsTr("Microsoft JhengHei UI")
            font.pointSize: 16
            color: "white"
            objectName: serverStartingText
        }
    }

    Image {
        id: poweringimage
        anchors.right: parent.right
        anchors.rightMargin: 369
        anchors.left: parent.left
        anchors.leftMargin: 370
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 247
        anchors.top: parent.top
        anchors.topMargin: 248
        sourceSize.width: 0
        opacity: 1
        z: 3
        source: "icon/ic_power_settings_new_black_48dp.png"
    }

    ProgressBar {
        id: progressBarServerStateChanging
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 200
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.right: parent.right
        anchors.rightMargin: 150
        anchors.top: poweringimage.bottom
        anchors.topMargin: 10
        objectName: "progressBarServerStateChanging"
        indeterminate: true
        Material.accent: Material.BlueGrey
        visible: true
        value: 0.5
    }

    Label {
        id: serverStartingLabel
        text: "正在啟動..."
        anchors.right: parent.right
        anchors.rightMargin: 329
        anchors.left: parent.left
        anchors.leftMargin: 329
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 137
        anchors.top: progressBarServerStateChanging.bottom
        anchors.topMargin: 20
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
    }

    Image {
        id: changingimage
        width: 60
        height: 60
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: 369
        anchors.left: parent.left
        anchors.leftMargin: 370
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 247
        anchors.top: parent.top
        anchors.topMargin: 248
        sourceSize.width: 0
        opacity: 1
        z: 3
        source: "icon/ic_create_black_24dp.png"
    }

    Label {
        id: serverChangingLabel
        text: "正在變更..."
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: 329
        anchors.left: parent.left
        anchors.leftMargin: 329
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 137
        anchors.top: progressBarServerStateChanging.bottom
        anchors.topMargin: 20
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
    }
}


