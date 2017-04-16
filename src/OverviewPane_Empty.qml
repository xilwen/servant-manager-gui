import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: overviewPane_Empty
    objectName: "overviewPane"
    width: 800
    height: 600
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    OverviewModule_Info{
        id:overviewModuleInfo
        height: 160
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        titleText: qsTr("歡迎")
        infoText: qsTr("您可以從左方的「伺服器商城」下載並架設伺服器。\n已經在VirtualBox上設定好伺服器了嗎? 請造訪分享與備份，以匯入伺服器。")
    }

    Label {
        id: emptyLabel
        font.family: "Microsoft JhengHei UI"
        text: qsTr("這裡一片空白。")
        anchors.horizontalCenterOffset: 1
        anchors.verticalCenterOffset: 67
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Pane {
        id: bottomPane
        height: 50
        padding: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.elevation: 3
        Material.background: "white"

        Button {
            id: button3
            x: 687
            width: 220
            height: 48
            text: qsTr("新增伺服器")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            onClicked: {
                overviewPane_Empty.visible = false
                serverMallPane.visible = true
            }
        }

    }

    AddServerPane{
        id: addServerPane
        visible:false
    }
}
