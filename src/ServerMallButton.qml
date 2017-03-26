import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id: button1
    height: 56
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias serverTitle: serverTitle.text
    property alias serverImageSource: serverImage.source
    property alias button1: button1
    width: 300
    Layout.minimumHeight: 64
    Layout.minimumWidth: 300
    Layout.maximumHeight: 64
    Layout.maximumWidth: 300
    opacity: 1
    visible: true
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.background: "#FFFFFF"
    Material.elevation: 8
    onClicked: {

    }
    Label {
        id: serverTitle
        text: qsTr("標題")
        anchors.verticalCenter: parent.verticalCenter
        width: 178
        height: 26
        font.family: "Microsoft JhengHei UI";
        anchors.left: serverImage.right
        anchors.leftMargin: 5
        font.pointSize: 16
    }

    Image{
        id: serverImage
        width: 32
        height: 32
        anchors.verticalCenter: parent.verticalCenter
        z: 3
        anchors.left: parent.left
        anchors.leftMargin: 10
        sourceSize.height: 60
        sourceSize.width: 60
        fillMode: Image.Stretch
    }
}
