import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1
Button {
    id: button
    height: 75
    width:364
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias title:title.text
    property alias subtitle:subtitle.text
    property alias introduction:introduction.text
    property alias detail:detail.text
    property alias button: button
    Layout.minimumHeight: 75
    Layout.minimumWidth: 364
    Layout.maximumHeight: 75
    Layout.maximumWidth: 364
    Material.background: "white"
    Material.elevation: 0
    opacity:1
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
        x: 9
        y: 34
        text: qsTr("副標題")
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 11
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 18
    }
    Label {
        id: introduction
        x: 8
        y: 1
        text: qsTr("簡介")
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
        wrapMode: Text.WordWrap
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.left: parent.left
        font.family: "Microsoft JhengHei UI"
        anchors.topMargin: 115
        font.pointSize: 14
    }
}
