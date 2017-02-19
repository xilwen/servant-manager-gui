import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.0

Pane {
    id: overviewPane_Normal
    objectName: "overviewPane"
    width: 800
    height: 600
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    OverviewModule_Info{
        id:overviewModuleInfo
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 3
        anchors.left: parent.left
        anchors.leftMargin: 3
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

}
