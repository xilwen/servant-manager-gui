import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

Pane {
    id: loadingPane
    z: 3
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName: "pane1"
    Material.theme: Material.Dark
    Material.accent: Material.BlueGrey

    Label {
        id: logoTitle
        x: 385
        y: 260
        text: qsTr("SERVANT")
        anchors.verticalCenterOffset: -60
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 32
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Label {
            id: logoSubtitleLabel
            x: 84
            text: qsTr("開發版本")
            font.pointSize: 16
            horizontalAlignment: Text.AlignHCenter
            font.family: "Microsoft JhengHei UI"
            anchors.top: parent.top
            anchors.topMargin: 53
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    ProgressBar {
        id: loadProgressBar
        x: 528
        y: 528
        width: 400
        objectName: "loadingProgressBar"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        indeterminate: true
        value: 0.0

        Label {
            id: loadStatusLabel
            text: qsTr("Status")
            objectName: "statusLabel"
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
        }
    }
}
