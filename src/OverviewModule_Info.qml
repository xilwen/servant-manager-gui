import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: overviewModuleInfo
    width: 799
    height: 200
    property alias titleText: title.text
    property alias infoText: info.text
    property alias imageSource: bg.source
    padding: 12
    Material.background: "#2196F3"
    Material.elevation:3
    Material.accent:"#FFFFFF"
    Image {
        id: bg
        source: "icon/MyServerPane.png"
        fillMode: Image.PreserveAspectCrop
        anchors.rightMargin: -12
        anchors.leftMargin: -12
        anchors.bottomMargin: -12
        anchors.topMargin: -12
        anchors.fill: parent
    }

    Label {
        id: title
        width: 240
        color: "#ffffff"
        text: qsTr("標題")
        z: 1
        fontSizeMode: Text.VerticalFit
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 15
        styleColor: "#ffffff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 32
        font.family: "Microsoft JhengHei UI"
        Material.accent:"#FFFFFF"
    }

    Label {
        id: info
        width: 679
        height: 82
        color: "#ffffff"
        text: qsTr("說明文字")
        z: 1
        anchors.left: title.left
        anchors.leftMargin: 2
        anchors.top: title.bottom
        anchors.topMargin: 15
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
        Material.accent:"#FFFFFF"
    }


}


