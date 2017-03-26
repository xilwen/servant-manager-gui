import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Label {
    //id:label1
    text: qsTr("標題")
    color:"#212121"
    //property alias label1: label1.text
    property alias label2: label2.text
    Layout.minimumHeight: 28
    Layout.minimumWidth: 320
    Layout.maximumHeight: 28
    Layout.maximumWidth: 320
    height: 28
    width: 320
    opacity: 1
    visible: true
    font.pointSize: 16
    font.family: "Microsoft JhengHei UI"

    Label {
        id: label2
        y: 0
        text: qsTr("副標題")
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        color:"#212121"
        anchors.left: parent.right
        anchors.leftMargin: 21
        height: 28
        width: 96
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
    }

}


