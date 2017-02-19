import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.0

Pane {
    id: overviewModule_ServerQuickInfo
    width: 350
    height: 380
    anchors.top: parent.top
    anchors.topMargin: 54
    Material.background: "White"
    Material.elevation:3
    Material.accent:"#FFFFFF"
    Label {
        id: label9
        width: 144
        height: 36
        text: qsTr("伺服器資訊")
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 7
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }

    OverviewModule_ServerQuickInfoBlock{
        id: block0
        anchors.left: label9.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 55
        title: qsTr("連接埠")
        info: qsTr("21")
    }

    OverviewModule_ServerQuickInfoBlock{
        id: block1
        anchors.verticalCenter: block0.verticalCenter
        anchors.left: block0.right
        anchors.leftMargin: 20
        title: qsTr("服務")
        info: qsTr("FTP")
    }

    OverviewModule_ServerQuickInfoBlock{
        id: block2
        anchors.left: block0.left
        anchors.leftMargin: 0
        anchors.top: block0.bottom
        anchors.topMargin: 10
        title: qsTr("運作中")
        info: qsTr("不明")
    }

    Label {
        id: label16
        y: 334
        height: 24
        text: qsTr("SERVANT Watchdog 未運作")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
        color:"#616161"
        font.pointSize: 14
    }
}
