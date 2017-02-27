import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addDownloadServerPane
    width: 823
    height: 579
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    BackButton{
        pageName: qsTr("新增已下載的伺服器")
        button.onClicked:{
            addDownloadServerPane.visible = false
        }
    }

    Label {
        id: serverTypeLabel
        width: 100
        height: 35
        text: "伺服器類型"
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 90
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

    }

    ComboBox {
        id: serverTypeComboBox
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 135
        currentIndex: 0
        textRole: "FTP 伺服器"

    }

    Label {
        id: serverNameLabel
        width: 100
        height: 35
        text: "伺服器名稱"
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 190
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"

    }

    TextField {
        id: serverNameTextField
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 235
        font.pointSize: 15
        horizontalAlignment: Text.AlignLeft


    }

    Pane {
        id: hintPane
        height: 100
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 300


        Image {
            id: addServerHintImage
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            source: "icon/ic_info_black_24dp.png"
        }

        Label {
            id: addServerHintLabel
            height: 70
            text: "您可以使用伺服器管理介面進行進一步的設定。"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 50
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"

        }
    }

    Button {
        id:addServerFinishedButton
        x: 649
        y: 431
        width: 100
        height: 50
        text: "完成"
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 75
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        onClicked: addingServerPane.visible = true
    }

    AddingServerPane{
        id:addingServerPane
        visible:false
    }
}
