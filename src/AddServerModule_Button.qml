import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1


Button {
    id: button
    width: 180
    height: 48
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias title:title.text
    property alias addServerHintImage:addServerHintImage.source
    Layout.minimumHeight: 48
    Layout.minimumWidth: 180
    Layout.maximumHeight: 48
    Layout.maximumWidth: 180
    opacity: 1
    Material.elevation: 0
    Material.background: "white"
    Image {
        id: addServerHintImage
        y: 235
        width: 24
        height: 24
        source: ""
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
    }

    Label {
        id: title
        y: 12
        width: 78
        height: 24
        text: qsTr("標題")
        font.pointSize: 14
        font.family: "Microsoft JhengHei UI"
        anchors.left: addServerHintImage.right
        anchors.leftMargin: 18
        verticalAlignment: Text.AlignVCenter
    }
}

