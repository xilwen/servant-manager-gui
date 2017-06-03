import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id: button
    width: 600
    height: 45
    property alias name: nameLabel.text
    property alias info: infoLabel.text
    property alias imageSource: actionImage.source
    property alias additionalButton: button1
    property bool showAdditionalButton: false
    property bool additionalButtonIsInfo: false
    Material.background:"White"
    Material.elevation:0

    Label {
        id: nameLabel
        width: 167
        height: 24
        text: qsTr("開啟伺服器檔案")
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: actionImage.right
        anchors.leftMargin: 10
        font.family: qsTr("Microsoft JhengHei UI")
        font.pointSize: 16
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    Label {
        id: infoLabel
        width: 63
        height: 24
        text: qsTr("Z:/")
        visible: false
        anchors.left: nameLabel.left
        anchors.leftMargin: 0
        anchors.top: nameLabel.bottom
        anchors.topMargin: 5
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
        verticalAlignment: Text.AlignVCenter
        Material.foreground: "#757575"
    }

    Image {
        id: actionImage
        width: 32
        height: 32
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        source: ""
    }

    Button {
        id: button1
        x: 501
        width: 150
        Material.foreground: "white"
        Material.background: (additionalButtonIsInfo) ? Material.Indigo : Material.Green
        Material.elevation: 0
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
        text: qsTr("Button")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        visible: (showAdditionalButton)? true : false
    }
}
