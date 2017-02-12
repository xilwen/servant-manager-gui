import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2
import QtQuick 2.0


Pane {
    id: settingPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    Button {
        id: settingbutton
        x: 8
        width: 345
        height: 84
        anchors.left: parent.left
        anchors.leftMargin: 18
        anchors.top: parent.top
        anchors.topMargin: 62
        Material.background: "White"
        Material.elevation: 6
        Text {
            id: onlineservertext1
            width: 161
            height: 29
            text: qsTr("線上服務來源")
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.left: parent.left
            anchors.leftMargin: 16
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }

        Text {
            id: onlineservertext2
            y: 46
            width: 287
            height: 33
            text: qsTr("設定線上服務的來源伺服器")
            anchors.left: parent.left
            anchors.leftMargin: 16
            verticalAlignment: Text.AlignTop
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
            color:"#616161"
        }
    }

    Button {
        id: editbutton
        x: 18
        width: 345
        height: 84
        anchors.top: settingbutton.bottom
        anchors.topMargin: 40
        anchors.left: editbutton.right
        anchors.leftMargin: 77
        Material.background: "White"
        Material.elevation: 6
        Text {
            id: edittext1
            width: 161
            height: 29
            text: qsTr("設定檔編輯")
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.left: parent.left
            anchors.leftMargin: 16
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }

        Text {
            id: edittext2
            y: 46
            width: 287
            height: 33
            text: qsTr("設定偏好的文字編輯器")
            anchors.left: parent.left
            anchors.leftMargin: 16
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
            color:"#616161"
        }

    }

    Button {
        id: concernbutton
        y: 62
        width: 345
        height: 84
        anchors.left: settingbutton.right
        anchors.leftMargin: 50
        anchors.top: button.bottom
        anchors.topMargin: 63
        Material.background: "White"
        Material.elevation: 6
        Text {
            id: concerntext1
            width: 161
            height: 29
            text: qsTr("關於")
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.top: parent.top
            anchors.topMargin: 17
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }

        Text {
            id: concerntext2
            y: 46
            width: 287
            height: 33
            text: qsTr("SERVANT_test_build")
            anchors.left: parent.left
            anchors.leftMargin: 16
            font.pointSize: 12
            font.family: "Microsoft JhengHei UI"
            color:"#616161"
        }
    }
}


