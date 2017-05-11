import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Label {
    id: label
    text: qsTr("標題")
    color:"#212121"
    property alias label2: label2.text
    height: 28
    width: 640
    opacity: 1
    visible: true
    font.pointSize: 16
    font.family: "Microsoft JhengHei UI"

    Label {
        id: label2
        y: 0
        text: qsTr("內容")
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        color:"#212121"
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: 0
        height: 28
        width: 200
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
    }

}
