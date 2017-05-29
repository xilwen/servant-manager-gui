import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addServerPane_PortSetting
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
            serverProductInfoPane.newServerPort = parseInt(newServerPortTextField.text)
        }
    }

    BackButton{
        showBackButton: false
        pageName: qsTr("安裝新伺服器 - 自訂連接埠")
    }

    Image {
        id: newServerTypeImage
        width: 48
        height: 48
        anchors.horizontalCenterOffset: -340
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 65
        source: serverProductInfoPane.itemIcon

        Label {
            id: serverTypeLabel
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
        id: portIntroductionLabel
        width: 400
        height: 35
        text: "連接埠可以協助電腦辨識來自網路的要求，要由哪個程式進行處理。\n例如常見的網頁瀏覽，就會使用 80 或 443 連接埠進行通訊。\n\n這個伺服器預設的連接埠是 " + serverProductInfoPane.itemMainPort.toString() + "，可以接受非預設的連接埠值。"
        anchors.verticalCenterOffset: -100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -150
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: serverTypeLabel.bottom
        anchors.topMargin: 80
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
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
            text: "除非確定需要修改，大部分時候保持預設值即可。"
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
        previousButtonText: "選擇效能需求"
        nextButtonText: "伺服器位置"
        previousButtonVisible: true
        progressValue: 0.75
        previousButton.onClicked: {
            addServerPane_PerformanceSetting.visible = true
            addServerPane_PortSetting.visible = false
        }

        nextButton.onClicked: {
            addServerPane_PlaceSetting.visible = true
            addServerPane_PortSetting.visible = false
        }
    }

    CheckBox {
        id: portSettingcheckBox
        x: 62
        y: 305
        text: qsTr("變更連接埠")
        anchors.horizontalCenterOffset: -280
        anchors.verticalCenterOffset: 55
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        TextField {
            id: newServerPortTextField
            y: 359
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            anchors.leftMargin: 0
            font.pointSize: 15
            selectByMouse: true
            horizontalAlignment: Text.AlignHCenter
            visible: (portSettingcheckBox.checked)? true : false
            text: serverProductInfoPane.itemMainPort
        }
    }
}
