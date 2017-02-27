import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: serverMallPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName:"serverMallPane"
    ServerObjectButton{
        id: ftpserverbutton
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: label.bottom
        anchors.topMargin: 10
        serverTitle: qsTr("FTP 伺服器")
        serverSubtitle: qsTr("基本的FTP 伺服器")
        serverImageSource: "icon/ic_folder_black_48dp_2x.png"
        onClicked:{
            serverMallPane.visible=false
            serverProductInfoPane.visible=true
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }
    }
    ServerMallButton{
        id: refreshListButton
        serverTitle: qsTr(" 更新伺服器清單")
        serverImageSource:"icon/ic_cached.png"
        anchors.top: parent.top
        anchors.topMargin: 16
        x: 20
        y: 2

    }
    ServerMallButton{
        id: wishListButton
        serverTitle:qsTr("願望清單")
        serverImageSource:"icon/ic_done.png"
        anchors.top: parent.top
        anchors.topMargin: 16
        y: 2
        anchors.left: refreshListButton.right
        anchors.leftMargin: 36


    }

    Label {
        id: label
        text: qsTr("檔案伺服器")
        anchors.left: refreshListButton.left
        anchors.leftMargin: 0
        anchors.top: refreshListButton.bottom
        anchors.topMargin: 18
        font.bold: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
    }

    Image {
        id: image
        x: 676
        y: 33
        width: 30
        height: 30
        anchors.right: parent.right
        anchors.rightMargin: 93
        source: "icon/ic_sync_problem.png"
    }

    Label {
        id: label1
        y: 37
        height: 22
        text: qsTr("有更新")
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: image.right
        anchors.leftMargin: 4
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
        verticalAlignment: Text.AlignVCenter
    }
}







