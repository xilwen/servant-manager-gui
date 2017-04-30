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
        itemsInRow = width % (joomlaserverbutton.width+20)
        joomlaserverbutton1.x=66
    }

    onVisibleChanged:
    {
        tmpCmd.triggerMallItemViewUpdate()
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
        contentHeight: parent.height
        ScrollBar.vertical: ScrollBar { id: vbar; active: vbar.active }
        Pane {
            id: fpane
            spacing: 40
            width: flickable.width
            height: flickable.height
            padding: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            ServerObjectButton{
                id: joomlaserverbutton
                objectName: "serverObjectButton0"
                x:44
                y:25
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: "icon/Joomla-flat-logo-en.png"
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
                id: joomlaserverbutton1
                objectName: "serverObjectButton1"
                anchors.top: parent.top
                anchors.topMargin: 25
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
                objectName: "serverObjectButton2"
                anchors.left: parent.left
                anchors.leftMargin: 44
                anchors.top: joomlaserverbutton.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: "icon/Joomla-flat-logo-en.png"
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
                id: joomlaserverbutton3
                objectName: "serverObjectButton3"
                anchors.top: joomlaserverbutton1.bottom
                anchors.topMargin: 25
                anchors.left: joomlaserverbutton2.right
                anchors.leftMargin: 36
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: "icon/Joomla-flat-logo-en.png"
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
                id: joomlaserverbutton4
                objectName: "serverObjectButton4"
                anchors.left: parent.left
                anchors.leftMargin: 44
                anchors.top: joomlaserverbutton2.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                serverSubtitle: qsTr("副標題")
                serverImageSource: "icon/Joomla-flat-logo-en.png"
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
                id: joomlaserverbutton5
                width: 345
                height: 84
                anchors.top: joomlaserverbutton3.bottom
                anchors.topMargin: 25
                anchors.left: joomlaserverbutton4.right
                anchors.leftMargin: 36
                objectName: "serverObjectButton5"
                serverTitle: qsTr("標題")
                serverImageSource: "icon/Joomla-flat-logo-en.png"
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
                id: joomlaserverbutton6
                x: 44
                width: 345
                height: 84
                anchors.top: joomlaserverbutton4.bottom
                anchors.topMargin: 25
                objectName: "serverObjectButton6"
                serverTitle: qsTr("標題")
                serverImageSource: "icon/Joomla-flat-logo-en.png"
                serverSubtitle: qsTr("副標題")
            }

            ServerObjectButton {
                id: joomlaserverbutton7
                width: 345
                height: 84
                anchors.left: joomlaserverbutton6.right
                anchors.leftMargin: 36
                anchors.top: joomlaserverbutton5.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                objectName: "serverObjectButton7"
                serverImageSource: "icon/Joomla-flat-logo-en.png"
                serverSubtitle: qsTr("副標題")
            }

            ServerObjectButton {
                id: joomlaserverbutton8
                x: 44
                width: 345
                height: 84
                anchors.top: joomlaserverbutton6.bottom
                anchors.topMargin: 25
                serverTitle: qsTr("標題")
                objectName: "serverObjectButton8"
                serverImageSource: "icon/Joomla-flat-logo-en.png"
                serverSubtitle: qsTr("副標題")
            }

            ServerObjectButton {
                id: joomlaserverbutton9
                x: 425
                width: 345
                height: 84
                serverTitle: qsTr("標題")
                anchors.topMargin: 25
                objectName: "serverObjectButton9"
                serverImageSource: "icon/Joomla-flat-logo-en.png"
                anchors.top: joomlaserverbutton7.bottom
                serverSubtitle: qsTr("副標題")
            }
        }
    }
}







