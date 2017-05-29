import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Button {
    id:  overviewModuleServerQuickAction
    width: 345
    height: 84
    property alias quickActionButton: quickActionButton
    property alias imageSource: serverImage.source
    property alias name: nameLabel.text
    property alias type: typeLabel.text
    property alias quickActionName: quickActionLabel.text
    Material.background: "White"

    Image {
        id: serverImage
        y: 6
        width: 64
        height: 64
        anchors.left: parent.left
        anchors.leftMargin: 8
        source: ""
    }

    Label {
        id: nameLabel
        x: 86
        width: 96
        height: 30
        text: qsTr("伺服器名稱")
        anchors.top: parent.top
        anchors.topMargin: 14
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 16
        font.family: qsTr("Microsoft JhengHei UI")
    }

    Label {
        id: typeLabel
        x: 86
        y: 41
        width: 138
        height: 26
        text: qsTr("伺服器類型")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 14
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        color:"#616161"
        font.family: "Microsoft JhengHei UI"
    }

    Button {
        id: quickActionButton
        x: 0
        width: 345
        height: 47
        anchors.top: parent.top
        anchors.topMargin: 71
        Material.background: "White"
        onClicked:{}
        Label {
            id: quickActionLabel
            y: 297
            width: 154
            height: 25
            text: qsTr("快速動作")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
        }
    }



}


