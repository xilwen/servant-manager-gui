import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: aboutPane
    objectName: "aboutPane"
    property bool vmxSupported: false
    property alias cpuRate: cpuRatingLabel.label2
    property alias ramRate: ramRatingLabel.label2
    property alias diskRate: diskRatingLabel.label2
    property string version: "未知"
    width: 848
    height: 480
    z: 98
    padding: 0
    Material.elevation: 8
    onVisibleChanged: {
        if(visible){
            mask.visible = true
            tmpCmd.updateAboutPane()
        } else{
            mask.visible = false
        }
    }

    BottomPane {
        id: bottomPane
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Button {
            id: exitButton
            x: 572
            width: 180
            height: 48
            text: qsTr("關閉")
            leftPadding: 8
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            onClicked: aboutPane.visible = false
        }
    }

    Pane {
        id: softwareInfoPane
        x: 2
        width: 320
        z:2
        anchors.bottom: bottomPane.top
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0
        Material.elevation: 3
        padding: 12
        anchors.left: parent.left
        Material.theme: Material.Dark
        Label {
            id: nameLabel
            width: 180
            height: 35
            text: "SERVANT"
            visible: false
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 26
            font.family: "Microsoft JhengHei UI"
        }

        Label {
            id: releaseDateLabel
            x: -3
            y: -3
            width: 180
            height: 28
            text: "編譯日期：" + aboutPane.version
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 10
            horizontalAlignment: Text.AlignLeft
            anchors.top: nameLabel.bottom
            anchors.left: parent.left
            anchors.topMargin: 0
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
        }

        Label {
            id: wrapperStatusLabel
            x: -10
            width: 280
            height: 28
            text: "SERVANT 背景服務設定為於本機執行。"
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 10
            horizontalAlignment: Text.AlignLeft
            anchors.top: releaseDateLabel.bottom
            anchors.left: parent.left
            anchors.topMargin: 32
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
        }

        AboutModule_Button {
            id: licenseInfoButton
            title: qsTr("授權資訊")
            y: 360
            anchors.left: parent.left
            anchors.leftMargin: 10
            onClicked: tmpCmd.triggerStartURI("LICENSE")
        }

        AboutModule_Button {
            id: licenseInfoButton1
            title: qsTr("Github")
            y: 360
            anchors.left: licenseInfoButton.right
            anchors.leftMargin: 10
            onClicked: tmpCmd.triggerStartURI("https://github.com/xilwen/servant-manager-gui")
        }

        Image {
            id: image
            width: 220
            height: 35
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 20
            source: "icon/SERVANT-logo-dark.png"
        }
    }

    Label {
        id: performanceTitleLabel
        x: 5
        y: -5
        width: 180
        height: 35
        text: "效能資訊"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 20
        horizontalAlignment: Text.AlignLeft
        anchors.top: parent.top
        anchors.left: softwareInfoPane.right
        anchors.topMargin: 32
        font.pointSize: 26
        font.family: "Microsoft JhengHei UI"

    }

    AboutModule_Label {
        id: vmxEnabledLabel
        text:qsTr("硬體虛擬化")
        label2: (vmxSupported)? "支援" : "不支援/未知"
        x: 340
        anchors.top: performanceTitleLabel.bottom
        anchors.topMargin: 25
    }
    AboutModule_Label {
        id: cpuRatingLabel
        text:qsTr("處理器效能指標")
        label2:qsTr("無資訊")
        x: 340
        anchors.top: vmxEnabledLabel.bottom
        anchors.topMargin: 10
    }
    AboutModule_Label {
        id: ramRatingLabel
        text:qsTr("系統記憶體")
        label2:qsTr("無資訊")
        x: 340
        anchors.top: cpuRatingLabel.bottom
        anchors.topMargin: 10
    }
    AboutModule_Label {
        id: diskRatingLabel
        text:qsTr("儲存裝置效能指標")
        label2:qsTr("無資訊")
        x: 340
        visible: false
        anchors.top: ramRatingLabel.bottom
        anchors.topMargin: 10
    }
}
