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
    id: diagnosisPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    Button {
        id: checkserverbutton
        x: 18
        width: 345
        height: 84
        anchors.top: text2.bottom
        anchors.topMargin: 50
        Material.background: "White"
        Material.elevation: 6
        Text {
            id: text1
            width: 236
            height: 29
            text: qsTr("檢視SERVANT紀錄")
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.left: reorderimage.right
            anchors.leftMargin: 10
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }

        Image {
            id: reorderimage
            width: 65
            height: 65
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            source: "icon/ic_reorder_black_24dp_2x.png"
        }
    }


        Text {
            id: text2
            width: 313
            height: 41
            text: qsTr("Watchdog服務尚未啟動")
            anchors.top: parent.top
            anchors.topMargin: 18
            anchors.left: parent.left
            anchors.leftMargin: 18
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 22
            font.family: "Microsoft JhengHei UI"
        }

        Text {
            id: text3
            x: 18
            width: 245
            height: 33
            text: qsTr("無法使用機器狀態監視功能。")
            verticalAlignment: Text.AlignVCenter
            anchors.top: text2.bottom
            anchors.topMargin: -4
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
            color:"#616161"
        }







}
