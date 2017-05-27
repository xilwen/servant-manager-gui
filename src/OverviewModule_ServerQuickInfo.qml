import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1
import QtQuick.Dialogs 1.2

Pane {
    id: overviewModule_ServerQuickInfo
    width: 700
    height: 200
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
        height: 50
        anchors.left: label9.left
        anchors.leftMargin: 0
        anchors.top: label9.bottom
        anchors.topMargin: 10
        title: qsTr("連接埠(Port)")
        info: serverInfoPane.serverPortNumber
    }

    OverviewModule_ServerQuickInfoBlock{
        id: block1
        anchors.top: block0.bottom
        anchors.topMargin: 0
        anchors.left: block0.left
        anchors.leftMargin: 0
        title: qsTr("管理介面網址")
        info: serverInfoPane.serverManagementURL
    }

    OverviewModule_ServerQuickInfoBlock{
        id: block2
        anchors.left: block0.left
        anchors.leftMargin: 0
        anchors.top: block1.bottom
        anchors.topMargin: 0
        title: qsTr("如何連線到伺服器？")
        info: serverInfoPane.serverShareURL
        onClicked: {
            errorHappenedPane.open("關於此伺服器IP", "這個IP位置是由ipify.org以及電腦的作業系統回報，以及設定時的位置選項產生的。\n因此SERVANT不保證其完全正確。")
        }
    }
}
