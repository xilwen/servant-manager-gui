import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: loadingPane
    z: 3
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName: "loadingScreen"
    Material.theme: Material.Dark

    Label {
        id: logoTitle
        x: 385
        y: 260
        text: qsTr("SERVANT")
        visible: false
        anchors.verticalCenterOffset: -60
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 32
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    ProgressBar {
        id: loadProgressBar
        x: 528
        y: 528
        width: 400
        objectName: "loadingScreenProgressBar"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        Material.theme: Material.Dark
        Material.accent: Material.Blue
        indeterminate: true
        value: 0.0

        Label {
            id: loadStatusLabel
            text: qsTr("Status")
            visible: false
            objectName: "loadingScreenStatusLabel"
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
        }
    }

    Image {
        id: image
        width: 330
        height: 53
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "icon/SERVANT-logo-dark.png"
    }
}
