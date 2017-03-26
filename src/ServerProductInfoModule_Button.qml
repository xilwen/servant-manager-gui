import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id: button
    width: 145
    height: 48
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias title: title.text
    Layout.minimumHeight: 48
    Layout.minimumWidth: 145
    Layout.maximumHeight: 48
    Layout.maximumWidth: 145
    opacity: 1
    visible: true
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.elevation: 0
    Material.background: "white"
    Label {
        id: title
        x: 26
        text: qsTr("標題")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        width: 93
        height: 26
        font.family: "Microsoft JhengHei UI";
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.leftMargin: 8
        font.pointSize: 16
    }

}
