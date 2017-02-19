import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.0

Pane {
    id: overviewPane_Empty
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
        titleText: qsTr("歡迎")
        infoText: qsTr("您可以從左方的「伺服器商城」下載並架設伺服器。\n已經在VirtualBox上設定好伺服器了嗎? 請造訪分享與備份，以匯入伺服器。")
    }

    Label {
        id: emptyLabel
        font.family: "Microsoft JhengHei UI"
        text: qsTr("這裡一片空白。")
        anchors.verticalCenterOffset: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
