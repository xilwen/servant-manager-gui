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
        x: 123
        y: 162
        width: 306
        height: 81
        anchors.top: text2.bottom
        anchors.topMargin: 50
        Material.background: "White"
        Material.elevation: 6
        Text {
            id: text1
            width: 50
            height: 29
            text: qsTr("記錄")
            anchors.top: parent.top
            anchors.topMargin: 19
            anchors.left: reorderimage.right
            anchors.leftMargin: 10
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.family: "Microsoft JhengHei UI"
        }

        Image {
            id: reorderimage
            width: 55
            anchors.left: parent.left
            anchors.leftMargin: 13
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 13
            anchors.top: parent.top
            anchors.topMargin: 13
            source: "icon/ic_reorder_black_24dp_2x.png"
        }
    }

    Label {
        id: label
        x: 20
        y: 18
        width: 204
        height: 57
        text: qsTr("SERVANT")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }








}
