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
    id: searchPane
    width: 600
    height: 200
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    topPadding: 0
    Layout.minimumWidth: 30
    Layout.maximumHeight: 60
    Layout.preferredHeight: 75
    Layout.fillHeight: false
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    visible:true
    background: Rectangle{
        color: "#ffffff"
    }
    Label {
        id: label
        y: 260
        text: qsTr("SERVANT DevBuild")
        z: 1
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.verticalCenterOffset: 0
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
        horizontalAlignment: Text.AlignHCenter
        anchors.verticalCenter: parent.verticalCenter
        visible:true
    }

    TextField {
        id: textField1
        height: 45

        placeholderText: "搜尋線上商城和此電腦中的伺服器..."
        renderType: Text.NativeRendering
        anchors.right: switch1.left
        anchors.rightMargin: 20
        font.italic: true
        anchors.verticalCenter: parent.verticalCenter
        font.family: "Microsoft JhengHei UI"
        anchors.left: label.right
        anchors.leftMargin: 30
        visible:true
        Material.accent: Material.Blue
    }

    Switch {
        id: switch1
        text: qsTr(" 鎖定 ")
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 12
        spacing: 0
        checked: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        visible:true
        Material.accent: Material.Blue
    }
}
