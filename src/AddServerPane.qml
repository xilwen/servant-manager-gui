import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addServerPane
    property alias serverNameText: serverNameTextField.text
    width: 823
    height: 579
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    z:3
    Material.accent: Material.Indigo

    onVisibleChanged: {
        if(!visible){
            serverProductInfoPane.newServerName = serverNameTextField.text
        }
    }

    BackButton{
        pageName: qsTr("安裝新伺服器")
        button.onClicked:{
            addServerPane.visible = false
        }
    }

    Label {
        id: serverTypeLabel
        width: 100
        height: 35
        text: "正要安裝："
        anchors.horizontalCenterOffset: -315
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 75
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    Image {
        id: newServerTypeImage
        width: 48
        height: 48
        anchors.horizontalCenterOffset: -340
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: serverTypeLabel.bottom
        anchors.topMargin: 15
        source: serverProductInfoPane.itemIcon

        Label {
            id: serverTypeLabel1
            x: 63
            y: 7
            width: 121
            height: 35
            text: serverProductInfoPane.itemName
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 15
            horizontalAlignment: Text.AlignLeft
            anchors.left: newServerTypeImage.right
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }
    }

    Label {
        id: serverNameLabel
        width: 400
        height: 35
        text: "設定新伺服器的名稱(或留白以自動產生)："
        anchors.horizontalCenterOffset: -160
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: serverTypeLabel.bottom
        anchors.topMargin: 80
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"

    }

    TextField {
        id: serverNameTextField
        width: 725
        anchors.left: serverNameLabel.left
        anchors.leftMargin: 0
        anchors.top: serverNameLabel.bottom
        anchors.topMargin: 10
        font.pointSize: 15
        horizontalAlignment: Text.AlignLeft
        font.family: "Microsoft JhengHei UI"
        selectByMouse: true
        property int ii: 0
        property bool formatOK: true
        onTextChanged: {
            formatOK = true
            for(ii = 0; ii < text.length; ++ii){
                if(text[ii] === " " || text[ii] === "\\" || text[ii] === "\t"){
                    formatOK = false
                }
            }
            if(!formatOK){
                errorHappenedPane.open("輸入字元無效", "請不要使用空格或者特殊符號。");
                text = ""
            }
        }
    }

    Image {
        id: addServerHintImage
        y: 235
        width: 36
        height: 36
        anchors.horizontalCenterOffset: -340
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 75
        source: "icon/ic_info_black_24dp.png"

        Label {
            id: addServerHintLabel
            x: 46
            y: 0
            width: 629
            height: 35
            text: "在安裝完成後，可以使用 VirtualBox 針對虛擬機器進行進階設定。"
            anchors.left: addServerHintImage.right
            anchors.leftMargin: 10
            anchors.verticalCenter: addServerHintImage.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }
    }

    AddServerModule_BottomPane{
        nextButtonText: "選擇效能需求"
        previousButtonVisible: false
        progressValue: 0.25
        nextButton.onClicked: {
            addServerPane_PerformanceSetting.visible = true
            addServerPane.visible = false
        }
    }
}
