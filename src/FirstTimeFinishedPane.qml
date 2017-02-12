import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

Pane {
    id: firstTimeFinishedPane
    objectName: "firstTimeFinishedPane"
    width: 1024
    height: 640
    padding: 0
    rightPadding: 0
    bottomPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.theme: Material.Dark

    Pane {
        id: pane
        y: 428
        height: 75
        z: 1
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        padding: 0
        Material.background: "#3e50b4"
        Material.elevation: 10

        Button {
            id: button
            x: 816
            y: 10
            width: 198
            text: qsTr("開始")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            font.family: "Microsoft JhengHei UI"
            anchors.right: parent.right
            font.pointSize: 18
            anchors.rightMargin: 0
            Material.background: "#3e50b4"
            Material.elevation: 0
            z: 1

            onClicked: {
                firstTimeFinishedPane.visible = false
                overviewPane.visible=true
            }

            Image {
                id: image
                x: 118
                y: 11
                width: 36
                height: 36
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 18
                source: "icon/ic_keyboard_arrow_right_white_36dp.png"
            }
        }
    }

    Image {
        id: image1
        x: 768
        y: 341
        width: 256
        height: 256
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        z: 0
        opacity: 0.3
        source: "icon/ic_check_white_48px.png"
    }

    Label {
        id: label
        x: 429
        y: 113
        text: qsTr("完成")
        font.family: "Microsoft JhengHei UI"
        anchors.verticalCenterOffset: -175
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 48
    }

    Label {
        id: label1
        x: 272
        y: 239
        text: qsTr("體驗隨選即用的伺服器！")
        anchors.verticalCenterOffset: -75
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
    }

    Label {
        id: label2
        x: 467
        y: 300
        text: qsTr("● 下載 SERVANT 商城上的伺服器，或使用別人分享的伺服器包裝\n\n● 容易備份而且更可靠\n\n● 此為測試版本")
        anchors.verticalCenterOffset: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 13
    }

}
