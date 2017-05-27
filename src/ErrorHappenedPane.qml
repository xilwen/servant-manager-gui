import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: errorHappenedPane
    width: 500
    height: 200
    bottomPadding: 0
    Material.background: "white"
    Material.elevation: 8
    property alias title: errorHappenedTitleLabel.text
    property alias text: errorHappenedLabel.text
    z: 99

    onVisibleChanged: {
        if(visible)
        {
            mask.visible = true
        }else{
            mask.visible = false
        }
    }

    function open(titleText, textText)
    {
        title = titleText
        text = textText
        visible = true
    }

    Label {
        id: errorHappenedTitleLabel
        height: 30
        text: "錯誤"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pointSize: 20
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
    }

    Label {
        id: errorHappenedLabel
        height: 100
        text: qsTr("SERVANT背景服務發生異常。")
        wrapMode: Text.WordWrap
        anchors.top: errorHappenedTitleLabel.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pointSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        objectName: errorHappenedLabel
        font.family: qsTr("Microsoft JhengHei UI")
    }

    Button {
        id: button
        x: 358
        y: 100
        Material.background: "white"
        Material.foreground: Material.Teal
        Material.elevation:0
        font.pointSize: 13
        font.family: qsTr("Microsoft JhengHei UI")
        text: qsTr("確定")
        padding: 12
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        onClicked: {
            errorHappenedPane.visible = false
        }
    }
}
