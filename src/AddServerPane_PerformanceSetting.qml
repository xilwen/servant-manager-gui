import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addServerPane_PerformanceSetting
    width: 823
    height: 579
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    property int performanceProfile: 0
    z: 3

    BackButton{
        showBackButton: false
        pageName: qsTr("安裝新伺服器 - 選擇效能需求")
        button.onClicked:{
            addDownloadServerPane.visible = false
        }
    }

    Image {
        id: newServerTypeImage
        width: 48
        height: 48
        anchors.top: parent.top
        anchors.topMargin: 65
        anchors.left: parent.left
        anchors.leftMargin: 50
        source: serverProductInfoPane.itemIcon
    }

    Image {
        id: addServerHintImage
        y: 235
        width: 48
        height: 48
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 75
        source: "icon/ic_info_black_24dp.png"
    }

    Label {
        id: serverTypeLabel
        x: 1
        y: 2
        width: 121
        height: 35
        text: serverProductInfoPane.itemName
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 15
        horizontalAlignment: Text.AlignLeft
        anchors.top: newServerTypeImage.bottom
        anchors.left: newServerTypeImage.right
        anchors.topMargin: -41
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }

    Label {
        id: addServerHintLabel
        y: 5
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

    RadioButton {
        id: radioButton
        x: 50
        y: 162
        text: qsTr("輕量級")
        anchors.horizontalCenterOffset: -250
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -100
        anchors.verticalCenter: parent.verticalCenter
        checked: false
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        visible: (serverProductInfoPane.itemProfile0CPU == 0)? false : true
        onCheckedChanged:
        {
            if(checked == true)
            {
                performanceProfile = 0
            }
        }

        Label {
            id: profileHintLabel1
            width: 121
            height: 35
            text: "2~3 人使用\n" + serverProductInfoPane.itemProfile0CPU.toString() +" CPU\n" + serverProductInfoPane.itemProfile0RAM.toString() + "MB RAM\n"
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
            source: "icon/ic_directions_bike_black_48dp_2x.png"
        }
    }

    RadioButton {
        id: radioButton1
        x: 50
        y: 253
        text: qsTr("中量級")
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
                performanceProfile = 1
            }
        }

        Label {
            id: profileHintLabel2
            width: 121
            height: 35
            text: "7~8 人使用\n" + serverProductInfoPane.itemProfile1CPU.toString() +" CPU\n" + serverProductInfoPane.itemProfile1RAM.toString() + "MB RAM\n"
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
            source: "icon/ic_directions_car_black_48dp_2x.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 10
        }
    }

    RadioButton {
        id: radioButton2
        x: 50
        y: 344
        text: qsTr("重量級")
        anchors.horizontalCenterOffset: 250
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -100
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        visible: (serverProductInfoPane.itemProfile2CPU == 0)? false : true
        onCheckedChanged:
        {
            if(checked == true)
            {
                performanceProfile = 2
            }
        }

        Label {
            id: profileHintLabel3
            width: 121
            height: 35
            text: "15 人使用\n" + serverProductInfoPane.itemProfile2CPU.toString() +" CPU\n" + serverProductInfoPane.itemProfile2RAM.toString() + "MB RAM\n"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 125
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }

        Image {
            id: image2
            x: 6
            y: -2
            width: 100
            height: 100
            source: "icon/ic_flight_black_48dp_2x.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 10
        }
    }


    AddServerModule_BottomPane{
        nextButtonText: "選擇連結埠"
        previousButtonText: "上一步"
        previousButtonVisible: true
        progressValue: 0.5
        previousButton.onClicked: {
            addServerPane.visible = true
            addServerPane_PerformanceSetting.visible = false
        }
        nextButton.onClicked: {
            addServerPane_PerformanceSetting.visible = false
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
        text: "請選擇適合使用情境的效能設定檔"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: newServerTypeImage.bottom
        anchors.topMargin: 5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }
}
