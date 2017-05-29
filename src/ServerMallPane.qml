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
    property int itemsInRow : 0
    onWidthChanged: {
        itemsInRow = width % (mallItemButton.width+20)
        mallItemButton1.x=66
    }

    onVisibleChanged:
    {
        if(visible)
        {
            tmpCmd.triggerMallItemViewUpdate()
        }
    }

    OverviewModule_Info{
        id:welcome
        height: 160
        anchors.right: parent.right
        anchors.rightMargin: -12
        anchors.left: parent.left
        anchors.leftMargin: -12
        anchors.top: parent.top
        anchors.topMargin: -12
        titleText: qsTr("伺服器商城")
        infoText: qsTr("探索、下載並輕鬆安裝伺服器")
        imageSource: "icon/ServerMallPane_bg.png"
        z:2
        ServerMallButton{
            id: refreshListButton
            serverTitle: qsTr(" 更新伺服器清單")
            serverImageSource:"icon/ic_cached.png"
            x: 20
            y: 2
            width: 256
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            onClicked:{
                tmpCmd.triggerRepositoryUpdate()
            }
        }
    }


    Flickable {
        id: flickable
        anchors.rightMargin: -12
        anchors.bottomMargin: -12
        anchors.leftMargin: -12
        anchors.topMargin: 137
        anchors.fill: parent
        maximumFlickVelocity: 1500
        flickDeceleration: 2500
        contentHeight: fpane.height
        ScrollBar.vertical: ScrollBar { id: vbar; active: vbar.active }
        Pane {
            id: fpane
            spacing: 40
            width: mallItemButton.x + (mallItemButton.width * 2) + (mallItemButton1.anchors.leftMargin * 2)
            height: mallItemButton.y + (mallItemButton.height * 5) + (mallItemButton2.anchors.topMargin * 5)
            anchors.horizontalCenterOffset: -5
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 0
            ServerObjectButton{
                id: mallItemButton
                objectName: "serverObjectButton0"
                x:44
                y:40
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: ""
                visible: true
                onClicked:{
                    serverProductInfoPane.itemIndex = 0
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
                id: mallItemButton1
                objectName: "serverObjectButton1"
                anchors.top: mallItemButton.top
                anchors.topMargin: 0
                anchors.left: mallItemButton.right
                anchors.leftMargin: 36
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: ""
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
                id: mallItemButton2
                objectName: "serverObjectButton2"
                anchors.left: parent.left
                anchors.leftMargin: 44
                anchors.top: mallItemButton.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: ""
                onClicked:{
                    serverProductInfoPane.itemIndex = 2
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
                id: mallItemButton3
                objectName: "serverObjectButton3"
                anchors.top: mallItemButton1.bottom
                anchors.topMargin: 25
                anchors.left: mallItemButton2.right
                anchors.leftMargin: 36
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: ""
                onClicked:{
                    serverProductInfoPane.itemIndex = 3
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
                id: mallItemButton4
                objectName: "serverObjectButton4"
                anchors.left: parent.left
                anchors.leftMargin: 44
                anchors.top: mallItemButton2.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: ""
                onClicked:{
                    serverProductInfoPane.itemIndex = 4
                    serverMallPane.visible=false
                    serverProductInfoPane.visible=true
                    overviewPane_Empty.visible=false
                    overviewPane_Normal.visible=false
                    diagnosisPane.visible=false
                    sharePane.visible=false
                    settingPane.visible=false
                }
            }

            ServerObjectButton {
                id: mallItemButton5
                width: 345
                height: 84
                anchors.top: mallItemButton3.bottom
                anchors.topMargin: 25
                anchors.left: mallItemButton4.right
                anchors.leftMargin: 36
                objectName: "serverObjectButton5"
                serverTitle: qsTr("標題")
                serverImageSource: ""
                serverSubtitle: qsTr("副標題")
                onClicked:{
                    serverProductInfoPane.itemIndex = 2
                    serverMallPane.visible=false
                    serverProductInfoPane.visible=true
                    overviewPane_Empty.visible=false
                    overviewPane_Normal.visible=false
                    diagnosisPane.visible=false
                    sharePane.visible=false
                    settingPane.visible=false
                }
            }
            ServerObjectButton {
                id: mallItemButton6
                x: 44
                width: 345
                height: 84
                anchors.top: mallItemButton4.bottom
                anchors.topMargin: 25
                objectName: "serverObjectButton6"
                serverTitle: qsTr("標題")
                serverImageSource: ""
                serverSubtitle: qsTr("副標題")
            }

            ServerObjectButton {
                id: mallItemButton7
                width: 345
                height: 84
                anchors.left: mallItemButton6.right
                anchors.leftMargin: 36
                anchors.top: mallItemButton5.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                objectName: "serverObjectButton7"
                serverImageSource: ""
                serverSubtitle: qsTr("副標題")
            }

            ServerObjectButton {
                id: mallItemButton8
                x: 44
                width: 345
                height: 84
                anchors.top: mallItemButton6.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                objectName: "serverObjectButton8"
                serverImageSource: ""
                serverSubtitle: qsTr("副標題")
            }

            ServerObjectButton {
                id: mallItemButton9
                x: 425
                width: 345
                height: 84
                serverTitle: qsTr("標題")
                anchors.topMargin: 25
                objectName: "serverObjectButton9"
                serverImageSource: ""
                anchors.top: mallItemButton7.bottom
                serverSubtitle: qsTr("副標題")
            }
        }
    }
}







