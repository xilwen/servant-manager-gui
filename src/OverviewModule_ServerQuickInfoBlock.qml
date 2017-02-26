import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id: button1
    width: 145
    height: 80
    property alias title: titleLabel.text
    property alias info: infoLabel.text
    Material.elevation:3
    Material.background: "White"
    Label {
        id: titleLabel
        width: 65
        height: 24
        text: qsTr("標題")
        anchors.left: parent.left
        anchors.leftMargin: 7
        anchors.top: parent.top
        anchors.topMargin: 13
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
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
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 13
        anchors.top: titleLabel.bottom
        anchors.topMargin: 0
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 16
        verticalAlignment: Text.AlignVCenter
    }
}
