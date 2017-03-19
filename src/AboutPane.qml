import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: aboutPane
    objectName: "aboutPane"
    property alias vmxSupported: vmxEnabledDataLabel.text
    property alias cpuRate: cpuRatingDataLabel.text
    property alias ramRate: ramRatingDataLabel.text
    property alias diskRate: diskRatingDataLabel.text
    property alias version: releaseDateLabel.text
    width: 848
    height: 480
    z: 99
    padding: 0
    Material.elevation: 8
    onVisibleChanged: {
        if(visible == true){
            mask.visible = true
            tmpCmd.updateAboutPane()
        } else{
            mask.visible = false
        }
    }

    Pane {
        id: bottomPane
        height: 50
        padding: 12
        z:3
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.elevation: 5
        Material.background: "white"
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
            text: "20170319"
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

        Button {
            id: licenseInfoButton
            width: 135
            height: 36
            text: qsTr("授權資訊")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            Material.elevation: 0
            font.pointSize: 14
            leftPadding: 8
            font.family: "Microsoft JhengHei UI"
        }

        Button {
            id: licenseInfoButton1
            x: -4
            y: -3
            width: 135
            height: 36
            text: qsTr("Github")
            anchors.leftMargin: 5
            Material.elevation: 0
            anchors.left: licenseInfoButton.right
            font.pointSize: 14
            anchors.bottomMargin: 10
            leftPadding: 8
            anchors.bottom: parent.bottom
            font.family: "Microsoft JhengHei UI"
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

    Label {
        id: vmxEnabledLabel
        x: 10
        width: 320
        height: 28
        text: "硬體虛擬化"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 0
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.WordWrap
        anchors.top: performanceTitleLabel.bottom
        anchors.left: performanceTitleLabel.left
        anchors.topMargin: 25
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"

        Label {
            id: vmxEnabledDataLabel
            x: 340
            y: 0
            width: 96
            height: 28
            text: "無資訊"
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 20
            horizontalAlignment: Text.AlignRight
            wrapMode: Text.WordWrap
            anchors.left: vmxEnabledLabel.right
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }
    }

    Label {
        id: cpuRatingLabel
        x: 5
        y: -4
        width: 320
        height: 28
        text: "處理器效能指標"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 0
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.WordWrap
        anchors.top: vmxEnabledLabel.bottom
        anchors.left: performanceTitleLabel.left
        anchors.topMargin: 12
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"

        Label {
            id: cpuRatingDataLabel
            x: -342
            y: 0
            width: 96
            height: 28
            text: "無資訊"
            anchors.left: parent.right
            anchors.leftMargin: 20
            anchors.verticalCenter: cpuRatingLabel.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            wrapMode: Text.WordWrap
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }
    }

    Label {
        id: ramRatingLabel
        x: 11
        y: -2
        width: 320
        height: 28
        text: "系統記憶體"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 0
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.WordWrap
        anchors.top: cpuRatingLabel.bottom
        anchors.left: performanceTitleLabel.left
        anchors.topMargin: 10
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"

        Label {
            id: ramRatingDataLabel
            x: -342
            y: 0
            width: 96
            height: 28
            text: "無資訊"
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 20
            horizontalAlignment: Text.AlignRight
            wrapMode: Text.WordWrap
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }
    }

    Label {
        id: diskRatingLabel
        x: 15
        y: 0
        width: 320
        height: 28
        text: "儲存裝置效能指標"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 0
        horizontalAlignment: Text.AlignLeft
        wrapMode: Text.WordWrap
        anchors.top: ramRatingLabel.bottom
        anchors.left: performanceTitleLabel.left
        anchors.topMargin: 10
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"

        Label {
            id: diskRatingDataLabel
            x: -342
            y: 0
            width: 96
            height: 28
            text: "無資訊"
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 20
            horizontalAlignment: Text.AlignRight
            wrapMode: Text.WordWrap
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }
    }
}
