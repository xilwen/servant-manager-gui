import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addingServerPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    BusyIndicator {
        id: addingServerBusyIndicator
        anchors.right: parent.right
        anchors.rightMargin: 369
        anchors.left: parent.left
        anchors.leftMargin: 370
        anchors.top: parent.top
        anchors.topMargin: 190
    }

    Label {
        id: addingPercentLabel
        height: 30
        text: "20%"
        font.pointSize: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 369
        anchors.left: parent.left
        anchors.leftMargin: 370
        anchors.top: parent.top
        anchors.topMargin: 260
        font.family: "Microsoft JhengHei UI"

    }

    Label {
        id: perpareForNewServerLabel
        objectName: perpareForNewServerLabel
        height: 70
        text: "正在準備"
        anchors.right: parent.right
        anchors.rightMargin: 249
        anchors.left: parent.left
        anchors.leftMargin: 250
        font.pointSize: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 300
        font.family: "Microsoft JhengHei UI"

    }
}
