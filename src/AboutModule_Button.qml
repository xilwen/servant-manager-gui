import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1
Button {
    id: button
    width: 135
    height: 36
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias title: title.text
    property alias button: button
    Layout.minimumHeight: 36
    Layout.minimumWidth: 135
    Layout.maximumHeight: 36
    Layout.maximumWidth: 135
    opacity: 1
    visible: true
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.elevation:0
    onClicked: {

    }
    Label {
        id: title
        x: 26
        text: qsTr("標題")
        color:"#FFFFFF"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        width: 83
        height: 26
        font.family: "Microsoft JhengHei UI";
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.leftMargin: 8
        font.pointSize: 16
    }


}


