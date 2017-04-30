import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: bannerPane
    width: 1024
    height: 75
    spacing: 10
    Layout.minimumWidth: 30
    Layout.maximumHeight: 60
    Layout.preferredHeight: 75
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    Material.background: "#ffffff"
    Material.elevation: 5
    Image {
        id: image3
        x: 12
        y: 2
        width: 150
        height: 27
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        source: "qrc:/icon/SERVANT-logo.png"
    }

    Label {
        id: managerlabel
        text: qsTr("Manager")
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: image3.right
        anchors.leftMargin: 8
        font.pointSize: 16
        font.family: "Microsoft JhengHei UI"
        Material.foreground: Material.Grey
    }

    Label {
        id: label
        y: 260
        width: 171
        height: 24
        text: qsTr("SERVANT Manager")
        visible: false
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        z: 1
        anchors.left: parent.left
        anchors.leftMargin: 12
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
        horizontalAlignment: Text.AlignHCenter
    }

    Pane {
        id: pane
        width: 650
        visible: false
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 1
        anchors.right: button1.left
        anchors.rightMargin: 10
        anchors.left: image3.right
        anchors.leftMargin: 10
        padding: 0
        Material.elevation: 3
        TextField {
            id: textField1
            width: 400
            anchors.bottomMargin: -9
            anchors.right: button.left
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.rightMargin: 0
            placeholderText: "搜尋線上商城和此電腦中的伺服器..."
            renderType: Text.QtRendering
            font.italic: true
            font.family: "Microsoft JhengHei UI"
        }

        Button {
            id: button
            x: 614
            text: qsTr("")
            rightPadding: 0
            leftPadding: 0
            padding: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -6
            anchors.top: parent.top
            anchors.topMargin: -6
            anchors.right: parent.right
            anchors.rightMargin: -1
            Material.elevation:0
            Material.background: "#2196F3"

            Image {
                id: image
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 18
                anchors.left: parent.left
                anchors.leftMargin: 18
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                source: "icon/ic_search_white.png"
            }
        }
    }

    Button {
        id: button1
        x: 911
        width: 40
        text: qsTr("")
        visible: false
        padding: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -5
        anchors.top: parent.top
        anchors.topMargin: -6
        anchors.right: button2.left
        anchors.rightMargin: 9
        Material.elevation:0
        Material.background: "White"

        Image {
            id: image1
            x: 0
            y: -1
            width: 32
            height: 32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "icon/ic_update_2x.png"
        }
    }

    Button {
        id: button2
        x: 960
        width: 40
        anchors.verticalCenterOffset: 0
        padding: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        Material.elevation:0
        Material.background: "White"

        Image {
            id: image2
            x: 0
            y: -9
            width: 32
            height: 32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "icon/ic_info_black_24dp.png"
        }

        onClicked: aboutPane.visible = true
    }



}
