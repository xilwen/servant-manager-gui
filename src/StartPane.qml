import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2
import QtQuick 2.0

Pane {
    id: startPane
    width: 1024
    height: 640
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    visible:false
    //visible:true
    Material.theme: Material.White

    Text {
        id: text1
        x: 367
        width: 267
        height: 57
        text: qsTr("安裝已完成")
        anchors.top: parent.top
        anchors.topMargin: 289
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 20
        font.family: "Microsoft JhengHei UI"
    }

    Button {
        id: button
        x: 179
        width: 163
        height: 67
        text: qsTr("立刻啟動")
        anchors.top: parent.top
        anchors.topMargin: 425
        font.pointSize: 17
        Material.elevation: 3
        highlighted: true
        Material.background: "#FFFFFF"
    }

    Button {
        id: button1
        y: 425
        width: 163
        height: 67
        text: qsTr("關閉")
        anchors.left: button.right
        anchors.leftMargin: 326
        font.pointSize: 17
        Material.elevation: 3
        highlighted: true
        Material.background: "#FFFFFF"
    }



}
