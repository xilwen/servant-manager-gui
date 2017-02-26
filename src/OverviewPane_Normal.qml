import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: overviewPane_Normal
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
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 15
        titleText: qsTr("一切正常")
        infoText: qsTr("目前 SERVANT 服務皆正常運作中。")
    }

    OverviewModule_ServerQuickAction
    {
        id:  overviewModuleServerQuickAction
        anchors.left: overviewModuleInfo.left
        anchors.leftMargin: 0
        anchors.top: overviewModuleInfo.bottom
        anchors.topMargin: 20
        imageSource: "icon/ic_folder_black_48dp_2x.png"
        type: qsTr("FTP伺服器")
        quickActionName: qsTr("管理伺服器")
        quickActionButton.onClicked: {
            overviewPane_Normal.visible = false
            serverInfoPane.visible = true
        }
        onClicked: {
            overviewPane_Normal.visible = false
            serverInfoPane.visible = true
        }
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
            text: qsTr("新增已下載的伺服器")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            onClicked: addServerPane.visible = true
        }
    }

    AddServerPane{
        id: addServerPane
        visible:false
    }
}
