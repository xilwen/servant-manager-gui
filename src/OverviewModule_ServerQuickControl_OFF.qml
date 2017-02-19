import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.0

Pane {
    width: 350
    height: 380
    anchors.top: parent.top
    anchors.topMargin: 54
    Material.background: "White"
    Material.elevation:3
    Material.accent:"#FFFFFF"
    Label {
        id: titleLabel
        width: 144
        height: 36
        text: qsTr("快速控制")
        anchors.left: parent.left
        anchors.leftMargin: 7
        anchors.top: parent.top
        anchors.topMargin: 7
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
    }

    OverviewModule_ServerQuickControlBlock{
        id: block0
        name: qsTr("刪除伺服器")
        anchors.left: titleLabel.left
        anchors.leftMargin: 0
        anchors.top: titleLabel.bottom
        anchors.topMargin: 10
        info: qsTr("完整移除相關的檔案")
        imageSource: "icon/ic_delete_black_48dp_2x.png"
    }

    OverviewModule_ServerQuickControlBlock{
        id: block1
        name: qsTr("開啟 VirtualBox")
        info: qsTr("")
        anchors.left: block0.left
        anchors.leftMargin: 0
        anchors.top: block0.bottom
        anchors.topMargin: 10
        imageSource: "icon/ic_exit_to_app_black_48dp_2x.png"
    }

    OverviewModule_ServerQuickControlBlock{
        id: block2
        anchors.left: block1.left
        anchors.leftMargin: 0
        anchors.top: block1.bottom
        anchors.topMargin: 10
        name: qsTr("快照管理")
        info: qsTr("")
        imageSource: "icon/ic_camera_alt_black_48dp_2x.png"
    }
}
