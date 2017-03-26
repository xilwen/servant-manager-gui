import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id: button
    width: 143
    height: 62
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias title:title.text
    property alias image:image.source
    property string bgColor:"white"
    property alias mouseArea: mouseArea
    property string indicatorName:""
    Layout.minimumHeight: 62
    Layout.minimumWidth: 143
    Layout.maximumHeight: 62
    Layout.maximumWidth: 143
    opacity: 1
    Material.elevation: 0
    Material.background: mouseArea.containsMouse?bgColor:"white"

    Text{
        id: title
        width: 141
        height: 25
        anchors.centerIn: parent
        text:qsTr("標題")
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 6
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 15
        color:mouseArea.containsMouse?"white":"black"

    }
    MouseArea {
        id: mouseArea
        anchors.leftMargin: 0
        anchors.fill: parent
        hoverEnabled: true

    }
    Rectangle {
        id:imagebackground
        y: 6
        width: 57
        height: 50
        color: bgColor
        anchors.left: parent.left
        anchors.leftMargin: -57
        Image {
            id: image
            width: 32
            anchors.right: parent.right
            anchors.rightMargin: 11
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 9
            anchors.top: parent.top
            anchors.topMargin: 9
            source: ""
        }
    }
}
