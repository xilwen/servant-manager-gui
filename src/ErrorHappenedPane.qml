import QtQuick.Layouts 1.0
import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2
import QtQuick 2.0

Pane {
    id: errorHappenedPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    Material.background: "#bdbdbd"

    Pane {
        id: dialog
        height: 150
        anchors.right: parent.right
        anchors.rightMargin: 200
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: parent.top
        anchors.topMargin: 177
        Material.background: "white"
        Material.elevation: 8

        Label {
          id: errorHappenedTitleLabel
          width: 380
          height: 30
          text: "錯誤"
          font.bold: true
          font.pointSize: 20
          verticalAlignment: Text.AlignVCenter
          font.family: "Microsoft JhengHei UI"
          Material.foreground: Material.Red

        }

        Label {
            id: errorHappenedLabel
            x: 0
            y: 38
            width: 380
            height: 100
            text: "SERVANT背景服務發生異常。"
            font.pointSize: 15
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            objectName: errorHappenedLabel
            font.family: "Microsoft JhengHei UI"

        }
    }
}
