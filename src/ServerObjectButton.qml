import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id: button
    width: 345
    height: 84
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias serverTitle: serverTitle.text
    property alias serverSubtitle: serverSubtitle.text
    property alias serverImageSource: serverImage.source
    Layout.minimumHeight: 84
    Layout.minimumWidth: 345
    Layout.maximumHeight: 84
    Layout.maximumWidth: 345
    opacity: 1
    visible: true
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.background: "#FFFFFF"
    Material.elevation: 8

    Label {
        id: serverTitle
        text: qsTr("標題")
        width: 178
        height: 26
        font.family: "Microsoft JhengHei UI";
        anchors.top: parent.top
        anchors.topMargin: 16
        anchors.left: serverImage.right
        anchors.leftMargin: 8
        font.pointSize: 16
    }
    Label {
        id: serverSubtitle
        text: qsTr("副標題")
        anchors.left: serverTitle.left
        anchors.leftMargin: 0
        verticalAlignment: Text.AlignVCenter
        anchors.top: serverTitle.bottom
        anchors.topMargin: 0
        font.pointSize: 12
        width: 178
        height: 26
        horizontalAlignment: Text.AlignLeft
        font.family: "Microsoft JhengHei UI";
        anchors.bottomMargin: 3
        color:"#616161"
    }
    Image{
        id: serverImage
        width: 56
        height: 56
        antialiasing: true
        anchors.verticalCenter: parent.verticalCenter
        source: ""
        z: 3
        anchors.left: parent.left
        anchors.leftMargin: 10
        sourceSize.height: 64
        sourceSize.width: 64
        fillMode: Image.Stretch

    }
}
