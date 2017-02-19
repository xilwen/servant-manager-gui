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
    id: serverMallPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName:"serverMallPane"

    Pane {
          id: serverMallBanner
          height: 156
          anchors.top: parent.top
          anchors.topMargin: 20
          anchors.right: parent.right
          anchors.rightMargin: 20
          anchors.left: parent.left
          anchors.leftMargin: 20
          Material.theme: Material.Dark
          Material.elevation: 3

          Label {
              id: label1
              x: -4
              y: -1
              text: qsTr("伺服器商城")
              anchors.verticalCenterOffset: -20
              anchors.verticalCenter: parent.verticalCenter
              font.pointSize: 28
              anchors.leftMargin: 10
              anchors.left: parent.left
              font.family: qsTr("Microsoft JhengHei UI")
          }
          Label {
              id: label
              text: qsTr("探索並取得您需要的伺服器")
              font.pointSize: 14
              anchors.top: label1.bottom
              anchors.topMargin: 10
              anchors.left: label1.left
              anchors.leftMargin: 0
              font.family: qsTr("Microsoft JhengHei UI")
          }

          Button {
              id: button
              x: 470
              y: 111
              width: 126
              height: 40
              text: qsTr(" 線上服務設定")
              anchors.right: parent.right
              anchors.rightMargin: 0
              anchors.bottom: parent.bottom
              anchors.bottomMargin: 0
              font.family: "Microsoft JhengHei UI"
          }
      }
    
    Button {
        id: ftpserverbutton
        width: 345
        height: 84
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: serverMallBanner.bottom
        anchors.topMargin: 50
        Material.elevation: 6
        highlighted: true
        Material.background: "#FFFFFF"
        onClicked:{
            serverMallPane.visible=false
            serverProductInfoPane.visible=true
            overviewPane.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false

        }
        Label {
            id: ftplabel
            y: 26
            height: 32
            text: qsTr("FTP 伺服器")
            anchors.left: dataimage1.right
            anchors.leftMargin: 10
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Microsoft JhengHei UI"
            font.pointSize:12
            Material.foreground: "#000000"
        }
        
        Image {
            id: dataimage1
            width: 65
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            source: "icon/ic_folder_black_48dp_2x.png"
        }
    }
    Button {
        id: virtualboxbutton
        y: 251
        width: 345
        height: 84
        visible: false
        anchors.left: ftpserverbutton.right
        anchors.leftMargin: 50
        Material.background:"White"
        Material.elevation:6
        Image {
            id: dataimage2
            width: 65
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            source: "icon/ic_folder_black_48dp_2x.png"
        }
        Text {
            id: virtualboxlabel
            y: 24
            height: 36
            text: qsTr("從Virtual Box檔案建立新的伺服器")
            anchors.left: dataimage2.right
            anchors.leftMargin: 10
            verticalAlignment: Text.AlignVCenter
            font.family: "Microsoft JhengHei UI"
            font.pointSize:12
        }
    }
}







