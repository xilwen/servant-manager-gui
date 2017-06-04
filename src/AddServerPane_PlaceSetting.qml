import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addServerPane_PlaceSetting
    width: 823
    height: 579
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    z: 3
    Material.accent: Material.Indigo

    BackButton{
        showBackButton: false
        pageName: qsTr("安裝新伺服器 - 伺服器位置")
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
            text: "這個設定會影響 SERVANT 提供伺服器連線網址的設定。"
            anchors.left: addServerHintImage.right
            anchors.leftMargin: 10
            anchors.verticalCenter: addServerHintImage.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }
    }

    RadioButton {
        id: radioButton
        x: 50
        y: 162
        text: qsTr("住家、公司內部")
        anchors.horizontalCenterOffset: -175
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -100
        anchors.verticalCenter: parent.verticalCenter
        checked: true
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        visible: (serverProductInfoPane.itemProfile0CPU == 0)? false : true
        onCheckedChanged:
        {
            if(checked == true)
            {
                serverProductInfoPane.onlyLANAccess = true
            }
        }

        Label {
            id: profileHintLabel1
            width: 121
            height: 35
            text: "在同一個區域網路內使用，\n例如在辦公室或宿舍內分享。\n通常不需要額外設定路由器，\nIP將以第一次啟動時的設定為準，\n"
            wrapMode: Text.NoWrap
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 125
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }

        Image {
            id: image
            width: 100
            height: 100
            anchors.top: parent.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            source: "icon/ic_domain_black_48dp_2x.png"
        }
    }

    RadioButton {
        id: radioButton1
        x: 50
        y: 253
        text: qsTr("網際網路")
        anchors.horizontalCenterOffset: 175
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -100
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        visible: (serverProductInfoPane.itemProfile1CPU == 0)? false : true
        onCheckedChanged:
        {
            if(checked == true)
            {
                serverProductInfoPane.onlyLANAccess = false
            }
        }

        Label {
            id: profileHintLabel2
            width: 121
            height: 35
            text: "公開給全網路的人存取，\n需要設定路由器。\n若伺服器的使用者不在同一建築\n或區域內，請選擇此項。"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 125
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }

        Image {
            id: image1
            x: 0
            y: -8
            width: 100
            height: 100
            source: "icon/ic_public_black_48dp_2x.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 10
        }
    }

    AddServerModule_BottomPane{
        nextButtonText: "開始安裝"
        previousButtonText: "選擇連結埠"
        previousButtonVisible: true
        progressValue: 1.0
        previousButton.onClicked: {
            addServerPane_PortSetting.visible = true
            addServerPane_PlaceSetting.visible = false
        }
        nextButton.onClicked: {
            serverProductInfoPane.onlyLANAccess = radioButton.checked
            addServerPane_PlaceSetting.visible = false
            serverProductInfoPane.visible = false
            tmpCmd.runInstaller(serverProductInfoPane.itemIndex)
        }
    }

    Label {
        id: actionHintLabel
        x: 50
        y: 121
        width: 121
        height: 35
        text: "別人將會從哪裡連線到這台伺服器？"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: newServerTypeImage.bottom
        anchors.topMargin: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }
}
