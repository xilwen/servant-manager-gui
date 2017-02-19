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
    id: overviewModuleInfo
    width: 799
    height: 200
    property alias titleText: title.text
    property alias infoText: info.text
    padding: 12
    Material.background: "#2196F3"
    Material.elevation:3
    Material.accent:"#FFFFFF"

    Label {
        id: title
        width: 240
        height: 42
        color: "#ffffff"
        text: qsTr("標題")
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


