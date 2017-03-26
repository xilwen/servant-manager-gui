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
        id: joomlaserverbutton
        x: 20
        y: 116
        serverTitle: qsTr("標題")
        serverSubtitle: qsTr("副標題")
        serverImageSource: "icon/Joomla-flat-logo-en.png"
        onClicked:{
            serverProductInfoPane.itemIndex = 1
            serverMallPane.visible=false
            serverProductInfoPane.visible=true
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }
    }
    ServerObjectButton{
        id: joomlaserverbutton1
        y: 116
        anchors.left: joomlaserverbutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("標題")
        serverSubtitle: qsTr("副標題")
        serverImageSource: "icon/Joomla-flat-logo-en.png"
        onClicked:{
            serverProductInfoPane.itemIndex = 1
            serverMallPane.visible=false
            serverProductInfoPane.visible=true
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }
    }
    ServerObjectButton{
        id: joomlaserverbutton2
        x: 20
        anchors.top: joomlaserverbutton.bottom
        anchors.topMargin: 25
        serverTitle: qsTr("標題")
        serverSubtitle: qsTr("副標題")
        serverImageSource: "icon/Joomla-flat-logo-en.png"
        onClicked:{
            serverProductInfoPane.itemIndex = 1
            serverMallPane.visible=false
            serverProductInfoPane.visible=true
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }
    }
    ServerObjectButton{
        id: joomlaserverbutton3
        y: 225
        anchors.left: joomlaserverbutton2.right
        anchors.leftMargin: 36
        serverTitle: qsTr("標題")
        serverSubtitle: qsTr("副標題")
        serverImageSource: "icon/Joomla-flat-logo-en.png"
        onClicked:{
            serverProductInfoPane.itemIndex = 1
            serverMallPane.visible=false
            serverProductInfoPane.visible=true
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }
    }
    ServerObjectButton{
        id: joomlaserverbutton4
        x: 20
        anchors.top: joomlaserverbutton2.bottom
        anchors.topMargin: 25
        serverTitle: qsTr("標題")
        serverSubtitle: qsTr("副標題")
        serverImageSource: "icon/Joomla-flat-logo-en.png"
        onClicked:{
            serverProductInfoPane.itemIndex = 1
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







