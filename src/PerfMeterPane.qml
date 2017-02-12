import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Pane {
    id: perfMeterPane
    objectName: "perfMeterPane"
    width: 1024
    height: 640
    padding: 0
    rightPadding: 0
    bottomPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.theme: Material.Dark

    Pane {
        id: pane
        y: 428
        height: 75
        z: 1
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        padding: 0
        Material.background: "#3e50b4"
        Material.elevation: 10

        ProgressBar {
            id: progressBar
            x: 0
            indeterminate: true
            Material.accent: Material.BlueGrey
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            value: 0.5
        }
    }

    Image {
        id: image1
        x: 768
        y: 341
        width: 256
        height: 256
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        z: 0
        opacity: 0.3
        source: "icon/ic_timer_white_48px.png"
    }

    Label {
        id: label
        x: 429
        y: 113
        text: qsTr("請稍候")
        font.family: "Microsoft JhengHei UI"
        anchors.verticalCenterOffset: -175
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 48
    }

    Label {
        id: label1
        x: 272
        y: 239
        text: qsTr("正在讓一切就緒，這個過程需要幾分鐘。")
        anchors.verticalCenterOffset: -75
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
    }


}
