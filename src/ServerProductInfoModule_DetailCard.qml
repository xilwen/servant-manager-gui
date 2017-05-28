import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1
Button {
    id: button
    height: (uriInside)? (75 + Math.abs(subtitle.height - 20)) : 75
    width: 364
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias title:title.text
    property alias subtitle:subtitle.text
    property alias introduction:introduction.text
    property alias detail:detail.text
    property alias button: button
    property bool uriInside: false
    Material.background: "white"
    Material.elevation: 0
    opacity:1

    onClicked: {
        if(uriInside){
            tmpCmd.triggerStartURI(subtitle.text)
        }
    }

    Label {
        id: title
        text: qsTr("標題")
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
    }

    Label {
        id: subtitle
        text: qsTr("副標題")
        Layout.minimumHeight: 20
        anchors.top: title.bottom
        anchors.topMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        wrapMode: Text.WordWrap
        font.family: "Microsoft JhengHei UI"
        font.pointSize: ((uriInside)? 14 : 18)
    }
    Label {
        id: introduction
        x: 8
        y: 1
        text: qsTr("簡介")
        visible: true
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.left: parent.left
        anchors.topMargin: 83
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
    }

    Label {
        id: detail
        x: 9
        y: -6
        width: 346
        height: 139
        text:qsTr("說明")
        visible: true
        wrapMode: Text.WordWrap
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.left: parent.left
        font.family: "Microsoft JhengHei UI"
        anchors.topMargin: 115
        font.pointSize: 14
    }
}
