import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id: button1
    width: 700
    height: 55
    property alias title: titleLabel.text
    property alias info: infoLabel.text
    Material.elevation:0
    Material.background: "White"
    Label {
        id: titleLabel
        width: 65
        height: 24
        text: qsTr("標題")
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 16
        color:"#616161"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    Label {
        id: infoLabel
        x: 7
        width: 65
        height: 31
        text: qsTr("內容")
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignRight
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
    }
}
