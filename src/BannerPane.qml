import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

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
    Label {
        id: label
        y: 260
        width: 171
        height: 24
        text: qsTr("SERVANT DevBuild")
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        z: 1
        anchors.left: parent.left
        anchors.leftMargin: 20
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 14
        horizontalAlignment: Text.AlignHCenter
    }

    Pane {
        id: pane
        width: 650
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 1
        anchors.right: button1.left
        anchors.rightMargin: 10
        anchors.left: label.right
        anchors.leftMargin: 15
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
            Material.elevation:1
            Material.background: "#2196F3"

            Image {
                id: image
                x: -137
                y: 235
                width: 100
                height: 100
                source: "qrc:/qtquickplugin/images/template_image.png"
            }
        }
    }

    Button {
        id: button1
        x: 911
        width: 40
        text: qsTr("")
        padding: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -5
        anchors.top: parent.top
        anchors.topMargin: -6
        anchors.right: button2.left
        anchors.rightMargin: 9
        Material.elevation:1
    }

    Button {
        id: button2
        width: 40
        text: qsTr("")
        padding: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        Material.elevation:1
    }

}
